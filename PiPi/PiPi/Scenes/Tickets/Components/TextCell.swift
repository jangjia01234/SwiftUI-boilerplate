//
//  TextCell.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

struct TextCell: View {
    var content: String
    var font: Font = .body
    var weight: Font.Weight = .regular
    
    var body: some View {
        Text(content)
            .font(font)
            .fontWeight(weight)
    }
}

#Preview {
    TextCell(content: "")
}
