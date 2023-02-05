//
//  YAxisView.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 02.02.2023.
//

import UIKit

final class YAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    func congigure(with data: [WAChartsView.Data]) {
        
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 9)
            label.textColor = R.Colors.inActive
            label.textAlignment = .right
            label.text = "\($0 * 10)" // TODO: Cделать корректное вычисление интервалов
            
            stackView.addArrangedSubview(label)
        }
    }
}


extension YAxisView {
    override func setupViews() {
        super.setupViews()
        
        
        setupView(stackView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
    
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            
        ])
        
        
    }
    
}
