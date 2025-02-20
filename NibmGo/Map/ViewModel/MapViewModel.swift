import SwiftUI

class MapViewModel {
    func getRelevantMap() -> MapModel {
        //network call
        let facilities = [
            FacilityModel(
                facilityId: 1, name: "Vehicle Parking", type: .parking,
                longitude: 79.870737,
                latitude: 6.906206),
            FacilityModel(
                facilityId: 2, name: "Cafeteria", type: .cafeteria,
                longitude: 79.870623,
                latitude: 6.906643),
            FacilityModel(
                facilityId: 3, name: "Main Library", type: .library,
                longitude: 79.870731,
                latitude: 6.906422),
            FacilityModel(
                facilityId: 4, name: "Lecture Hall 01", type: .lectureHall,
                longitude: 79.87083046853927,
                latitude: 6.906216588475643),
        ]
        let mapColomboNIBM = MapModel(
            mapId: 1,
            name: "NIBM Colombo",
            facilities: facilities
        )
        return mapColomboNIBM
    }
}
