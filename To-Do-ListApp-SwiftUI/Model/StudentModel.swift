//
//  StudentModel.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import Foundation
import SwiftUI

struct StudentModel: Identifiable,Codable {
    var id: Int?
    let student_name: String?
    let student_email: String?
    let student_class: String?
    let student_rollno: String?
    
   
}


