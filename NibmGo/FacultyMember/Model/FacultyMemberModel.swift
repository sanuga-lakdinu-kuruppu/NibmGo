import SwiftUI

struct FacultyMemberModel: Identifiable {
    var id: UUID = UUID()
    var title: String
    var firstName: String
    var lastName: String
    var department: String
    var designation: String
    var email: String
    var phone: String
    var isPinned: Bool
    var isAvailable: Bool
    var isWhatsapp: Bool
    var isEmail: Bool
    var isCall: Bool
}
