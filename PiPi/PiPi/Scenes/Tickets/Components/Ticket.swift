//
//  TicketView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

// TODO: 데이터 연결 예정 (현재 목업 데이터로 구성)
struct Ticket: View {
    @State private var isShowingModal: Bool = false
    @Binding var selectedPicker: tabInfo
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(selectedPicker == .participant ? .orange : .purple)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "figure.run.circle.fill")
                            .font(.title2)
                        
                        Text("제목")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        ticketInfoCell(align: .trailing, title: "날짜", description: "2024.07.29")
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(selectedPicker == .participant ? "주최자" : "참가자")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.gray)
                            
                            if selectedPicker == .participant {
                                Text("닉네임")
                            } else {
                                Button {
                                    self.isShowingModal = true
                                } label: {
                                    Text("리스트")
                                }
                                .buttonStyle(.bordered)
                                .tint(.white)
                                .sheet(isPresented: self.$isShowingModal) {
                                    PeopleListModal()
                                }
                            }
                        }
                        
                        
                        Spacer()
                        
                        // TODO: 인증여부에 따른 상태관리 예정
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 20)
                    
                    ticketInfoCell(title: "장소", description: "체육관")
                    
                    Spacer()
                    
                    HStack {
                        ticketInfoCell(title: "시간", description: "19:30 - \n21:30")
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 50, height: 50)
                            
                            // TODO: 인증 기능 구현 예정
                            Image(systemName: selectedPicker == .participant ? "qrcode" : "camera.fill")
                                .font(selectedPicker == .participant ? .title : .title2)
                                .foregroundColor(.black)
                        }
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
        }
        .frame(width: 350, height: 350)
    }
    
    @ViewBuilder
    private func ticketInfoCell(align: HorizontalAlignment = .leading, title: String, description: String = "") -> some View {
        VStack(alignment: align) {
            Text(title)
                .font(.caption)
                .bold()
                .foregroundColor(.gray)
            Text(description)
        }
    }
}

#Preview {
    Ticket(selectedPicker: .constant(.participant))
}
