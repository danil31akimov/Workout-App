//
//  DailyPerformanceView.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 01.02.2023.
//

import UIKit

final class DailyPerformanceView: WABaseInfoView {

    private let barsView = WABarsView()

    func configure(with itmes: [WABarView.Data]) {
        barsView.configure(with: itmes)
    }
}

extension DailyPerformanceView {
    override func setupViews() {
        super.setupViews()

        setupView(barsView)
    }

    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}
