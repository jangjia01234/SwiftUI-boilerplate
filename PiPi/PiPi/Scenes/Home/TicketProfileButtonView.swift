//
//  TicketProfileButtonView.swift
//  PiPi
//
//  Created by 정상윤 on 7/30/24.
//

import SwiftUI

struct TicketProfileButtonView: View {
    
    var body: some View {
        HStack {
            Button(action: {
                // TODO: 티켓 뷰 시트 표시
            }) {
                Image(systemName: "ticket.fill")
                    .setAppearance()
            }
            .setAppearance()
            
            Spacer()
            
            Button(action: {
                // TODO: 프로필 뷰 시트 표시
            }) {
                Image(systemName: "person.fill")
                    .setAppearance()
            }
            .setAppearance()
        }
    }

}

fileprivate extension Button {
    
    func setAppearance() -> some View {
        self
            .frame(width: 36, height: 36)
            .background(Color(uiColor: .systemGray2))
            .tint(.white)
            .clipShape(Circle())
    }
    
}

fileprivate extension Image {
    
    func setAppearance() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
    }
    
}

#Preview {
    TicketProfileButtonView()
}
