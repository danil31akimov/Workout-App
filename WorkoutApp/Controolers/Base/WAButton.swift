//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 27.01.2023.
//

import UIKit

public enum WAButtonType {
    case secondary
    case primary
}

final class WAButton: UIButton {
    
    
    private var type: WAButtonType = .primary
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        setupViews()
        constraintViews()
        configureAppearance()
        

    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)

        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension WAButton {
    func setupViews() {
        setupView(label)
        setupView(iconView)
    }
    
    func constraintViews() {
        
        var horizontalOffset: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }
        
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            
        ])
    }
    
    func configureAppearance() {
        switch type {
        case .primary:
            label.textColor = R.Colors.inActive
            iconView.tintColor = R.Colors.inActive
            label.font = R.Fonts.helveticaRegular(with: 13)

            
        case .secondary:
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            label.textColor = R.Colors.active
            label.font = R.Fonts.helveticaRegular(with: 15)
            label.textAlignment = .center
            iconView.tintColor = R.Colors.active

        }
        
        makeSystem(self)
        
        iconView.image = R.Image.Common.downArrow?.withRenderingMode(.alwaysTemplate)
    }
}
