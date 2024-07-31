//
//  ActivityDetailView.swift
//  PiPi
//
//  Created by Byeol Kim on 7/30/24.
//

import SwiftUI

struct ActivityDetailView: View {
    @State private var join = false
    
    var body: some View {
        
        //TODO: 핀에 입력된 내용들 서버에서 불러오기
        GeometryReader { geometry in
            if geometry.size.height <= 150 {
                VStack {
                    HStack{
                        VStack{
                            Text("제목")
                                .font(.system(size: 28))
                                .padding(3)
                            Text("소제목")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Spacer()
                        VStack{
                            Text("모집여부")
                                .font(.system(size: 28))
                                .padding()
                            Spacer()
                        }
                    }
                }
                
            } else {
                List {
                    Section {
                        HStack {
                            Text("날짜")
                                .frame(width: 100, alignment: .leading)
                            Text("Date")
                            
                        }
                        HStack {
                            Text("시작시간")
                                .frame(width: 100, alignment: .leading)
                            Text("00:00")
                        }
                        HStack {
                            Text("종료시간")
                                .frame(width: 100, alignment: .leading)
                            Text("00:00")
                        }
                        HStack {
                            Text("최대인원")
                                .frame(width: 100, alignment: .leading)
                            Text("5")
                        }
                        HStack {
                            Text("카테고리")
                                .frame(width: 100, alignment: .leading)
                            Text("이넘 중 1개")
                        }
                        HStack {
                            Text("위치")
                                .frame(width: 100, alignment: .leading)
                            Text("지도에서 보여주기")
                        }
                    }
                    
                    //주최자 정보
                    //TODO: 주최자 정보 서버에서 불러오기
                    Section {
                        HStack {
                            Text("주최자")
                                .frame(width: 100, alignment: .leading)
                            Text("배드민턴왕위니")
                        }
                        HStack {
                            Text("참여도")
                                .frame(width: 100, alignment: .leading)
                            Text("Lv.10")
                        }
                    }
                }
            }
        }
        HStack{
            Button(action: {
                self.join.toggle()
            }) {
                Text("참가신청")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .bold()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .padding(.leading)
            }
            .alert(isPresented: $join) {
                let firstButton = Alert.Button.default(Text("취소")) {
                    print("취소 button pressed")
                }
                let secondButton = Alert.Button.cancel(Text("신청")) {
                    //TODO: 신청 버튼 누르면 사용자의 정보가 서버 신청자 데이터로 넘어감
                    print("신청 button pressed")
                }
                return Alert(title: Text("신청하시겠습니까?"),
                             message: Text("신청이 완료된 이벤트는 티켓에 추가됩니다."),
                             primaryButton: firstButton, secondaryButton: secondButton)
            }
            
            Button(action: {
                // TODO: 문의하기 버튼 누르면 아이메시지로 넘어가라
            }) {
                Image(systemName: "ellipsis.message")
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.trailing)
        }
    }
}


#Preview {
    ActivityDetailView()
}
