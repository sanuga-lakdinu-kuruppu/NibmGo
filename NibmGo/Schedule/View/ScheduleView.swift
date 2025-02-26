import SwiftUI

struct ScheduleView: View {
    @State private var searchTerm: String = ""
    @State private var selectedSchedule: ScheduleModel?
//    @EnvironmentObject var globalRouter: NavigationRouter
    private var filteredSchedule: [ScheduleModel] {
        let allFacultyMembers = ScheduleViewModel.shared
            .getAllSchedule()
        return allFacultyMembers
    }

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {
                VStack(spacing: 16) {
                    HStack {
                        TitleTextView(text: "schedule")
                        Spacer()
                    }
                    .padding(.top, 32)

                    Button {
//                        globalRouter.paths
//                            .append(
//                                Route.profilePasswordReset.rawValue
//                            )
                    } label: {
                        CommonButtonView(
                            buttonText: "13 Feb 25 - 23 Feb 25",
                            backgroundColor: Color("inputBackground"),
                            foregroundColor: Color.black
                        )
                    }

                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    ForEach(filteredSchedule, id: \.id) { schedule in
                        CommonNavigationListType3(
                            titleText: schedule.lecturer,
                            subtitleText: schedule.subject,
                            taglineText: schedule.dateTime
                        )
                        .onTapGesture {
                            selectedSchedule = schedule
                        }
                    }
                }
                .padding(.top, 16)
                .contentMargins(.vertical, 0)

                Spacer()
            }
        }
    }
}

#Preview {
    ScheduleView()
}

