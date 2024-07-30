//
//  CategoryFilterView.swift
//  PiPi
//
//  Created by 정상윤 on 7/30/24.
//

import SwiftUI

struct CategoryFilterView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Activity.Category.allCases, id: \.rawValue) { category in
                    CategoryButton(category: category)
                        .background(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 100)
                        )
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
    }
    
}

#Preview {
    CategoryFilterView()
}
