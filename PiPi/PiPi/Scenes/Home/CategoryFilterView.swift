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
                categoryButton(category)
            }
        }
        .padding(.vertical)
    }
    
    private func categoryButton(_ category: Activity.Category) -> some View {
        HStack {
            Image(systemName: category.imageName)
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundStyle(.accent)
                .bold()
            
            Text(category.rawValue)
                .foregroundStyle(.black)
        }
        .frame(height: 30)
        .font(.footnote)
    }
    
}

#Preview {
    CategoryFilterView()
}
