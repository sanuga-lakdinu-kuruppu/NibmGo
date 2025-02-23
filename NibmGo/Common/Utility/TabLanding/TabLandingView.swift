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
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("More")
                }
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(Color("brandColor"))
    }
}

#Preview {
    TabLandingView().environmentObject(NavigationRouter())
}
