import Charts
import SwiftUI

struct FacilityView: View {
    @EnvironmentObject var globalDto: GlobalDto
    @State var isShowingIndetails: Bool = false
    @State var selectedFacility: FacilityModel?
    private var filteredFacilities: [FacilityModel] {
        let allFacilities = FacilityViewModel.shared.getAllFacilities()
        if searchTerm.isEmpty {
            return allFacilities
        } else {
            return
                allFacilities
                .filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
        }
    }
    @State var searchTerm = ""

    var body: some View {
        ZStack {
            CommonBackgroundView()
            VStack {
                VStack(spacing: 16) {
                    HStack {
                        TitleTextView(text: "Facilities")
                        Spacer()
                    }
                    .padding(.top, 32)

                    CommonSearchBarView(
                        searchTerm: $searchTerm, hint: "Search facilities")

                    if globalDto.role.rawValue != UserType.guest.rawValue {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(filteredFacilities) { facility in
                                    if facility.isPinned {
                                        Button {
                                            selectedFacility = facility
                                        } label: {
                                            PinnedItemButtonView(
                                                text: facility.name)
                                        }
                                    }

                                }
                            }
                        }
                    }

                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    ForEach(filteredFacilities, id: \.id) { facility in
                        if facility.type == FacilityType.lectureHall {
                            CommonNavigationListType1View(
                                icon: "building.fill", titleText: facility.name
                            )
                            .onTapGesture {
                                selectedFacility = facility
                            }
                        } else if facility.type == FacilityType.library {
                            CommonNavigationListType1View(
                                icon: "books.vertical.fill",
                                titleText: facility.name
                            ).onTapGesture {
                                selectedFacility = facility
                            }
                        } else if facility.type == FacilityType.stadium {
                            CommonNavigationListType1View(
                                icon: "sportscourt.fill",
                                titleText: facility.name
                            ).onTapGesture {
                                selectedFacility = facility
                            }
                        }

                    }
                }
                .padding(.top, 16)
                .contentMargins(.vertical, 0)

                Spacer()
            }

        }
        .sheet(item: $selectedFacility) { facility in
            FacilityInDetailView(
                selectedFacility: $selectedFacility
            )
        }

    }
}

#Preview {
    FacilityView().environmentObject(GlobalDto.shared)
}
