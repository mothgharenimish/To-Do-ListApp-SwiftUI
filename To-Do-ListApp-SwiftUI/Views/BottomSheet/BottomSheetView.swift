//
//  BottomSheetView.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import SwiftUI

struct BottomSheetView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var studentClass: String = ""
    @State private var rollNo: String = ""
    var onAdd: (StudentModel) -> Void
    var onEdit: (StudentModel) -> Void
    
    var students : StudentModel?


    
    var body: some View {
        VStack {
                    Text("Add Student")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        .padding(.top, 10)

                    FloatingTextField(placeHolder: "Full Name", text: $name)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 2)

                    FloatingTextField(placeHolder: "Email Address", text: $email)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 2)

                    FloatingTextField(placeHolder: "Student Class", text: $studentClass)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 2)

                    FloatingTextField(placeHolder: "Student Roll No", text: $rollNo)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 2)

            HStack {
                CustomButton(label: "Add", background: .black) {
                    let newStudent = StudentModel(
                        id: Int.random(in: 1...1000),
                        student_name: name,
                        student_email: email,
                        student_class: studentClass,
                        student_rollno: rollNo
                    )
                    onAdd(newStudent)
                }
                CustomButton(label: "Edit", background: .green, action: {
                    
                    name = (students?.student_name)!
                    email = (students?.student_email)!
                    studentClass = (students?.student_class)!
                    rollNo = (students?.student_rollno)!!
                    
                }
                )
                
            }
            
              
        }
    }
}

#Preview {
    BottomSheetView { newaddStudent in
        print("Student Added: \(newaddStudent)")
    } onEdit: { neweditStudent in
        print("Student Edited: \(neweditStudent)")
        
    }
}


struct FloatingTextField: View {
    let textFieldHeight: CGFloat = 50
    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false
    public init(placeHolder: String,
                text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: { (edit) in
                isEditing = edit
            })
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.secondary, lineWidth: 1)
            .frame(height: textFieldHeight))
            .foregroundColor(Color.primary)
            .accentColor(Color.secondary)
            .animation(.linear)
            ///Floating Placeholder
            Text(placeHolderText)
            .foregroundColor(Color.secondary)
                .background(Color(UIColor.systemBackground))
            .padding(shouldPlaceHolderMove ?
                     EdgeInsets(top: 0, leading:15, bottom: textFieldHeight, trailing: 0) :
                     EdgeInsets(top: 0, leading:15, bottom: 0, trailing: 0))
            .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
            .animation(.linear)
        }
    }
}
