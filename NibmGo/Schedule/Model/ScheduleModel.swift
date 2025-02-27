import SwiftUI

struct ScheduleModel: Identifiable {
    var id = UUID()
    var lecturer: String
    var module: String
    var dateTimeInString: String
}
