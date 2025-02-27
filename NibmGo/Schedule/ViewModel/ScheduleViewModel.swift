import SwiftUI

class ScheduleViewModel{
    
    static let shared = ScheduleViewModel()
    private init() {}
    
    func getAllSchedule() -> [ScheduleModel] {
        let schedules = [
            
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                module:"WEB DEVELOPMENT",
                dateTimeInString: "13 Feb 2025 - 08:30 AM - 11:30 AM "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                module:"WEB DEVELOPMENT",
                dateTimeInString: "13 Feb 2025 - 12:30 PM - 03:30 PM "
            ),
            ScheduleModel(
                lecturer: "Mr. kamal Perera  ",
                module:"IOT",
                dateTimeInString: "15 Feb 2025 - 08:30 AM - 10:30 AM  "
            ),
            ScheduleModel(
                lecturer: "Mr. Samira Yapa ",
                module:"ECS",
                dateTimeInString: "15 Feb 2025 - 12:30 PM - 03:30 PM "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                module:"WEB DEVELOPMENT",
                dateTimeInString: "17 Feb 2025 - 08:30 AM - 11:30 AM "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                module:"WEB DEVELOPMENT",
                dateTimeInString: "17 Feb 2025 - 12:30 PM - 03:30 PM  "
            ),
            ScheduleModel(
                lecturer: "Mr. Rukshan Karunanayake ",
                module:"WEB DEVELOPMENT",
                dateTimeInString: "17 Feb 2025 - 12:30 PM - 03:30 PM  "
            )
        ]
        
        return schedules
    }
}
