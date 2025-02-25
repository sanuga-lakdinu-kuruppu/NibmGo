import SwiftUI

struct FacultyMember: Identifiable {
    let id: UUID = UUID()
    let facultyName: String
    let designation: String
    let email: String
    let phone: String
    let isPinned: Bool
    let isAvailable: Bool
    let isWhatsapp: Bool
    let isEmail: Bool
    let isCall: Bool
}
