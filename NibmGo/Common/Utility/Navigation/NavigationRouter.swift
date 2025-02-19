import SwiftUI

class NavigationRouter: ObservableObject {
    @Published var pathOutside: [String] = []
    @Published var universityEmail: String = ""
    @Published var commingFrom: String = ""
}
