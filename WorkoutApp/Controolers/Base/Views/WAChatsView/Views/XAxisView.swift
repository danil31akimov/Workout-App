//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 02.02.2023.
//

import UIKit

final class XAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        return stack
    }()
    
    func congigure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 9)
            label.textColor = R.Colors.inActive
            label.text = $0.title.uppercased()
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
    }
}


extension XAxisView {
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
