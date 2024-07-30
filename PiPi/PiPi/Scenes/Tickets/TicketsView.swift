//
//  TicketsView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

enum tabInfo : String, CaseIterable {
    case participant = "참가자"
    case organizer = "주최자"
}

struct TicketsView: View {
    @State private var selectedPicker: tabInfo = .participant
    
    var body: some View {
        VStack {
            title()
            tabBar()
            ticketView()

            Spacer()
        }
        .padding()
    }
    
    // MARK: - 상단 타이틀 영역
    @ViewBuilder
    private func title() -> some View {
        HStack {
            Text("내 티켓")
                .font(.title)
                .bold()
            
            Spacer()
            
            Image(systemName: "house.fill")
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - 참가자/주최자 탭바
    @ViewBuilder
    private func tabBar() -> some View {
        ZStack {
            HStack {
                ForEach(tabInfo.allCases, id: \.self) { item in
                    VStack {
                        Text(item.rawValue)
                            .frame(maxWidth: .infinity/4, minHeight: 25)
                            .foregroundColor(selectedPicker == item ? .black : .gray)
                            .fontWeight(selectedPicker == item ? .semibold : .regular)
                        
                        if selectedPicker == item {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 84, height: 3)
                        }
                    }
                    .onTapGesture {
                        self.selectedPicker = item
                    }
                }
            }
            
            Divider()
                .padding(.top, 38)
        }
        .padding(.bottom, 40)
    }
    
    // MARK: - 티켓 뷰
    struct ticketView: View {
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 350, height: 350)
                
                Text("티켓")
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TicketsView()
}
