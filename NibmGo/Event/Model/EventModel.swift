import SwiftUI

struct EventModel: Identifiable {
    var id: UUID = UUID()
    var eventName: String
    var eventDayInString: String
    var imageUrl: String
}
