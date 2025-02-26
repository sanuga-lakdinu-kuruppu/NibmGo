import SwiftUI

class ScheduleViewModel{
    
    static let shared = ScheduleViewModel()
    private init() {}
    
    func getAllSchedule() -> [ScheduleModel] {
        let schedule = [
            
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                subject:"WEB DEVELOPMENT",
                dateTime: "13 Feb 2025 - 08:30 AM - 11:30 AM "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                subject:"WEB DEVELOPMENT",
                dateTime: "13 Feb 2025 - 12:30 PM - 03:30 PM "
            ),
            ScheduleModel(
                lecturer: "Mr. kamal Perera  ",
                subject:"IOT",
                dateTime: "15 Feb 2025 - 08:30 AM - 10:30 AM  "
            ),
            ScheduleModel(
                lecturer: "Mr. Samira Yapa ",
                subject:"ECS",
                dateTime: "15 Feb 2025 - 12:30 PM - 03:30 PM "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                subject:"WEB DEVELOPMENT",
                dateTime: "17 Feb 2025 - 08:30 AM - 11:30 AM "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                subject:"WEB DEVELOPMENT",
                dateTime: "17 Feb 2025 - 12:30 PM - 03:30 PM  "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                subject:"WEB DEVELOPMENT",
                dateTime: "17 Feb 2025 - 12:30 PM - 03:30 PM  "
            )
        ]
        
        return schedule
    }
}
