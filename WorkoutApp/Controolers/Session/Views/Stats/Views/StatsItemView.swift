//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 01.02.2023.
//

import UIKit

enum StatsItem {
    case averagePace(value: String)
    case heartRate(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .averagePace(let value):
            return .init(image: R.Image.Session.Stats.averagePace,
                         value: value + " / km",
                         title: R.Strings.Sesion.averagePace)
        case .heartRate(let value):
            return .init(image: R.Image.Session.Stats.heartRate,
                         value: value + " bpm",
                         title: R.Strings.Sesion.heartRate)
        case .totalDistance(let value):
            return .init(image: R.Image.Session.Stats.totalDistance,
                         value: value + " / km",
                         title: R.Strings.Sesion.totalDistance)
        case .totalSteps(let value):
            return .init(image: R.Image.Session.Stats.totalSteps,
                         value: value,
                         title: R.Strings.Sesion.totalSteps)
        }
    }
}



final class StatsItemView: WABaseView {
        
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 10)
        label.textColor = R.Colors.inActive
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        return stack
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title
    }
}

extension StatsItemView {
    override func setupViews() {
        super.setupViews()
        setupView(imageView)
        setupView(stackView)
        
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            

        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}



