import SwiftUI

struct FacilityView: View {
    @State var isShowingIndetails: Bool = false
    @State var selectedFacility: FacilityModel?
    @State var facilites: [FacilityModel] = FacilityViewModel.shared
        .getAllFacilities()
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

                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    ForEach(facilites, id: \.id) { facility in
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
                .contentMargins(.vertical, 0)

                Spacer()
            }

        }
        .sheet(item: $selectedFacility) { facility in
            VStack {
                VStack {
                    ZStack {
                        FacilityIndetailImageView(
                            imageUrl: facility.imageUrls?.first
                        )

                        VStack {
                            HStack {
                                Spacer()
                                HStack {
                                    Button {
                                    } label: {
                                        CommonIconButtonView(icon: "pin.fill")
                                    }
                                    Button {
                                    } label: {
                                        CommonIconButtonView(icon: "plus")
                                    }
                                    Button {
                                    } label: {
                                        CommonIconButtonView(
                                            icon: "square.and.arrow.up")
                                    }
                                    Button {
                                        selectedFacility = nil
                                    } label: {
                                        CommonIconButtonView(icon: "xmark")
                                    }
                                }
                            }
                            Spacer()
                            FacilityIndetailTitleView(
                                name: facility.name,
                                address: facility
                                    .address
                            )
                            .padding(.bottom, 16)
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                    }
                }

                VStack {
                    Button {
                        print("clicked here")
                    } label: {
                        CommonButtonView(
                            buttonText: "Show Me Directions",
                            backgroundColor: Color("inputBackground"),
                            foregroundColor: Color("brandColor")
                        )
                    }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
            }
            .presentationDetents([.large])
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .background(Color("commonBackground"))
        }

    }
}

#Preview {
    FacilityView()
}
