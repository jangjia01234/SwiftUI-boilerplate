//
//  CategoryButton.swift
//  PiPi
//
//  Created by 정상윤 on 7/30/24.
//

import SwiftUI

struct CategoryButton: View {
    
    let category: Activity.Category
    
    var body: some View {
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
    CategoryButton(category: .meal)
}
