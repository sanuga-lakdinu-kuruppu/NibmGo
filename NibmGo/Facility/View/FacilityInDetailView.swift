import SwiftUI

struct FacilityInDetailView: View {
    @Binding var selectedFacility: FacilityModel?

    var body: some View {
        ScrollView {
            if var facility = selectedFacility {
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
                                            CommonIconButtonView(
                                                icon: facility.isPinned
                                                    ? "pin.fill" : "pin")
                                        }
                                        Button {
                                        } label: {
                                            CommonIconButtonView(
                                                icon: facility.isSubscribed
                                                    ? "checkmark.circle.fill"
                                                    : "plus"
                                            )
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
                            .padding(
                                .horizontal, UIScreen.main.bounds.width * 0.05)
                        }
                    }

                    VStack(spacing: 16) {
                        Button {
                            print("clicked here")
                        } label: {
                            CommonButtonView(
                                buttonText: "Show Me Directions",
                                backgroundColor: Color("inputBackground"),
                                foregroundColor: Color("brandColor")
                            )
                        }

                        AvailabilityCardView(
                            availabilityValueInDouble: facility
                                .availabilityInDouble,
                            availabilityValueInString: facility
                                .availabilityInString
                                .rawValue
                        )

                        VStack(spacing: 16) {
                            HStack {
                                NormalTextView(
                                    text: "Peak Hours",
                                    multilineTextAlignment: .leading
                                )
                                Spacer()
                            }
                            PeakHourChartView(peakHours: facility.peakHours)
                        }

                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                }
                .presentationDetents([.large])
                .ignoresSafeArea()
                .frame(maxWidth: .infinity)
            }

        }
        .background(Color("commonBackground"))
    }
}

#Preview {
    //    FacilityInDetailView()
}
