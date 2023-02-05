//
//  MonthlyPerformance.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 02.02.2023.
//

import UIKit

final class MonthlyPerformance: WABaseInfoView {
    
    private let chartsView = WAChartsView()

    func configure(with itmes: [WAChartsView.Data], topChartOffset: Int) {
        chartsView.configure(with: itmes, topChartOffset: topChartOffset)
    }
    
}

extension MonthlyPerformance {
    
    override func setupViews() {
        super.setupViews()
        setupView(chartsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        
        
    }
}
