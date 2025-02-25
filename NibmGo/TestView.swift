//
//  TestView.swift
//  NibmGo
//
//  Created by Kuruppuge Sanuga Lakdinu Kuruppu on 2025-02-25.
//

import SwiftUI

struct TestView: View {
    let event: EventModel = .init(

        eventName: "New Year 2025",
        eventDayInString: "Mon, Jan 01, 2025",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk_2RQ7xCmTyX6LyG67JUbl7F4J3-Y_Zk4Lg&s",
        description:
            "Enjoy your favorite dishes and a lovely your friends and have a great time. Food from local food trucks will be available for purchase. ",
        longiture: 43.43,
        latitude: 43.34,
        address: "Ground Fl, Main Bld, NIBM Col",
        time: "9.00PM - 5.00PM",
        organizer: "Leo Club, NIBM Col",
        isFollowFaceBook: true,
        isFollowInstagram: true,
        isFollowX: true,
        isSubscribed: false

    )
    var body: some View {
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
                                    //                                    selectedEvent = nil
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
//                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

            VStack {
                List {
                    Section {
                        CommonStaticListView(
                            icon: "calendar", titleText: "On",
                            valueText: event.eventDayInString)
                    }

                }
                .contentMargins(.vertical, 0)
            }

        }
        .background(Color("commonBackground"))
    }
}

#Preview {
    TestView()
}
