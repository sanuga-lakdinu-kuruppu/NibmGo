import SwiftUI

struct HomeView: View {
    @EnvironmentObject var globalDto: GlobalDto
    var isNotificationThere: Bool = false
    @State var isAvailable: Bool = false
    var userType: UserType = UserType.facultMember
    let allFacilities = FacilityViewModel.shared.getAllFacilities()
    let upcommingEvents = HomeViewModel.shared.getUpcommingEvents()

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        SecondaryHeadingTextView(
                            text: "MONDAY 10 FEBRUAGRY",
                            foregroundColor: Color("commonTextColor"),
                            weight: .heavy,
                            font: .callout
                        )
                        TitleTextView(text: "Hi, Himasha")
                    }
                    Spacer()

                    if globalDto.role.rawValue != UserType.guest.rawValue {
                        Button {
                            globalDto.paths
                                .append(
                                    Route.notification.rawValue
                                )
                        } label: {
                            if isNotificationThere {
                                NotificationButtonView(
                                    icon: "bell.badge.fill",
                                    iconColor: Color("brandColor")
                                )
                            } else {
                                NotificationButtonView()
                            }
                        }
                    } else {
                        HyperLinkTextView(text: "Exit")
                            .onTapGesture {
                                globalDto.paths.removeAll()
                                globalDto.isLoggedIn = false
                                globalDto.accessToken = ""
                                globalDto.refreshToken = ""
                                globalDto.role = .guest
                                globalDto.commingFrom = ""
                                globalDto.paths
                                    .append(
                                        Route.login.rawValue
                                    )
                            }
                    }
                }

                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 16) {

                            HStack(spacing: 16) {

                                if globalDto.role.rawValue
                                    != UserType.guest.rawValue
                                {
                                    PointsCardView(points: 12453)
                                }

                                if globalDto.role.rawValue
                                    == UserType.facultMember.rawValue
                                {
                                    AvailabilityToggleView(
                                        isAvailable: $isAvailable)
                                }
                            }
                        }

                        VStack(spacing: 16) {
                            HStack {
                                TitleTextView(
                                    text: "Campus Tour",
                                    foregroundColor: Color("commonTextColor"))
                                Spacer()
                            }
                            CampusTourWebView()
                        }

                        VStack(spacing: 16) {
                            HStack {
                                TitleTextView(
                                    text: "Favourites",
                                    foregroundColor: Color("commonTextColor"))
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(allFacilities) { facility in
                                        if facility.isPinned {
                                            HomeAvailabilityCardView(
                                                facilityName: facility.name,
                                                facilityAddress:
                                                    facility.address,
                                                availabilityInDouble: facility
                                                    .availabilityInDouble,
                                                availabilityInString: facility
                                                    .availabilityInString
                                                    .rawValue,
                                                selectedFacility: facility
                                            )
                                        }
                                    }
                                }

                            }

                        }

                        VStack(spacing: 16) {
                            HStack {
                                TitleTextView(
                                    text: "Upcomming Events",
                                    foregroundColor: Color("commonTextColor"))
                                Spacer()
                            }

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(upcommingEvents) { event in
                                        Button {
                                            globalDto.selectedEvent = event
                                            globalDto.paths
                                                .append(
                                                    Route.event.rawValue
                                                )
                                        } label: {
                                            CommonEventCardView(
                                                title: event.eventName,
                                                day: event.eventDayInString,
                                                imageUrl: event.imageUrl
                                            )

                                        }

                                    }

                                }
                            }
                        }

                        Spacer()
                    }
                }
            }
            .padding(.top, 32)
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

        }
    }
}

#Preview {
    HomeView().environmentObject(GlobalDto.shared)
}
