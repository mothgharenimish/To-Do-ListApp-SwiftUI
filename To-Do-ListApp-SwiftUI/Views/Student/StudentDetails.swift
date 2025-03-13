//
//  StudentDetails.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import SwiftUI

struct StudentDetails: View {
    
    @State var isAddShowingBottomSheet = false
    @State var isEditShowingBottomSheet = false
    @State private var students: [StudentModel] = [
            StudentModel(id: 0, student_name: "Nimish Mothghare", student_email: "nimishm90@gmail.com", student_class: "9th Standard", student_rollno: "18 Roll No")
        ]

    var body: some View {
        
        NavigationView {
                   ZStack {
                       Color(UIColor(hex: "#bb9a8f") ?? .clear)
                                          .edgesIgnoringSafeArea(.all)

                       List {
                           ForEach(students.indices, id: \.self) { index in
                               StudentCard(students: students[index],
                                deleteaction: {
                                   print("Deleted the item Successfully")
                                   students.remove(at: index)
                               },
                                 editaction: {
                                   isEditShowingBottomSheet.toggle()
                               }
                               )
                                   .padding(.top, 10)
                           }
                           .listRowBackground(Color.clear)
                       }
                       .scrollContentBackground(.hidden)
                       .background(Color.clear)
                       .listStyle(.inset)

                       BottomSheet(isShowing: $isAddShowingBottomSheet) {
                           BottomSheetView { newStudent in
                               students.append(newStudent)


                           } onEdit: {_ in}
                       }
                   }
                   .navigationTitle("Student Details")
                   .toolbar {
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button {
                               isAddShowingBottomSheet.toggle()
                               
                           } label: {
                               Image(systemName: "plus")
                                   .foregroundStyle(.white)
                           }
                       }
                   }
               }
    }
}

#Preview {
    StudentDetails()
}

