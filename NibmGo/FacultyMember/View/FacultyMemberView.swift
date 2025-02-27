import SwiftUI

struct FacultyMemberView: View {
    @State private var searchTerm: String = ""
    @State private var selectedFacultyMember: FacultyMemberModel?
    @State var isFocused: Bool = false
    private var filteredFacultyMembers: [FacultyMemberModel] {
        let allFacultyMembers = FacultyMemberViewModel.shared
            .getAllFacultyMembers()
        if searchTerm.isEmpty {
            return allFacultyMembers
        } else {
            return allFacultyMembers.filter {
                $0.firstName.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {
                VStack(spacing: 16) {
                    HStack {
                        TitleTextView(text: "Faculty Members")
                        Spacer()
                    }
                    .padding(.top, 32)

                    CommonSearchBarView(
                        isFocused: $isFocused,
                        searchTerm: $searchTerm, hint: "Search faculty members")

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(filteredFacultyMembers) { facultyMember in
                                if facultyMember.isPinned {
                                    Button {
                                        selectedFacultyMember = facultyMember
                                    } label: {
                                        PinnedItemButtonView(
                                            text:
                                                "\(facultyMember.title). \(facultyMember.firstName) \(facultyMember.lastName)"
                                        )
                                    }
                                }
                            }
                        }
                    }

                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    ForEach(filteredFacultyMembers, id: \.id) { facultyMember in
                        CommonNavigationListType2View(
                            icon: "person.crop.circle.fill",
                            titleText:
                                "\(facultyMember.title). \(facultyMember.firstName) \(facultyMember.lastName)",
                            tagText: facultyMember.department
                        )
                        .onTapGesture {
                            selectedFacultyMember = facultyMember
                        }
                    }
                }
                .padding(.top, 16)
                .contentMargins(.vertical, 0)

                Spacer()
            }
        }
        .sheet(item: $selectedFacultyMember) { facultyMember in
            FacultyMemberIndetailSheetView(
                selectedFacultyMember: $selectedFacultyMember
            )
        }
    }
}

#Preview {
    FacultyMemberView()
}
