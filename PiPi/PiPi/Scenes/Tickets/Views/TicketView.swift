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
    @Binding var selectedItem: TicketType
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(selectedItem == .participant ? .orange : .purple)
            
            VStack(alignment: .leading) {
                header()
                ticketDetailSection(selectedItem: selectedItem)
                Spacer()
                authenticationSection()
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(width: 350, height: 350)
        .sheet(isPresented: $isShowingModal) {
            PeopleListView()
        }
    }
}

private extension TicketView {
    func header() -> some View {
        HStack {
            symbolItem(name: "figure.run.circle.fill", font: .title2, color: .white)
            textItem(content: "제목", font: .title2, weight: .bold)
            Spacer()
            ticketInfoItem(align: .trailing, title: "날짜", content: "2024.07.29")
        }
    }
    
    func ticketDetailSection(selectedItem: TicketType) -> some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    ticketInfoItem(align: .leading, title: selectedItem == .participant ? "주최자" : "참가자", content: "")
                    
                    if selectedItem == .organizer {
                        Button {
                            isShowingModal = true
                        } label: {
                            textItem(content: "리스트")
                        }
                        .buttonStyle(.bordered)
                        .tint(.white)
                    } else { textItem(content: "닉네임") }
                }
                
                Spacer()
                
                // TODO: 인증여부에 따른 상태관리 예정
                symbolItem(name: "checkmark.circle.fill")
            }
            .padding(.vertical, 20)
            
            ticketInfoItem(title: "장소", content: "체육관")
        }
    }
    
    func authenticationSection() -> some View {
        HStack {
            ticketInfoItem(title: "시간", content: "19:30 - \n21:30")
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                
                // TODO: 인증 기능 구현 예정
                symbolItem(name: selectedItem == .participant ? "qrcode" : "camera.fill", font: selectedItem == .participant ? .title : .title2, color: .black)
            }
        }
    }
    
    func ticketInfoItem(align: HorizontalAlignment = .leading, title: String, content: String) -> some View {
        VStack(alignment: align) {
            Text(title)
                .font(.caption)
                .bold()
                .foregroundColor(.gray)
            Text(content)
        }
    }
    
    func textItem(content: String, font: Font = .body, weight: Font.Weight = .regular) -> some View {
        Text(content)
            .font(font)
            .fontWeight(weight)
    }
    
    func symbolItem(name: String, font: Font = .body, color: Color = .gray) -> some View {
        Image(systemName: name)
            .font(font)
            .foregroundColor(color)
    }
}

#Preview {
    TicketView(selectedItem: .constant(.participant))
}
