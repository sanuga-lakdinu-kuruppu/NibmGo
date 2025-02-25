import SwiftUI

struct FacultyMemberView: View {
    @State private var searchTerm: String = ""
    @State private var isShowingIndetails: Bool = false
    @State private var selectedFacultyMember: FacultyMember?

    private var filteredFacultyMembers: [FacultyMember] {
        let allFacultyMembers = FacultyMemberViewModel.shared.getAllFacultyMembers()
        if searchTerm.isEmpty {
            return allFacultyMembers
        } else {
            return allFacultyMembers.filter {
                $0.facultyName.localizedCaseInsensitiveContains(searchTerm)
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

                    CommonSearchBarView(searchTerm: $searchTerm, hint: "Search faculty members")

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(filteredFacultyMembers) { facultyMember in
                                if facultyMember.isPinned {
                                    Button {
                                        selectedFacultyMember = facultyMember
                                    } label: {
                                        PinnedItemButtonView(text: facultyMember.facultyName)
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
                            titleText: facultyMember.facultyName,
                            tagText: facultyMember.designation
                        )
                        .onTapGesture {
                            selectedFacultyMember = facultyMember
                        }
                    }
                }
                .padding(.top, 16)

                Spacer()
            }
        }
        .sheet(item: $selectedFacultyMember) { facultyMember in
            FacultyMemberIndetailView(selectedFacultyMember: $selectedFacultyMember)
        }
    }
}

#Preview {
    FacultyMemberView()
}

