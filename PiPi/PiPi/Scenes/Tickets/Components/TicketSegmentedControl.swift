//
//  TicketSegmentedControl.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

struct TicketSegmentedControl: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedPicker: TabInfo
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(TabInfo.allCases, id: \.self) { item in
                    VStack {
                        Text(item.rawValue)
                            .frame(maxWidth: .infinity/4, minHeight: 25)
                            .foregroundColor(selectedPicker == item ? .black : .gray)
                            .fontWeight(selectedPicker == item ? .semibold : .regular)
                        
                        if selectedPicker == item {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 84, height: 3)
                        }
                    }
                    .onTapGesture {
                        self.selectedPicker = item
                    }
                }
            }
            
            Divider()
                .padding(.top, 35)
        }
        .navigationTitle("내 티켓")
        .toolbar {
            Button { dismiss() } label: {
                Image(systemName: "house.fill")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding(.top, 25)
        .padding(.bottom, 40)
    }
}
#Preview {
    TicketSegmentedControl(selectedPicker: .constant(.participant))
}
