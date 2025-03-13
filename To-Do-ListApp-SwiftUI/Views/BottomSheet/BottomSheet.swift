//
//  BottomSheet.swift
//  To-Do-ListApp-SwiftUI
//
//  Created by Nimish Sharad Mothghare on 12/03/25.
//

import SwiftUI
//enum BottomSheetType: Int {
//    case studentsdetails = 0
//    
//    func view() -> AnyView {
//        switch self {
//        case  .studentsdetails:
//            return AnyView(BottomSheetView(onAdd: <#(StudentModel) -> Void#>))
//       
//        }
//    }
//}


struct BottomSheet: View {
    
    @Binding var isShowing: Bool
    var content: () -> BottomSheetView
    
    var body: some View {
        ZStack(alignment: .bottom) {
                   if isShowing {
                       Color.black.opacity(0.3)
                           .ignoresSafeArea()
                           .onTapGesture {
                               isShowing.toggle()
                           }

                       content()
                           .padding(.bottom, 42)
                           .transition(.move(edge: .bottom))
                           .background(Color.white)
                           .cornerRadius(16, corners: [.topLeft, .topRight])
                   }
               }
               .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
               .ignoresSafeArea()
               .animation(.easeInOut, value: isShowing)
        }
}

#Preview {
    BottomSheet(isShowing: .constant(true)) {
        BottomSheetView { _ in } onEdit: { newedited in
            print("The new edited student \(newedited)")
            
        }
       }
}
