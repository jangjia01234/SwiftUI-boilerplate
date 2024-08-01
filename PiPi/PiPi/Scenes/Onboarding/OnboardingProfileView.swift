//
//  OnboardingLastPageView.swift
//  PiPi
//
//  Created by 신혜연 on 7/30/24.
//

import SwiftUI

struct OnboardingProfileView: View {
    
    @Binding var isFirstLaunching: Bool
    @State private var nickname: String = ""
    @State private var affiliation: String = ""
    @State private var address: String = ""
    
    let affiliations = [
        "포항공대",
        "애플 디벨로퍼 아카데미"
    ]
    
    var body: some View {
        VStack {
            Text("프로필을\n 설정해주세요!")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical, 64)
            
            VStack(spacing: 8) {
                Text("닉네임")
                    .font(.subheadline)
                    .bold()
                    .padding(.trailing, 260)
                
                TextField("닉네임을 입력해주세요.", text: $nickname)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: 280, height: 32)
                    .padding(.horizontal, 10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .font(.system(size: 16))
                
                Text("소속")
                    .font(.subheadline)
                    .bold()
                    .padding(.trailing, 270)
                
                Picker("소속을 선택해주세요.", selection: $affiliation) {
                    ForEach(affiliations, id: \.self) { affiliation in
                        Text(affiliation).tag(affiliation)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                .padding(.horizontal, 20)
                
                Text("이메일")
                    .font(.subheadline)
                    .bold()
                    .padding(.trailing, 260)
                
                HStack(spacing: 2) {
                    TextField("이메일을 입력해주세요.", text: $address)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 150, height: 32)
                        .padding(.horizontal, 10)
                        .autocapitalization(.none) // 첫 대문자 비활성화
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .font(.system(size: 16))
                    
                    Text("@icloud.com")
                        .font(.system(size: 14))
                }
                .padding(.trailing, 50)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 25)
            
            Button {
                isFirstLaunching.toggle()
            } label: {
                Text("완료")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 332, height: 48)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.bottom, 186)
        }
        .navigationBarBackButtonHidden(true)
    }
}
