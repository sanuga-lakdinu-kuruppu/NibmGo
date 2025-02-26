import SwiftUI

struct EventView: View {
    @State private var searchTerm: String = ""
    @State var selectedEvent: EventModel?
    private var filteredEvents: [EventModel] {
        let allEvents = EventViewModel.shared
            .getAllEvents()
        if searchTerm.isEmpty {
            return allEvents
        } else {
            return allEvents.filter {
                $0.eventName.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {
                VStack(spacing: 16) {
                    HStack {
                        TitleTextView(text: "Events")
                        Spacer()
                    }
                    .padding(.top, 32)

                    CommonSearchBarView(
                        searchTerm: $searchTerm, hint: "Search events")
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    ForEach(filteredEvents, id: \.id) { event in
                        CommonNavigationListType2View(
                            icon: "person.crop.circle.fill",
                            titleText:
                                event.eventName,
                            tagText: event.eventDayInString,
                            url: event.imageUrl
                        )
                        .onTapGesture {
                            selectedEvent = event
                        }
                    }
                }
                .padding(.top, 16)
                .contentMargins(.vertical, 0)

                Spacer()
            }
        }
        .sheet(item: $selectedEvent) { event in
            EventIndetailSheetView(selectedEvent: $selectedEvent)
        }
    }
}

#Preview {
    EventView()
}
