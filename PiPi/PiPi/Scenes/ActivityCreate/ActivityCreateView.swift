//
//  ActivityCreateView.swift
//  PiPi
//
//  Created by 정상윤 on 7/31/24.
//

import SwiftUI

struct ActivityCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused
    
    @State private var title = ""
    @State private var description = ""
    @State private var maxPeopleNumber = 1
    @State private var category: Activity.Category = .meal
    @State private var startDateTime = Date()
    @State private var estimatedTime: Int? = nil
    @State private var location: Coordinates? = nil
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $title)
                        .focused($isFocused)
                } header: {
                    header(title: "제목", subtitle: nil)
                }
                
                Section {
                    TextEditor(text: $description)
                        .focused($isFocused)
                } header: {
                    header(title: "설명", subtitle: nil)
                }
                Section {
                    Stepper("\(maxPeopleNumber)", value: $maxPeopleNumber, in: 1...20)
                } header: {
                    header(title: "최대인원", subtitle: "20명까지 가능합니다.")
                }
                
                Picker(selection: $category) {
                    ForEach(Activity.Category.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category as Activity.Category?)
                    }
                } label: {
                    Text("카테고리")
                }
                
                Section {
                    DatePicker("시작 일시", selection: $startDateTime, in: Date()...)
                    Picker(selection: $estimatedTime) {
                        Text("미정").tag(nil as Int?)
                        ForEach(1..<6) { time in
                            Text("\(time)").tag(time as Int?)
                        }
                    } label: {
                        Text("예상 소요시간")
                    }
                    NavigationLink(destination: {
                        LocationSelectView(coordinates: $location)
                            .navigationBarBackButtonHidden()
                    }) {
                        HStack {
                            Text("위치")
                            Text(location == nil ? "" : "선택 완료")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .padding(.top)
            .background(Color(.secondarySystemBackground))
            .navigationTitle("활동 등록")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("완료") {
                        isFocused = false
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("취소") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("완료") {
                        // TODO: 활동 등록 동작 구현
                    }
                }
            }
        }
    }
    
    private func header(title: String, subtitle: String?) -> some View {
        HStack {
            Text(title)
                .sectionHeaderAppearance()
            if let subtitle {
                Text(subtitle)
                    .font(.caption)
            }
        }
        .setListRowInsets()
    }
    
}

fileprivate extension Text {
    
    func sectionHeaderAppearance() -> some View {
        self
            .foregroundStyle(.black)
            .font(.callout)
            .fontWeight(.regular)
            .setListRowInsets()
    }
    
}

fileprivate extension View {
    
    func setListRowInsets() -> some View {
        self.listRowInsets(.init(top: 15, leading: 8, bottom: 8, trailing: 15))
    }
    
}

#Preview {
    ActivityCreateView()
}
