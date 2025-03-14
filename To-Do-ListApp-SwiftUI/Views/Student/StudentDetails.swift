//
//  StudentDetails.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import SwiftUI

struct StudentDetails: View {
    
    @State private var isShowingBottomSheet = false
    @State private var selectedStudent: StudentModel?
    @State private var students: [StudentModel] = []
    
    var body: some View {
        
            ZStack {
                Color(UIColor(hex: "#bb9a8f") ?? .clear)
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(students) { student in
                        StudentCard(students: student, deleteaction: {
                            if let index = students.firstIndex(where: { $0.id == student.id }) {
                                students.remove(at: index)
                            }
                        }, editaction: {
                            selectedStudent = student
                            isShowingBottomSheet.toggle()
                        })
                        .padding(.top, 10)
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .listStyle(.inset)
                
                if isShowingBottomSheet {
                    BottomSheet(isShowing: $isShowingBottomSheet) {
                        BottomSheetView(student: selectedStudent) { newStudent in
                            if let index = students.firstIndex(where: { $0.id == selectedStudent?.id }) {
                                students[index] = newStudent
                            } else {
                                students.append(newStudent)
                                if let encodeData = try?JSONEncoder().encode(students) {
                                    UserDefaults.standard.set(encodeData, forKey: "StudentInfo")
                                    
                                    print("The Encode data will be \(encodeData)")
                                    
                                }
                            }
                            
                                
                            isShowingBottomSheet = false
                        }
                    }
                }
                
            }
            .navigationTitle("Student Details")
            .navigationBarBackButtonHidden(true) // Hides the back button

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        selectedStudent = nil
                        isShowingBottomSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                }
            }
        
            .onAppear {
                
                if let decodeData = UserDefaults.standard.data(forKey: "StudentInfo") {
                    
                    let decode = try! JSONDecoder().decode([StudentModel].self,from: decodeData)
                    students = decode
                    
                    print("The Decode data will be \(decode)")
                }
            }
    }
}

#Preview {
    StudentDetails()
}

