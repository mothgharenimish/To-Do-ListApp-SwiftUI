//
//  SplashScreen.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 13/03/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive : Bool = false
    let studdetails = StudentDetails()
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color(UIColor(hex: "#bb9a8f") ?? .clear)
                    .edgesIgnoringSafeArea(.all)
                
              
                
                VStack {
                    
                    Image("images-removebg-preview")
                        .resizable()
                        .frame(width: 200,height: 200)
                    
                    NavigationLink(destination: studdetails,
                                   isActive: $isActive,
                                   label: { EmptyView() }
                                   
                    
                    )
                    .navigationBarBackButtonHidden(true) // Ensure it's hidden here as well


                }
                
                .onAppear(perform: {
                    self.gotoStudentScreen(time: 2.5)
                })
            }
        }
    }
    
    func gotoStudentScreen(time: Double) {
           DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
               self.isActive = true
           }
       }
}

#Preview {
    SplashScreen()
}
