//
//  SymbolCell.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

struct SymbolCell: View {
    var name: String
    var font: Font = .body
    var color: Color = .gray
    
    var body: some View {
        Image(systemName: name)
            .font(font)
            .foregroundColor(color)
    }
}

#Preview {
    SymbolCell(name: "")
}
