import SwiftUI

struct EmergencyContactsView: View {

    private let facilities: [FacilityModel] = FacilityViewModel.shared
        .getAllFacilities()

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {

                HStack {
                    TitleTextView(text: "Emergency")
                    Spacer()
                }
                .padding(.top, 32)
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List(facilities, id: \.id) { facility in
                    if facility.type.rawValue == FacilityType.emergency.rawValue
                    {
                        CommonNavigationListType2View(
                            icon: "arrowshape.right.circle.fill",
                            titleText: facility.name,
                            tagText: facility.mobile
                        )
                    }
                }
                .contentMargins(.vertical, 0)
            }
        }
    }
}

#Preview {
    EmergencyContactsView()
}
