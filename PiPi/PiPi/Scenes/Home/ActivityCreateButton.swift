//
//  CreateActivityButton.swift
//  PiPi
//
//  Created by 정상윤 on 7/31/24.
//

import SwiftUI

struct ActivityCreateButton: View {
    
    var body: some View {
        Button(action: {
            // TODO: 활동 등록 화면 시트 표시
        }) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
                .fontWeight(.semibold)
        }
        .frame(width: 60, height: 60)
        .background(.white)
        .clipShape(Circle())
    }
    
}

#Preview {
    ActivityCreateButton()
}
