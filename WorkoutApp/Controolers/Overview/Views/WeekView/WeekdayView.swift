//
//  WeekdayView.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 29.01.2023.
//

import UIKit

extension WeekView {
    
    final class WeekdayView: WABaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String ) {
            
            let startOfWeek = Date().startOfWeek
            let currentday = startOfWeek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentday)
            
            let istooday = currentday.stripTime() == Date().stripTime()
            
            backgroundColor = istooday ? R.Colors.active : R.Colors.background
            
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = istooday ? .white : R.Colors.inActive
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = istooday ? .white : R.Colors.inActive
        }
        
    }
}

extension WeekView.WeekdayView {
   override func setupViews() {
       super.setupViews()
       setupView(stackView)
       
       stackView.addArrangedSubview(nameLabel)
       stackView.addArrangedSubview(dateLabel)

   }
    
   override func configureAppearance() {
       super.configureAppearance()
       
       layer.cornerRadius = 5
       layer.masksToBounds = true
       
       
       stackView.spacing = 3
       stackView.axis = .vertical
        
       nameLabel.font = R.Fonts.helveticaRegular(with: 9)
       nameLabel.textAlignment = .center
       
       dateLabel.font = R.Fonts.helveticaRegular(with: 15)
       dateLabel.textAlignment = .center
   }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}
