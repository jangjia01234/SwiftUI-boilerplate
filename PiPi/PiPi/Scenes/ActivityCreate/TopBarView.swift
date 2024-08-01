//
//  TopBarView.swift
//  PiPi
//
//  Created by 정상윤 on 7/31/24.
//

import SwiftUI

struct TopBarView: View {
    
    @Environment(\.dismiss) private var dismiss
    let doneButtonAction: () -> Void
    
    var body: some View {
        HStack {
            Button("취소") {
                dismiss()
            }
            
            Text("활동 등록")
                .frame(maxWidth: .infinity, alignment: .center)
                .bold()
            
            Button("완료") {
                doneButtonAction()
            }
            .bold()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 42)
        .padding(.horizontal)
        .background(.white)
    }
}

#Preview {
    TopBarView() {}
}
