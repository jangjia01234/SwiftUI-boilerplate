//
//  TicketInfoCell.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

struct TicketInfoCell: View {
    var align: HorizontalAlignment = .leading
    var title: String
    var description: String = ""
    
    var body: some View {
        VStack(alignment: align) {
            Text(title)
                .font(.caption)
                .bold()
                .foregroundColor(.gray)
            Text(description)
        }
    }
}
#Preview {
    TicketInfoCell(title: "")
}
