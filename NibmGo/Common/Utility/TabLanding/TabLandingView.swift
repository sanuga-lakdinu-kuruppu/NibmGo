import SwiftUI

struct TabLandingView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
                .toolbar(.hidden, for: .navigationBar)

            FacilityView()
                .tabItem {
                    Image(systemName: "building.2.fill")
                    Text("Facility")
                }

            FacultyMemberView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Member")
                }

            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Schedule")
                }

            ContributionView()
                .tabItem {
                    Image(systemName: "hand.draw.fill")
                    Text("Contribution")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(Color("brandColor"))
    }
}

#Preview {
    TabLandingView().environmentObject(NavigationRouter())
}
