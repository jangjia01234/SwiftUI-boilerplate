//
//  ActivityDetailView.swift
//  PiPi
//
//  Created by Byeol Kim on 7/30/24.
//

import SwiftUI
import MapKit
import CoreLocation
import Firebase
import FirebaseDatabase

struct ActivityDetailView: View {
    
    @Binding var id: String
    @Binding var nickname: String
    
    @State private var join = false
    @State private var showMessageView = false
    @State private var coordinates: Coordinates?
    @State private var errorMessage: String?
    @State private var isLocationVisible: Bool = false
    
    @ObservedObject var model = ActivityViewModel()
    @ObservedObject var viewModel = RegistrationStatusViewModel()
    
    @AppStorage("userID") private var userID: String?
    private var ref: DatabaseReference!
    
    init(id: Binding<String>, nickname: Binding<String>) {
        self._id = id
        self._nickname = nickname
        self.ref = Database.database().reference()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.size.height <= 150 {
                    
                    VStack{
                        if let activity = model.activity {
                            HStack{
                                Text(activity.title)
                                    .font(.title)
                                Spacer()
                                Text("모집여부")
                                    .font(.callout)
                                    .background(.accent)
                                    .padding()
                            }
                            Text(activity.description)
                                .font(.callout)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else if let errorMessage = errorMessage {
                            Text("Error: \(errorMessage)")
                        } else {
                            Text("Loading...")
                        }
                    }
                    .padding([.top, .leading], 10)
                } else {
                    VStack {
                        HStack {
                            Text(model.activity?.title ?? "제목")
                                .font(.title)
                            Spacer()
                            Text(viewModel.status)
                                      .font(.callout)
                                      .padding()
                                      .foregroundColor(viewModel.status == "모집완료" ? .red : .accent)
                                      .bold()
                        }
                        Text(model.activity?.description ?? "소제목")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.top, .leading], 20)
                    
                    List {
                        Section {
                            VStack(alignment: .leading, spacing: 8) {
                                
                                ActivityDetail(label: "날짜", activityData: model.activity?.startDateTime.toString() ?? "Date")
                                ActivityDetail(label: "시작시간", activityData: model.activity?.startDateTime.toString(format: "HH:mm") ?? "00:00")
                                ActivityDetail(label: "예상 소요시간", activityData: "\(model.activity?.estimatedTime ?? 0)시간")
                                ActivityDetail(label: "최대인원", activityData: "\(model.activity?.maxPeopleNumber ?? 0)")
                                ActivityDetail(label: "카테고리", activityData: model.activity?.category.rawValue ?? "")
                                
                                HStack {
                                    Text("위치")
                                        .frame(width: 120, alignment: .leading)
                                    Button("지도보기") {
                                        isLocationVisible = true
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color(.secondarySystemBackground))
                        
                        Section(header: Text("주최자 정보")) {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("주최자")
                                        .frame(width: 120, alignment: .leading)
                                    Text("배드민턴왕위니")
                                }
                                HStack {
                                    Text("참여도")
                                        .frame(width: 120, alignment: .leading)
                                    Text("Lv.10")
                                }
                            }
                        }
                        .listRowBackground(Color(.secondarySystemBackground))
                    }
                    .scrollContentBackground(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                }
            }
        }
        
        HStack {
            Button(action: {
                self.join.toggle()
            }) {
                Text("참가신청")
                    .foregroundColor(.white)
                    .font(.callout)
                    .bold()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(viewModel.status == "모집완료" ? Color.gray : Color.accent) 
                    .cornerRadius(10)
                    .padding(.leading)
            }
            .disabled(viewModel.status == "모집완료")
            .alert(isPresented: $join) {
                let firstButton = Alert.Button.default(Text("취소")) {
                    print("취소 button pressed")
                }
                let secondButton = Alert.Button.cancel(Text("신청")) {
                    // TODO: 신청 버튼 누르면 사용자의 정보가 서버 신청자 데이터로 넘어감
                    addParticipant()
                }
                return Alert(title: Text("신청하시겠습니까?"),
                             message: Text("신청이 완료된 이벤트는 티켓에 추가됩니다."),
                             primaryButton: firstButton, secondaryButton: secondButton)
            }
            
            Button(action: {
                self.showMessageView = true
            }) {
                Image(systemName: "ellipsis.message")
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.trailing)
            .sheet(isPresented: $showMessageView) {
                iMessageConnect()
            }
        }
        .sheet(isPresented: $isLocationVisible) {
            if let activity = model.activity {
                SelectedMapView(coordinate: activity.coordinates.toCLLocationCoordinate2D)
            } else {
                Text("위치 정보를 불러올 수 없습니다.")
            }
        }
    }
    private func addParticipant() {
        guard let userID = userID else {
            print("User ID is not set")
            return
        }
        
        guard var activity = model.activity else {
            print("Activity not loaded")
            return
        }
        
        if !activity.participantID.contains(userID) {
            activity = activity.addingParticipant(userID)
            model.activity = activity
            
            let activityData = try! JSONEncoder().encode(activity)
            let json = try! JSONSerialization.jsonObject(with: activityData, options: .fragmentsAllowed)
            ref.child("activities/\(activity.id)").setValue(json) { error, _ in
                if let error = error {
                    print("Error updating participant ID: \(error.localizedDescription)")
                } else {
                    print("Participant ID updated successfully")
                }
            }
        } else {
            print("Participant already exists")
        }
    }
}

struct ActivityDetail : View {
    var label : String
    var activityData : String
    
    var body: some View {
        HStack {
            Text(label)
                .frame(width: 120, alignment: .leading)
            Text(activityData)
        }
    }
}

#Preview {
    ActivityDetailView(id: .constant("C6D5689C-ABB7-4D81-99C8-ACBEA9D2E513"), nickname: .constant("d"))
}
