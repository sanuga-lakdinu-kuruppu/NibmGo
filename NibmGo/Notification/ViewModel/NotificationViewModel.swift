import SwiftUI

class NotificationViewModel {
    static let shared = NotificationViewModel()

    private init() {}

    func getNotification() -> [NotificationModel] {
        let notifications: [NotificationModel] = [
            .init(
                title: "Cafeteria Rush Alert",
                message:
                    "Cafeteria is currently busy. Consider 2nd floor lunch area for dinning purpose.",
                day: "2025-02-02"),
            .init(
                title: "IOS Lab Availability Alert",
                message:
                    "All the machines in the IOS lab is currently being used. Please waiting until someone release it.",
                day: "2025-02-01"),
        ]
        return notifications
    }
}
