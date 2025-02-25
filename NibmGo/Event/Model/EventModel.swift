import SwiftUI

struct EventModel: Identifiable {
    var id: UUID = UUID()
    var eventName: String
    var eventDayInString: String
    var imageUrl: String
    var description: String
    var longiture: Double
    var latitude: Double
    var address: String
    var time: String
    var organizer: String
    var isFollowFaceBook: Bool
    var isFollowInstagram: Bool
    var isFollowX: Bool
    var isSubscribed: Bool
}
