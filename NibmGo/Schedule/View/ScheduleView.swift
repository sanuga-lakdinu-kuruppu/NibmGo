import SwiftUI

struct ScheduleView: View {
    @State var schedules: [ScheduleModel] = ScheduleViewModel.shared
        .getAllSchedule()

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {
                VStack(spacing: 16) {
                    HStack {
                        TitleTextView(text: "Schedule")
                        Spacer()
                    }
                    .padding(.top, 32)

                    Button {
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
                    ForEach(schedules, id: \.id) { schedule in
                        CommonNavigationListType3(
                            titleText: schedule.lecturer,
                            subtitleText: schedule.module,
                            taglineText: schedule.dateTimeInString
                        )
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
