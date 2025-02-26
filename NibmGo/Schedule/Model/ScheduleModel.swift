

import SwiftUI

struct ScheduleModel: Identifiable {
    var id = UUID()             
    var lecturer: String
    var subject: String
    var dateTime: String
}
