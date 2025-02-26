import SwiftUI

struct TestView: View {

    var body: some View {
        VStack {
            List {
                CommonNavigationListType3(
                    titleText: "WEB DEVELOPMENT",
                    subtitleText: "Mr. Rukshan Karunanayake ",
                    taglineText: "13 Feb 2025 - 08:30 AM - 11:30 AM "
                )
                CommonNavigationListType3(
                    titleText: "WEB DEVELOPMENT",
                    subtitleText: "Mr. Rukshan Karunanayake ",
                    taglineText: "13 Feb 2025 - 08:30 AM - 11:30 AM "
                )
                CommonNavigationListType3(
                    titleText: "WEB DEVELOPMENT",
                    subtitleText: "Mr. Rukshan Karunanayake ",
                    taglineText: "13 Feb 2025 - 08:30 AM - 11:30 AM "
                )
            }
        }

    }
}

#Preview {
    TestView()
}
