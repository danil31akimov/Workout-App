//
//  Resources.swift
//  WorkoutApp
//
//  Created by Данил Акимов on 19.01.2023.
//

import Foundation
import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        static let titleGray = UIColor(hexString: "#545C77")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
        static let subTitleGray = UIColor(hexString: "#D8D8D8")
        
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
            
            enum NavBar {
                static let overview = "Today"
                static let session = "High Intensity Cardio"
                static let progress = "Workout Progress"
                static let settings = "Settings"
            }
            
            enum Progress {
                static let navBarLeft = "Export"
                static let navBarRight = "Details"
                
                static let dailyPerformance = "Daily performance"
                static let last7days = "Last 7 days"
                
                static let monthlyPerformance = "Monthly performance"
                static let last10months = "Last 10 months"
            }
            
            enum Overview {
                static let allWorkoutsButton = "All Workouts"
            }
        
            enum Sesion {
                static let elapsedTime = "Elapsed Time"
                static let remainingTime = "Remaining Time"
                static let navBarStart = "Start   "
                static let navBarPause = "Pause"
                static let navBarFinish = "Finish"
                
                
                static let workoutStats = "Workout stats"
                static let averagePace = "Average pace"
                static let heartRate = "Heart rate"
                static let totalDistance = "Total distance"
                static let totalSteps = "Total steps"
                
                static let stepsCounter = "Steps Counter"
            }
            
        }
        
        
        
        
        enum Image {
            enum TabBar {
                static func icon(for tab: Tabs) -> UIImage? {
                    switch tab {
                    case .overview: return UIImage(named: "overview_tab")
                    case .session: return UIImage(named: "session_tab")
                    case .progress: return UIImage(named: "progress_tab")
                    case .settings: return UIImage(named: "settings_tab")
                    }
                }
                
            }
                enum Common {
                    static let downArrow = UIImage(named: "down_arrow")
                    static let addButton = UIImage(named: "add_button")
                }
            
            enum Session {
                enum Stats {
                    static let averagePace = UIImage(named: "stats_averagePace")
                    static let heartRate = UIImage(named: "stats_heartRate")
                    static let totalDistance = UIImage(named: "stats_totalDistance")
                    static let totalSteps = UIImage(named: "stats_totalSteps")
                        }
                    }
            }
            
            enum Fonts {
                static func helveticaRegular(with size: CGFloat) -> UIFont {
                    UIFont(name: "Helvetica", size: size) ?? UIFont()
                }
            }
            
}
