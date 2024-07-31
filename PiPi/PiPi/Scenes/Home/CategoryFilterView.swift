//
//  CategoryFilterView.swift
//  PiPi
//
//  Created by 정상윤 on 7/30/24.
//

import SwiftUI

struct CategoryFilterView: View {
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(Activity.Category.allCases, id: \.rawValue) { category in
                CategoryButton(category: category)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 100)
                    )
                    .setShadow()
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    CategoryFilterView()
}
