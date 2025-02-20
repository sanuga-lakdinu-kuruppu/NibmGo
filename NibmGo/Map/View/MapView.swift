import MapKit
import SwiftUI

struct MapView: View {
    let locationManager = CLLocationManager()
    @State var lookAroundScene: MKLookAroundScene?
    @State var isShowingLookAroundScene: Bool = false
    @State var facilities: [FacilityModel] = []

    var body: some View {
        Map {
            ForEach(0..<facilities.count, id: \.self) { index in
                Annotation(
                    facilities[index].name,
                    coordinate: CLLocationCoordinate2D(
                        latitude: facilities[index].latitude,
                        longitude: facilities[index].longitude
                    ),
                    anchor: .bottom
                ) {
                    if facilities[index].type == .parking {
                        Image(systemName: "parkingsign.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .padding(7)
                            .background(.red.gradient, in: .circle)
                    } else if facilities[index].type == .cafeteria {
                        Image(systemName: "cup.and.saucer.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .padding(7)
                            .background(.blue.gradient, in: .circle)

                    } else if facilities[index].type == .library {
                        Image(systemName: "books.vertical.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .padding(7)
                            .background(.green.gradient, in: .circle)
                    } else if facilities[index].type == .lectureHall {
                        Image(systemName: "building.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .padding(7)
                            .background(.pink.gradient, in: .circle)
                    }

                }
            }
            UserAnnotation()
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
        }
        .mapStyle(.standard(elevation: .realistic))
        .lookAroundViewer(
            isPresented: $isShowingLookAroundScene,
            initialScene: lookAroundScene
        )
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            let myMap = MapViewModel().getRelevantMap()
            facilities = myMap.facilities

        }
    }

}

#Preview {
    MapView()
}
