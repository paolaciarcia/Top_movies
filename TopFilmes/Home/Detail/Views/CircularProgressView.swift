//
//  CircularProgressView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

final class CircularProgressView: UIView {

    private var backgroundRoundColor = CAShapeLayer()
    private var remainderProgressLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var progressColor: UIColor

    private var progress: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }

    init(color: UIColor,
         progress: CGFloat) {
        self.progressColor = color
        self.progress = progress
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2.0

        let startAngle: CGFloat = -CGFloat.pi / 2
        let endAngle = startAngle + progress * 2 * CGFloat.pi
        let borderPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        let borderPathRemainder = UIBezierPath(arcCenter: center, radius: radius, startAngle: endAngle, endAngle: startAngle, clockwise: true)

        backgroundRoundColor.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        backgroundRoundColor.fillColor = UIColor.red.cgColor

        progressLayer.path = borderPath.cgPath
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor

        remainderProgressLayer.path = borderPathRemainder.cgPath
        remainderProgressLayer.lineWidth = 10.0
        remainderProgressLayer.strokeColor = UIColor.systemGray4.cgColor
        remainderProgressLayer.fillColor = UIColor.clear.cgColor

        layer.addSublayer(backgroundRoundColor)
        layer.addSublayer(remainderProgressLayer)
        layer.addSublayer(progressLayer)
    }

//    private let ratingLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Rating"
//        label.font = UIFont(name: "SF Pro Rounded", size: 18)
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

}
