//
//  ActivityDetailView.swift
//  PiPi
//
//  Created by Byeol Kim on 7/30/24.
//

import SwiftUI

struct ActivityDetailView: View {
    @State private var join = false
    @State private var showMessageView = false
    @ObservedObject var viewModel = RegistrationStatusViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.size.height <= 150 {
                    VStack{
                        HStack{
                            Text("제목")
                                .font(.title)
                            Spacer()
                            Text(viewModel.status)
                                      .font(.callout)
                                      .padding()
                                      .foregroundColor(viewModel.status == "모집완료" ? .red : .accent)
                                      .bold()
                        }
                        Text("소제목")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.top, .leading], 10)
                }
                else {
                    VStack {
                        HStack {
                            Text("제목")

                                .font(.title)
                            Spacer()
                            Text(viewModel.status)
                                      .font(.callout)
                                      .padding()
                                      .foregroundColor(viewModel.status == "모집완료" ? .red : .accent)
                                      .bold()
                        }
                        
                        Text("소제목")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.top, .leading], 20)
                    
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
                        .listRowBackground(Color(.secondarySystemBackground))
                        // 주최자 정보
                        // TODO: 주최자 정보 서버에서 불러오기
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
                        .listRowBackground(Color(.secondarySystemBackground))
                    }
                    .scrollContentBackground(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                }
            }
        }
        
        HStack{
            Button(action: {
                self.join.toggle()
            }) {
                Text("참가신청")
                    .foregroundColor(.white)
                    .font(.callout)
                    .bold()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(viewModel.status == "모집완료" ? Color.gray : Color.accent) 
                    .cornerRadius(10)
                    .padding(.leading)
            }
            .disabled(viewModel.status == "모집완료")
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
                self.showMessageView = true
            }) {
                Image(systemName: "ellipsis.message")
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.trailing)
            .sheet(isPresented: $showMessageView) {
                        iMessageConnect()
                    }
        }
    }
}



#Preview {
    ActivityDetailView()
        .background(.white)
}
