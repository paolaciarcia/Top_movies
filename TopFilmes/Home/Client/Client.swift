//
//  Client.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

public typealias HttpHeaders = [String: String]
public typealias HttpParameters = [String: Any]

protocol ClientProtocol {
    func request<T: Decodable>(url: URL,
                               method: HTTPMethod,
                               headers: HttpHeaders,
                               parameters: HttpParameters,
                               completion: @escaping(Result<T, ClientError>) -> Void)
}

final class Client {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension Client: ClientProtocol {
    func request<T>(url: URL,
                    method: HTTPMethod,
                    headers: HttpHeaders,
                    parameters: HttpParameters,
                    completion: @escaping (Result<T, ClientError>) -> Void) where T: Decodable {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        if method != .get {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }

        session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                let unknownStatusCode = 666
                let clientError = ClientError(reason: .api(error?.localizedDescription), statusCode: unknownStatusCode)
                completion(.failure(clientError))
                return
            }

            let statusCode = httpResponse.statusCode

            if let error = error {
                let clientError = ClientError(reason: .api(error.localizedDescription), statusCode: statusCode)
                completion(.failure(clientError))
                return
            }

            guard let data = data else {
                let clientError = ClientError(reason: .invalidData, statusCode: statusCode)
                completion(.failure(clientError))
                return
            }

            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            } catch let error {
                let clientError = ClientError(reason: .decoding(error), statusCode: statusCode)
                completion(.failure(clientError))
            }
        }.resume()
    }
}
