import MapKit
import SwiftUI

class MapViewModel {
    static let shared = MapViewModel()

    private init() {}

    func getRelevantMap() -> MapModel {
        //network call
        let facilities = [
            FacilityModel(
                facilityId: 1, name: "Vehicle Parking", type: .parking,
                longitude: 79.870737,
                latitude: 6.906206,
                address: "Ground Fl, Main Building",
                imageUrls: [
                    "https://images.unsplash.com/photo-1470224114660-3f6686c562eb?q=80&w=2782&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1506521781263-d8422e82f27a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1562426509-5044a121aa49?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ], availability: .available, crowdLevel: .moderate),
            FacilityModel(
                facilityId: 2, name: "Cafeteria", type: .cafeteria,
                longitude: 79.870623,
                latitude: 6.906643, address: "2nd Fl, Main Building",
                imageUrls: [
                    "https://images.unsplash.com/photo-1588075592672-2c05a193357f?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1600506385349-75c83336e2b6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1554118811-1e0d58224f24?q=80&w=2894&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1493857671505-72967e2e2760?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1516197227520-4d1c419f6ec6?q=80&w=2573&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ], availability: .unavailable, crowdLevel: .high),
            FacilityModel(
                facilityId: 3, name: "Main Library", type: .library,
                longitude: 79.870731,
                latitude: 6.906422, address: "1st Fl, Main Building",
                imageUrls: [
                    "https://images.unsplash.com/photo-1521587760476-6c12a4b040da?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1600431521340-491eca880813?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ], availability: .available, crowdLevel: .high),
            FacilityModel(
                facilityId: 4, name: "Lec 01", type: .lectureHall,
                longitude: 79.8709634257161,
                latitude: 6.906332846129008, address: "3rd Fl, Main Building",
                imageUrls: [
                    "https://images.unsplash.com/photo-1606761568499-6d2451b23c66?q=80&w=2763&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                ], availability: .available, crowdLevel: .high),
            FacilityModel(
                facilityId: 4, name: "Lec 02", type: .lectureHall,
                longitude: 79.87083046853927,
                latitude: 6.906216588475643, address: "3rd Fl, Main Building",
                imageUrls: [
                    "https://images.unsplash.com/photo-1492538368677-f6e0afe31dcc?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1559223607-a43c990c692c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ], availability: .unavailable, crowdLevel: .low),
            FacilityModel(
                facilityId: 4, name: "Lec 03", type: .lectureHall,
                longitude: 79.87072873243261,
                latitude: 6.906394089306229,
                address: "Ground Fl, Main Building", availability: .available,
                crowdLevel: .moderate
            ),
            FacilityModel(
                facilityId: 4, name: "Lec 04", type: .lectureHall,
                longitude: 79.87088497110419,
                latitude: 6.9063288520084765,
                address: "1st Fl, Main Building", availability: .available,
                crowdLevel: .low),
        ]
        let mapColomboNIBM = MapModel(
            mapId: 1,
            name: "NIBM Colombo",
            facilities: facilities
        )
        return mapColomboNIBM
    }

}
