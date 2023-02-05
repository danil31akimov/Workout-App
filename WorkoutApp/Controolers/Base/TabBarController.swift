//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 19.01.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        
        view.backgroundColor = .white
        configure()
        switchTo(tab: .progress)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configure() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inActive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
                    let controller = NavBarController(rootViewController: getController(for: tab))
                    controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                         image: R.Image.TabBar.icon(for: tab),
                                                         tag: tab.rawValue)
                    return controller
                }
        

        setViewControllers(controllers, animated: true)

    }
    
    private func getController(for tab: Tabs) -> WABaseController {
           switch tab {
           case .overview: return OverviewController()
           case .session: return SessionController()
           case .progress: return ProgressController()
           case .settings: return SettingsController()
           }
       }
}
