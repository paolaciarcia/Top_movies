//
//  CircularProgressView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

struct CircularProgressViewState {
    let progress: CGFloat
    let progressColor: UIColor
}

final class CircularProgressView: UIView {

    private let backgroundRoundColor = CAShapeLayer()
    private let remainderProgressLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()

    private var progress: CGFloat = 0.0
    private var progressColor: UIColor = .green

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2.0

        let startAngle: CGFloat = -CGFloat.pi / 2
        let endAngle = startAngle + progress * 2 * CGFloat.pi
        let borderPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        let borderPathRemainder = UIBezierPath(arcCenter: center, radius: radius, startAngle: endAngle, endAngle: startAngle, clockwise: true)

        backgroundRoundColor.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        backgroundRoundColor.fillColor = UIColor(hexString: "#1C1C1E")?.cgColor

        progressLayer.path = borderPath.cgPath
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 5.0
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor

        remainderProgressLayer.path = borderPathRemainder.cgPath
        remainderProgressLayer.lineWidth = 5.0
        remainderProgressLayer.strokeColor = UIColor.systemGray4.cgColor
        remainderProgressLayer.fillColor = UIColor.clear.cgColor

        layer.addSublayer(backgroundRoundColor)
        layer.addSublayer(remainderProgressLayer)
        layer.addSublayer(progressLayer)
    }

    func update(state: CircularProgressViewState) {
        progress = state.progress
        progressColor = state.progressColor
        setNeedsDisplay()
    }
}
