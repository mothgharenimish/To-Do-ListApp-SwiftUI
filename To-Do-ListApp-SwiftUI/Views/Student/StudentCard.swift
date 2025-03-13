//
//  StudentCard.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import SwiftUI

struct StudentCard: View {
    
    var students : StudentModel?
    var deleteaction : (() -> ())
    var editaction : (() ->())
    var body: some View {
        HStack(spacing: 10){
            
            Image("images")
                .resizable()
                .frame(width: 120,height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .shadow(radius:1.0)
                .padding(.leading,8)
            
            VStack(alignment:.leading,spacing: 10) {
                
                Text((students?.student_name)!)
                    .font(.headline)
                    .fontWeight(.bold)

                Text((students?.student_email!)!)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                
                Text((students?.student_class)!)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                
                Text((students?.student_rollno!)!)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                
                HStack {
                    Button(action: {
                        editaction()
                        print("Edit Button Clicked")
                    }) {
                        Text("Edit")
                            .frame(width: 100, height: 40) // Set width and height
                            .background(Color.green) // Apply background color
                            .foregroundColor(.white) // Text color
                            .cornerRadius(8) // Optional: Rounded corners
                    }

                    Button(action: {
                        deleteaction()
                        print("Delete Button Clicked")
                    }) {
                        Text("Delete")
                            .frame(width: 100, height: 40) // Set width and height
                            .background(Color.red) // Apply background color
                            .foregroundColor(.white) // Text color
                            .cornerRadius(8) // Optional: Rounded corners
                    }
                }
                
            }
        }
        
        .frame(width: 380,height: 200,alignment: .leading)

        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .shadow(radius: 8.0)
        
    }
}

#Preview {
    StudentCard(students: StudentModel(id: 0, student_name: "Nimish Mothghare", student_email: "nimishm90@gmail.com", student_class: "9th Standard", student_rollno: "18 Roll No"), deleteaction: {
        print("Tapped on the Delete Button")
    }, editaction: {
        print("Tapped on the Edit Button")
    })

}
