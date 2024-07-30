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
    @Environment(\.dismiss) var dismiss
    @State private var selectedPicker: tabInfo = .participant
    
    var body: some View {
        NavigationStack {
            tabBar()
            ticketView()
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - 참가자/주최자 탭뷰 + 툴바
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
                .padding(.top, 35)
        }
        .navigationTitle("내 티켓")
        .toolbar {
            Button { dismiss() } label: {
                Image(systemName: "house.fill")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding(.top, 25)
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
