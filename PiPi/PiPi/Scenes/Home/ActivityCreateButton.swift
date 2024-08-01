//
//  CreateActivityButton.swift
//  PiPi
//
//  Created by 정상윤 on 7/31/24.
//

import SwiftUI

struct ActivityCreateButton: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
                .fontWeight(.semibold)
        }
        .frame(width: 60, height: 60)
        .background(.white)
        .tint(.accent)
        .clipShape(Circle())
        .setShadow()
    }
    
}

#Preview {
    ActivityCreateButton(isPresented: .constant(false))
}
