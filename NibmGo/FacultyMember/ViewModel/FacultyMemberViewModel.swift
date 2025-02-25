import SwiftUI

class FacultyMemberViewModel: ObservableObject {
    @Published var facultyMembers: [FacultyMember] = []
    
    static let shared: FacultyMemberViewModel = {
        let instance = FacultyMemberViewModel()
        return instance
    }()
    
    private init() {
        // Sample faculty data
        facultyMembers = [
            FacultyMember(facultyName: "Dr. Weerasinghe", designation: "Head of School of Computing", email: "thisara@nibm.lk", phone: "+94 11 732 1000", isPinned: true, isAvailable: true, isWhatsapp: true, isEmail: true, isCall: true),
            FacultyMember(facultyName: "MR.P.M.H.PERERA", designation: "Lecturer", email: "perera@nibm.lk", phone: "+94 11 732 1001", isPinned: false, isAvailable: false, isWhatsapp: false, isEmail: true, isCall: false),
            FacultyMember(facultyName: "MR.T.B.DEWANARAYANA", designation: "Lecturer", email: "dewanarayana@nibm.lk", phone: "+94 11 732 1002", isPinned: false, isAvailable: true, isWhatsapp: false, isEmail: true, isCall: true),
            FacultyMember(facultyName: "DR.T.Weerasinghe", designation: "Professor", email: "tweerasinghe@nibm.lk", phone: "+94 11 732 1003", isPinned: true, isAvailable: true, isWhatsapp: true, isEmail: true, isCall: false),
            FacultyMember(facultyName: "MS.SANDUNI WIJESIRIWARDANA", designation: "Lecturer", email: "sanduni@nibm.lk", phone: "+94 11 732 1004", isPinned: false, isAvailable: true, isWhatsapp: true, isEmail: true, isCall: true),
            FacultyMember(facultyName: "MR.K.N.THARANGA", designation: "Researcher", email: "tharanga@nibm.lk", phone: "+94 11 732 1005", isPinned: false, isAvailable: true, isWhatsapp: false, isEmail: true, isCall: false),
            FacultyMember(facultyName: "DR.MRS.K.D.B.H.SUBASINGHE", designation: "Professor", email: "subasinghe@nibm.lk", phone: "+94 11 732 1006", isPinned: true, isAvailable: false, isWhatsapp: true, isEmail: true, isCall: true),
            FacultyMember(facultyName: "MS.APERSHA KODITHUWAKKU", designation: "Assistant", email: "apeksha@nibm.lk", phone: "+94 11 732 1007", isPinned: false, isAvailable: true, isWhatsapp: true, isEmail: false, isCall: true)
        ]
    }
    
    func getAllFacultyMembers() -> [FacultyMember] {
        return facultyMembers
    }
    
    func filterFacultyMembers(by searchTerm: String) -> [FacultyMember] {
        if searchTerm.isEmpty {
            return facultyMembers
        } else {
            return facultyMembers.filter { $0.facultyName.localizedCaseInsensitiveContains(searchTerm) }
        }
    }
}


