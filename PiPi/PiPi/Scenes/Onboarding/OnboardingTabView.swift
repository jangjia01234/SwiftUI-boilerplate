//
//  OnboardingTabView.swift
//  PiPi
//
//  Created by 신혜연 on 7/30/24.
//

import SwiftUI

struct OnboardingTabView: View {
    
    init() {
           // UIPageControl의 Appearance 설정
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple // 현재 페이지 색상
           UIPageControl.appearance().pageIndicatorTintColor = UIColor.purple.withAlphaComponent(0.2) // 다른 페이지 색상
       }
    
    @State private var isFirstLaunching = true
    
    var body: some View {
        TabView {
            // 페이지 1: 포피와 애피
            OnboardingPageView(imageName: "figure.stand.line.dotted.figure.stand",
                               title: "포피와 애피의 만남을 점으로 찍어보세요",
                               subtitle: "가깝지만 먼 포스텍 피플과 애플 피플의 교집합")
            // 페이지 2: 활동 등록
            OnboardingPageView(imageName: "figure.stand.line.dotted.figure.stand",
                               title: "우리가 같이 놀 수 있는 이벤트를 등록해요",
                               subtitle: "접점을 통해 우리가 만들어가는 플레이그라운드")
            // 페이지 3: 활동 참여
            OnboardingPageView(imageName: "figure.stand.line.dotted.figure.stand",
                               title: "맘에 드는 이벤트를 신청해요",
                               subtitle: "다양한 카테고리로 모인 우리가 점을 찍어 만든 커넥팅 닷")
            // 페이지 4: QR 인증
            OnboardingPageView(imageName: "figure.stand.line.dotted.figure.stand",
                               title: "QR로 활동을 인증해요",
                                   subtitle: "직접 만나 활동을 인증하고 우리 사이 원 만들기")
            OnboardingLastPageView(isFirstLaunching: $isFirstLaunching)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    OnboardingTabView()
}
