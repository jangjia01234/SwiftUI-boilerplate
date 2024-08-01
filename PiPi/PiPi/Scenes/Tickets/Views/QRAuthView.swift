//
//  QRAuthView.swift
//  PiPi
//
//  Created by Jia Jang on 8/1/24.
//

import SwiftUI

struct QRAuthView: View {
    @Binding var isShowingAuth: Bool
    @Binding var isAuthDone: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.accent)
                    .padding(.bottom, 10)
                
                Text("아래 버튼을 클릭해서 \n참가 확정을 완료해주세요.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .padding(.bottom, 100)
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    print("인증되었습니다.")
                    isShowingAuth = false
                    isAuthDone = true
                }, label: {
                    Text("확인하기")
                        .bold()
                        .padding(10)
                        .padding(.horizontal, 100)
                })
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
    }
}

#Preview {
    QRAuthView(isShowingAuth: .constant(false), isAuthDone: .constant(false))
}
