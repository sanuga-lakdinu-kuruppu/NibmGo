import SwiftUI

struct User: Identifiable {
    var id: UUID = UUID()
    var username: String
    var password: String
    var role: UserType
}
