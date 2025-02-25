import SwiftUI

struct EventIndetailSheetView: View {
    @Binding var selectedEvent: EventModel?

    var body: some View {
        ScrollView {
            if let event = selectedEvent {
                VStack {
                    VStack {
                        ZStack {
                            FacilityIndetailImageView(
                                imageUrl: event.imageUrl
                            )

                            VStack {
                                HStack {
                                    Spacer()
                                    HStack {
                                        Button {
                                        } label: {
                                            CommonIconButtonView(
                                                icon: event.isSubscribed
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
                                            selectedEvent = nil
                                        } label: {
                                            CommonIconButtonView(icon: "xmark")
                                        }
                                    }
                                }
                                Spacer()
                                FacilityIndetailTitleView(
                                    name: event.eventName,
                                    address: event
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
                        VStack {
                            NormalTextView(
                                text: event.description,
                                multilineTextAlignment: .center,
                                foregroundColor: .black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(.white)
                        .cornerRadius(15)

                        Button {
                            print("clicked here")
                        } label: {
                            CommonButtonView(
                                buttonText: "Show Me Directions",
                                backgroundColor: Color("inputBackground"),
                                foregroundColor: Color("brandColor")
                            )
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                    VStack {
                        List {
                            Section {
                                CommonStaticListView(
                                    icon: "calendar", titleText: "On",
                                    valueText: event.eventDayInString)
                                CommonStaticListView(
                                    icon:
                                        "clock.arrow.trianglehead.counterclockwise.rotate.90",
                                    titleText: "At",
                                    valueText: event.time)
                                CommonStaticListView(
                                    icon: "location.circle.fill",
                                    titleText: "Venue",
                                    valueText: event.address)
                                CommonStaticListView(
                                    icon: "person.2.fill",
                                    titleText: "Organised by",
                                    valueText: event.organizer)
                                HStack {
                                    HStack {
                                        Image(
                                            systemName:
                                                "person.badge.shield.checkmark"
                                        )
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(
                                            Color("brandColor")
                                        )
                                        .frame(
                                            width: UIScreen.main.bounds
                                                .width * 0.05,
                                            height: UIScreen.main.bounds
                                                .width * 0.05
                                        )
                                        .padding(.trailing, 8)
                                        NormalTextView(
                                            text: "Follow us",
                                            foregroundColor: .black)
                                    }

                                    Spacer()
                                    HStack(spacing: 16) {
                                        if event.isFollowFaceBook {
                                            Button {
                                            } label: {
                                                ContactImageView(
                                                    image: "logoFacebook")
                                            }
                                        }

                                        if event.isFollowInstagram {
                                            Button {
                                            } label: {
                                                ContactImageView(
                                                    image: "logoInstagram")
                                            }
                                        }

                                        if event.isFollowX {
                                            Button {
                                            } label: {
                                                ContactImageView(
                                                    image: "logoX")
                                            }
                                        }

                                    }
                                }
                                .padding(.vertical, 4)
                            }

                        }
                        .padding(.top, 16)
                        .contentMargins(.vertical, 0)
                        .frame(height: 300)
                    }

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
    //    EventIndetailSheetView()
}
