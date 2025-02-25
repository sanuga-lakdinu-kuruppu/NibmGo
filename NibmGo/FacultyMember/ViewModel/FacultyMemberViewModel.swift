import SwiftUI

class FacultyMemberViewModel {
    static let shared = FacultyMemberViewModel()
    private init() {}

    func getAllFacultyMembers() -> [FacultyMemberModel] {
        let facultyMembers = [
            FacultyMemberModel(
                title: "Dr",
                firstName: "Thisara",
                lastName: "Weerasinghe",
                department: "School of Computing",
                designation: "Head of School of Computing",
                email: "thisara@nibm.lk", phone: "+94 11 732 1000",
                isPinned: true, isAvailable: true, isWhatsapp: true,
                isEmail: true, isCall: true),
            FacultyMemberModel(
                title: "Mr",
                firstName: "Himantha",
                lastName: "Perera",
                department: "School of Computing",
                designation: "Lecturer/Consultant",
                email: "perera@nibm.lk", phone: "+94 11 732 1001",
                isPinned: false, isAvailable: false, isWhatsapp: false,
                isEmail: true, isCall: false),
            FacultyMemberModel(
                title: "Mr",
                firstName: "Bawantha",
                lastName: "Dewanaranaya",
                department: "School of Computing",
                designation: "Lecturer/Consultant",
                email: "dewanarayana@nibm.lk", phone: "+94 11 732 1002",
                isPinned: false, isAvailable: true, isWhatsapp: false,
                isEmail: true, isCall: true),
            FacultyMemberModel(
                title: "Ms",
                firstName: "Sanduni",
                lastName: "Wijesiriwardena",
                department: "School of Business",
                designation: "Lecturer/Consultant",
                email: "sanduni@nibm.lk",
                phone: "+94 11 732 1004", isPinned: false, isAvailable: true,
                isWhatsapp: true, isEmail: true, isCall: true),
            FacultyMemberModel(
                title: "Mr",
                firstName: "Nayana",
                lastName: "Tharanga",
                department: "School of Computing",
                designation: "Researcher",
                email: "tharanga@nibm.lk", phone: "+94 11 732 1005",
                isPinned: false, isAvailable: true, isWhatsapp: false,
                isEmail: true, isCall: false),
            FacultyMemberModel(
                title: "Dr",
                firstName: "Buddhima",
                lastName: "Subasinghe",
                department: "School of Computing",
                designation: "Professor",
                email: "subasinghe@nibm.lk",
                phone: "+94 11 732 1006", isPinned: true, isAvailable: false,
                isWhatsapp: true, isEmail: true, isCall: true),
        ]
        return facultyMembers
    }
}
