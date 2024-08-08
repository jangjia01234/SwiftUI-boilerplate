//
//  ActivityDetailHeader.swift
//  PiPi
//
//  Created by 정상윤 on 8/8/24.
//

import SwiftUI

struct ActivityDetailHeaderView: View {
    
    let title: String
    let description: String
    let status: Activity.State
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Text(status.rawValue)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(
                        status == .open ? .accent : .red
                    )
            }
            Text(description)
                .font(.callout)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ActivityDetailHeaderView(
        title: "제목",
        description: "설명",
        status: .open
    )
}
