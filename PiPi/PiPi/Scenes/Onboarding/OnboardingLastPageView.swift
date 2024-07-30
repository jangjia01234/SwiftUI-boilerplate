//
//  OnboardingLastPageView.swift
//  PiPi
//
//  Created by 신혜연 on 7/30/24.
//

import SwiftUI

struct OnboardingLastPageView: View {

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
            
            VStack(spacing: 6) {
                Text("닉네임")
                    .font(.subheadline)
                    .padding(.trailing, 280)
                
                TextField("닉네임을 입력해주세요.", text: $nickname)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                
                Text("소속")
                    .font(.subheadline)
                    .padding(.trailing, 280)
                
                Picker("소속을 선택해주세요.", selection: $affiliation) {
                    ForEach(affiliations, id: \.self) { affiliation in
                        Text(affiliation).tag(affiliation)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical, 6)
                .padding(.horizontal, 20)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                
                Text("이메일")
                    .font(.subheadline)
                    .padding(.trailing, 280)
                
                TextField("iCloud 이메일을 입력해주세요.", text: $address)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocapitalization(.none) // 첫 대문자 비활성화
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 36)
            .padding(.bottom, 25)
            
            Button {
                isFirstLaunching.toggle()
            } label: {
                Text("시작하기")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 332, height: 48)
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            .padding(.bottom, 186)
        }
    }
}

struct OnboardingLastPageView_Previews: PreviewProvider {
    @State static var isFirstLaunching = true
    
    static var previews: some View {
        OnboardingLastPageView(isFirstLaunching: $isFirstLaunching)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
