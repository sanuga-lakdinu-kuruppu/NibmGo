import MapKit
import SwiftUI

struct MapView: View {
    let locationManager = CLLocationManager()
    @State var lookAroundScene: MKLookAroundScene?
    @State var isShowingLookAroundScene: Bool = false
    @State var facilities: [FacilityModel] = []
    @State var selectedFacility: FacilityModel?
    let gridItems = [
        GridItem(.flexible()), GridItem(.flexible()),
    ]

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
                    Button {
                        selectedFacility = facilities[index]
                    } label: {
                        if facilities[index].type == .parking {
                            CommonAnnotationView(
                                backgroundColor: .red,
                                icon: "parkingsign.circle.fill")

                        } else if facilities[index].type == .cafeteria {
                            CommonAnnotationView(
                                backgroundColor: .blue,
                                icon: "cup.and.saucer.fill")
                        } else if facilities[index].type == .library {
                            CommonAnnotationView(
                                backgroundColor: .green,
                                icon: "books.vertical.fill")
                        } else if facilities[index].type == .lectureHall {
                            CommonAnnotationView(
                                backgroundColor: .black,
                                icon: "building.fill")
                        }
                    }
                }
            }
            UserAnnotation()
        }
        .tint(Color("brandColor"))
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
            let myMap = MapViewModel.shared.getRelevantMap()
            facilities = myMap.facilities
        }
        .sheet(item: $selectedFacility) { facility in
            VStack {
                VStack(spacing: 16) {
                    HStack {
                        SecondaryHeadingTextView(text: facility.name)
                        Spacer()
                        HStack {
                            Button {
                                Task {
                                    lookAroundScene = await getLookAroundScene(
                                        coordinate: CLLocationCoordinate2D(
                                            latitude: facility.latitude,
                                            longitude: facility.longitude
                                        )
                                    )
                                    guard lookAroundScene != nil else { return }
                                    isShowingLookAroundScene = true
                                }
                            } label: {
                                CommonIconButtonView(icon: "dot.viewfinder")
                            }
                            Button {
                                selectedFacility = nil
                            } label: {
                                CommonIconButtonView(icon: "xmark")
                            }
                        }
                    }
                    HStack {
                        NormalTextView(
                            text: facility.address,
                            multilineTextAlignment: .leading
                        )
                        Spacer()
                    }
                    Button {

                    } label: {
                        CommonButtonView(
                            buttonText: "Show Me Direction",
                            backgroundColor: Color("inputBackground"),
                            foregroundColor: Color("brandColor")
                        )
                    }

                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    CommonStaticListView(
                        icon: "checkmark.circle.fill",
                        titleText: "Availabity",
                        valueText: "\(facility.availability.rawValue)")
                    CommonStaticListView(
                        icon: "person.fill", titleText: "Crowd Level",
                        valueText: "\(facility.crowdLevel.rawValue)")
                }
                .contentMargins(.vertical, 8)
                .frame(maxHeight: 100)

                if let imageUrls = facility.imageUrls {
                    ScrollView {
                        LazyVGrid(columns: gridItems) {
                            ForEach(imageUrls, id: \.self) { url in
                                CommonSquareImageView(url: url)
                            }
                        }

                    }.padding(
                        .horizontal, UIScreen.main.bounds.width * 0.05
                    )
                }

                Spacer()
            }
            .presentationDetents([.medium, .large])
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
            .background(Color("commonBackground"))
        }
    }

    func getLookAroundScene(coordinate: CLLocationCoordinate2D) async
        -> MKLookAroundScene?
    {
        do {
            return try await MKLookAroundSceneRequest(
                coordinate: coordinate
            ).scene
        } catch {
            print("Cannot get look around scene")
            return nil
        }
    }

}

#Preview {
    MapView()
}
