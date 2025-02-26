import SwiftUI

struct HomeAvailabilityCardView: View {
    @EnvironmentObject var globalDto: GlobalDto
    var facilityName: String
    var facilityAddress: String
    var availabilityInDouble: Double
    var availabilityInString: String
    var selectedFacility: FacilityModel

    var body: some View {
        HStack {
            Button {
                globalDto.selectedFacility = selectedFacility
                globalDto.paths
                    .append(
                        Route.facility.rawValue
                    )
            } label: {
                VStack(alignment: .leading) {
                    FacilityCardTitleView(
                        facilityName: facilityName,
                        facilityAddress: facilityAddress
                    )

                    Spacer()
                    FacilityAvailabilityGuageView(
                        availabilityInDouble: availabilityInDouble,
                        availabilityInString: availabilityInString
                    )

                }
            }

            if globalDto.role.rawValue != UserType.guest.rawValue {
                Spacer()
                VStack {
                    Button {

                    } label: {
                        AvailabilityCardButtonView(
                            text: "Low", backgroundColor: .green,
                            maxWidth: UIScreen.main.bounds.width * 0.24)
                    }
                    Spacer()
                    Button {

                    } label: {
                        AvailabilityCardButtonView(
                            text: "Moderate", backgroundColor: .orange,
                            maxWidth: UIScreen.main.bounds.width * 0.24)
                    }
                    Spacer()
                    Button {

                    } label: {
                        AvailabilityCardButtonView(
                            text: "High", backgroundColor: .red,
                            maxWidth: UIScreen.main.bounds.width * 0.24)
                    }
                }
            }

        }
        .padding(16)
        .frame(
            width: UIScreen.main.bounds.width - UIScreen.main.bounds.width
                * 0.1, height: UIScreen.main.bounds.width * 0.4
        )
        .background(.white)
        .cornerRadius(15)

    }
}

#Preview {
//    HomeAvailabilityCardView(
//        facilityName: "fajkls",
//        facilityAddress: "fajksl",
//        availabilityInDouble: 74.0,
//        availabilityInString: "fj",
//        selectedFacility: <#T##FacilityModel#>
//    ).environmentObject(GlobalDto.shared)
}
