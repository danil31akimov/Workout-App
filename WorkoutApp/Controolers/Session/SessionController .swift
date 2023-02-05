//
//  SessionController .swift
//  WorkoutApp
//
//  Created by Данил Акимов on 24.01.2023.
//


import UIKit

 final class SessionController: WABaseController {

    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Sesion.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Sesion.stepsCounter)

    private let timeDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer { progress in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.navBarRightButtonHandler()
                }
            }
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForNavBarButton(timerView.state == .isRunning ? R.Strings.Sesion.navBarPause : R.Strings.Sesion.navBarStart,
                                at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(R.Strings.Sesion.navBarStart,
                                at: .left)
    }
}


extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
                
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavButton(at: .left, with: R.Strings.Sesion.navBarPause)
        addNavButton(at: .right, with: R.Strings.Sesion.navBarFinish)
        
        timerView.configure(with: timeDuration, progress: 0.5)
        
        timerView.callBack = { progress in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navBarRightButtonHandler()
                print(progress)
            }
        }
        
        statsView.congigure(with: [.averagePace(value: "8'20''"),
                                   .heartRate(value: "155"),
                                   .totalSteps(value: "7,682"),
                                   .totalDistance(value: "11,2")
                                  ])
        stepsView.configure(with: [
                            .init(value: "8k", heightMultiplier: 1, title: "2/14"),
                            .init(value: "7K", heightMultiplier: 0.8, title: "2/15"),
                            .init(value: "5K", heightMultiplier: 0.6, title: "2/16"),
                            .init(value: "6K", heightMultiplier: 0.7, title: "2/17")

                                  ])
    }
}
