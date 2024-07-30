//
//  TicketView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

// TODO: 데이터 연결 예정 (현재 목업 데이터로 구성)
struct TicketView: View {
    @State private var isShowingModal: Bool = false
    @Binding var selectedPicker: tabInfo
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(selectedPicker == .participant ? .orange : .purple)
            
            HStack {
                VStack(alignment: .leading) {
                    header
                    ticketInfo
                    Spacer()
                    authentication
                }
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(width: 350, height: 350)
    }
    
    private var header: some View {
        HStack {
            SymbolCell(name: "figure.run.circle.fill", font: .title2, color: .white)
            TextCell(content: "제목", font: .title2, weight: .bold)
            Spacer()
            TicketInfoCell(align: .trailing, title: "날짜", description: "2024.07.29")
        }
    }
    
    private var ticketInfo: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    TicketInfoCell(align: .leading, title: selectedPicker == .participant ? "주최자" : "참가자")

                    if selectedPicker == .organizer {
                        Button {
                            self.isShowingModal = true
                        } label: {
                            TextCell(content: "리스트")
                        }
                        .buttonStyle(.bordered)
                        .tint(.white)
                        .sheet(isPresented: self.$isShowingModal) {
                            PeopleListModal()
                        }
                    } else { TextCell(content: "닉네임") }
                }
                
                Spacer()
                
                // TODO: 인증여부에 따른 상태관리 예정
                SymbolCell(name: "checkmark.circle.fill")
            }
            .padding(.vertical, 20)
            
            TicketInfoCell(title: "장소", description: "체육관")
        }
    }
    
    private var authentication: some View {
        HStack {
            TicketInfoCell(title: "시간", description: "19:30 - \n21:30")
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                
                // TODO: 인증 기능 구현 예정
                SymbolCell(name: selectedPicker == .participant ? "qrcode" : "camera.fill", font: selectedPicker == .participant ? .title : .title2, color: .black)
            }
        }
    }
}

#Preview {
    TicketView(selectedPicker: .constant(.participant))
}
