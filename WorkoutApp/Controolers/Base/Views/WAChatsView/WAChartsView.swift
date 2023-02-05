//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 02.02.2023.
//

import UIKit

extension WAChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

final class WAChartsView: WABaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()


    func configure(with data: [WAChartsView.Data], topChartOffset: Int = 10) {
        yAxisView.congigure(with: data)
        xAxisView.congigure(with: data)
        chartView.congigure(with: data, topChartOffset: topChartOffset)

    }
}


extension WAChartsView {
    override func setupViews() {
        super.setupViews()

        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)



    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
            

        ])
        
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}


