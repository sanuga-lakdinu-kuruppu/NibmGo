import SwiftUI

class NavigationRouter: ObservableObject {
    @Published var paths: [String] = []
    @Published var universityEmail: String = ""
    @Published var commingFrom: String = ""
}
