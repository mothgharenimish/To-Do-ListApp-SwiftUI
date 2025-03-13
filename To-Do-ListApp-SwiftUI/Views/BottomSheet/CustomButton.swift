//
//  CustomButton.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import SwiftUI

struct CustomButton: View {
    
    var label: String
    var background: Color
    var textColor: Color = .white.opacity(0.9)
    var action: (() -> ())
    let cornorRadius: CGFloat = 30
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack {
                Text(label)
                    .foregroundColor(textColor)
                    .font(.system(size: 16, weight: .bold))
                    .lineLimit(1)
            }
            //                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .frame(width: 160,height: 55)
            .overlay(
                RoundedRectangle(cornerRadius: cornorRadius)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            )
            
        }
        .background(background)
        .cornerRadius(cornorRadius)
    }
}

#Preview {
    CustomButton(label: "Edit", background: .mint, action: {
        print("Button tapped")
    })
}
