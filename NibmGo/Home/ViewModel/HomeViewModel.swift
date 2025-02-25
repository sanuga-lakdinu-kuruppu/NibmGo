import SwiftUI

class HomeViewModel {
    static let shared = HomeViewModel()

    private init() {}

    func getUpcommingEvents() -> [EventModel] {
        let upcomingEvents: [EventModel] = [
            .init(
                eventName: "New Year 2025",
                eventDayInString: "Mon, Jan 01, 2025",
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk_2RQ7xCmTyX6LyG67JUbl7F4J3-Y_Zk4Lg&s"

            ),
            .init(
                eventName: "Award Ceromony 2025",
                eventDayInString: "Tue, Mar 13, 2025",
                imageUrl:
                    "https://media.istockphoto.com/id/1358059564/vector/golden-stadium-lights-with-rays.jpg?s=612x612&w=0&k=20&c=VP1m8Xjc7I3H54ZpZf94vb2ycPL0C9jG43SmqrKQyvs="

            ),
            .init(
                eventName: "Workshop AI - 101",
                eventDayInString: "Fri, Aug 12, 2025",
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvkUFmp5jSF-DhrD5102bzHU7RbidetfqYfA&s"
            ),
        ]

        return upcomingEvents
    }
}
