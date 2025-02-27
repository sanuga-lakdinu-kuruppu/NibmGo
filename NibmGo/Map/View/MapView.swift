import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var globalDto: GlobalDto
    let locationManager = CLLocationManager()
    @State var lookAroundScene: MKLookAroundScene?
    @State var isShowingLookAroundScene: Bool = false
    @State var facilities: [FacilityModel] = []
    @State var selectedFacility: FacilityModel?
    @State var isShowingNavigationSheet: Bool = false
    @State var isShowingHomeSheet: Bool = true
    @State var isSearchBarFocused: Bool = false
    @State var searchTerm: String = ""
    let gridItems = [
        GridItem(.flexible()), GridItem(.flexible()),
    ]
    @State var route: MKRoute?
    @State var distance: Double?
    @State var estimatedTime: Int?
    @State var steps: [MKRoute.Step]?

    private var filteredSearches: [FacilityModel] {
        let allSearches = MapViewModel.shared
            .getLatestSearches()
        if searchTerm.isEmpty {
            return allSearches
        } else {
            return allSearches.filter {
                $0.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

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
                        if facilities[index].type == .stadium {
                            CommonAnnotationView(
                                backgroundColor: .blue,
                                icon: "sportscourt.fill")
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
            if let route {
                MapPolyline(route)
                    .stroke(.red, lineWidth: 6)
            }
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
            isSearchBarFocused = false
            locationManager.requestWhenInUseAuthorization()
            let myMap = MapViewModel.shared.getRelevantMap()
            facilities = myMap.facilities
            if globalDto.commingFrom == Route.facility.rawValue {
                isShowingHomeSheet = false
                globalDto.commingFrom = ""
            } else {
                isShowingHomeSheet = true
            }
        }
        .sheet(isPresented: $isShowingHomeSheet) {
            if isSearchBarFocused {
                VStack {
                    VStack(spacing: 16) {
                        CommonSearchBarView(
                            isFocused: $isSearchBarFocused,
                            searchTerm: $searchTerm, hint: "Search map"
                        )

                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                    List {
                        ScrollView {
                            ForEach(0..<filteredSearches.count, id: \.self) {
                                index in
                                let search = filteredSearches[index]
                                Button {
                                    isShowingHomeSheet = false
                                    selectedFacility = search
                                } label: {
                                    if search.type == FacilityType.lectureHall {
                                        CommonNavigationListType2View(
                                            icon: "building.fill",
                                            titleText: search.name,
                                            tagText: search.address,
                                            size: 0.06
                                        )
                                    } else if search.type
                                        == FacilityType.library
                                    {
                                        CommonNavigationListType2View(
                                            icon: "books.vertical.fill",
                                            titleText: search.name,
                                            tagText: search.address,
                                            size: 0.06
                                        )
                                    } else if search.type
                                        == FacilityType.stadium
                                    {
                                        CommonNavigationListType2View(
                                            icon: "sportscourt.fill",
                                            titleText: search.name,
                                            tagText: search.address,
                                            size: 0.06
                                        )
                                    }

                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.top, 32)

                    Spacer()
                }.presentationDetents([.large])
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 16)
                    .background(.white)
            } else {
                VStack {
                    VStack(spacing: 16) {
                        CommonSearchBarView(
                            isFocused: $isSearchBarFocused,
                            searchTerm: $searchTerm, hint: "Search map"
                        )

                        HStack {
                            NormalTextView(
                                text: "Latest searches",
                                multilineTextAlignment: .leading
                            )
                            Spacer()
                        }

                        ScrollView {
                            LazyVGrid(columns: gridItems) {
                                ForEach(0..<filteredSearches.count, id: \.self)
                                {
                                    index in
                                    let search = filteredSearches[index]
                                    if let firstUrl = search.imageUrls?.first {
                                        CommonEventCardView(
                                            title: search.name,
                                            day: search.name,
                                            imageUrl: firstUrl
                                        )
                                    }
                                }
                            }
                        }

                    }

                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                    Spacer()
                }.presentationDetents([.medium, .large])
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 16)
                    .background(Color("commonBackground"))
            }
        }
        .sheet(isPresented: $isShowingNavigationSheet) {
            VStack {
                VStack(spacing: 0) {
                    HStack {
                        SecondaryHeadingTextView(text: "Directions")
                        Spacer()
                        HStack {
                            Button {
                                isShowingNavigationSheet = false
                            } label: {
                                CommonIconButtonView(icon: "xmark")
                            }
                        }
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    CommonStaticListView(
                        icon: "app.connected.to.app.below.fill",
                        titleText: "(\(distance ?? 0.0) m)",
                        valueText: "\(estimatedTime ?? 0) min")
                }
                .contentMargins(.vertical, 8)
                .frame(maxHeight: 100)

                List {
                    ForEach(steps ?? [], id: \.self) { step in
                        CommonStaticListView(
                            icon: "checkmark.circle.fill",
                            titleText: "\(step.instructions)",
                            valueText: "")
                    }
                }
                .contentMargins(.vertical, 0)
                Spacer()
            }
            .presentationDetents([.medium, .large])
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
            .background(Color("commonBackground"))
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
                        getDirection(
                            destination: CLLocationCoordinate2D(
                                latitude: facility.latitude,
                                longitude: facility.longitude
                            ))
                        isShowingNavigationSheet = true
                    } label: {
                        CommonButtonView(
                            buttonText: "Show Me Direction",
                            backgroundColor: Color("inputBackground"),
                            foregroundColor: Color("brandColor")
                        )
                    }

                    AvailabilityCardView(
                        availabilityValueInDouble: facility
                            .availabilityInDouble,
                        availabilityValueInString: facility.availabilityInString
                            .rawValue
                    )

                    if let imageUrls = facility.imageUrls {
                        ScrollView {
                            LazyVGrid(columns: gridItems) {
                                ForEach(imageUrls, id: \.self) { url in
                                    CommonSquareImageView(url: url)
                                }
                            }

                        }
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
            }
            .presentationDetents([.medium, .large])
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
            .background(Color("commonBackground"))
        }
    }

    func getDirection(destination: CLLocationCoordinate2D) {
        Task {
            guard let userLocation = await getUserLocation() else {
                return
            }

            let request = MKDirections.Request()
            request.source = MKMapItem(
                placemark: .init(coordinate: userLocation)
            )
            request.destination = MKMapItem(
                placemark: .init(coordinate: destination)
            )
            request.transportType = .walking

            do {
                let directions = try await MKDirections(request: request)
                    .calculate()

                if let route = directions.routes.first {
                    self.route = route
                    let distance = route.distance
                    let estimatedTime = Int(route.expectedTravelTime / 60)
                    self.distance = distance
                    self.estimatedTime = estimatedTime
                    print("dis: \(distance)")
                    print("time: \(estimatedTime)")
                    self.steps = route.steps
                    for (index, step) in route.steps.enumerated() {
                        print("Step \(index + 1): \(step.instructions)")
                    }
                    let startName =
                        request.source?.name ?? "Unknown Start Location"
                    let endName =
                        request.destination?.name ?? "Unknown Destination"
                    print("start: \(startName)")
                    print("end: \(endName)")
                }

            } catch {
                print("cannot get route \(error)")
            }
        }
    }

    func getUserLocation() async -> CLLocationCoordinate2D? {
        let updates = CLLocationUpdate.liveUpdates()

        do {
            let update = try await updates.first {
                $0.location?.coordinate != nil
            }
            return update?.location?.coordinate
        } catch {
            print("cannot get user location")
            return nil
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
    MapView().environmentObject(GlobalDto.shared)
}
