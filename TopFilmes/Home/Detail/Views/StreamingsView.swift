//
//  StreamingsView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 13/09/23.
//

import UIKit

final class StreamingsView: UIView {

    private let streamingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Streamings"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var streamingsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal

        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(StreamingViewCell.self, forCellWithReuseIdentifier: String(describing: StreamingViewCell.self))
        collection.backgroundColor = UIColor(hexString: "#202D3C")
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        return collection
    }()

    init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StreamingsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
