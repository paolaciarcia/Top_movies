//
//  CircularProgressView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

final class CircularProgressView: UIView {

    var avarageText: String {
        didSet {
            averageLabel.text = avarageText
        }
    }

    var color: UIColor

    var progress: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }

    init(avarageText: String,
         color: UIColor,
         progress: CGFloat) {
        self.avarageText = avarageText
        self.color = color
        self.progress = progress
        super.init(frame: .zero)
        setup()
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
        borderPathRemainder.lineWidth = 10.0
        UIColor.systemGray4.setStroke()
        borderPathRemainder.stroke()

        borderPath.lineWidth = 10.0
        color.setStroke()
        borderPath.stroke()
    }

//    private let ratingLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Rating"
//        label.font = UIFont(name: "SF Pro Rounded", size: 18)
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

        private let averageLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "SF Pro Rounded", size: 24)
            label.textColor = .white
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(averageLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            averageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            averageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            averageLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
//            averageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
