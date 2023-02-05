//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 19.01.2023.
//

import UIKit

class OverviewController: WABaseController {
    
    private let navBar = OverviewNavBar()

}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(navBar)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            navBar.heightAnchor.constraint(equalToConstant: 113),
        ])
    }
}


