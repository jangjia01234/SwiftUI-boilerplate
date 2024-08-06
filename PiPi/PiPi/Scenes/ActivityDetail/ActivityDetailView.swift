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
    
    @State private var activity: Activity?
    @State private var join = false
    @State private var showMessageView = false
    @State private var coordinates: Coordinates?
    @State private var errorMessage: String?
    @State private var isLocationVisible: Bool = false
    
    private let databaseManager = FirebaseDataManager.shared
    
    @ObservedObject var viewModel = RegistrationStatusViewModel()
    
    @AppStorage("userID") private var userID: String?
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.size.height <= 150 {
                    
                    VStack{
                        if let activity = activity {
                            HStack{
                                Text(activity.title)
                                    .font(.title)
                                Spacer()
                                Text(viewModel.status)
                                          .font(.callout)
                                          .padding()
                                          .foregroundColor(viewModel.status == "모집완료" ? .red : .accent)
                                          .bold()
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
                            Text(activity?.title ?? "제목")
                                .font(.title)
                            Spacer()
                            Text(viewModel.status)
                                      .font(.callout)
                                      .padding()
                                      .foregroundColor(viewModel.status == "모집완료" ? .red : .accent)
                                      .bold()
                        }
                        Text(activity?.description ?? "소제목")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.top, .leading], 20)
                    
                    List {
                        Section {
                            VStack(alignment: .leading, spacing: 8) {
                                
                                ActivityDetail(label: "날짜", activityData: activity?.startDateTime.toString() ?? "Date")
                                ActivityDetail(label: "시작시간", activityData: activity?.startDateTime.toString(format: "HH:mm") ?? "00:00")
                                ActivityDetail(label: "예상 소요시간", activityData: "\(activity?.estimatedTime ?? 0)시간")
                                ActivityDetail(label: "최대인원", activityData: "\(activity?.maxPeopleNumber ?? 0)")
                                ActivityDetail(label: "카테고리", activityData: activity?.category.rawValue ?? "")
                                
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
        .onAppear {
            fetchActivityData()
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
            if let activity = activity {
                SelectedMapView(coordinate: activity.coordinates.toCLLocationCoordinate2D)
            } else {
                Text("위치 정보를 불러올 수 없습니다.")
            }
        }
    }
    
    
    private func fetchActivityData() {
          databaseManager.fetchData(type: .activity, dataID: id) { (result: Result<Activity, Error>) in
              switch result {
              case .success(let fetchedActivity):
                  DispatchQueue.main.async {
                      self.activity = fetchedActivity
                  }
              case .failure(let error):
                  DispatchQueue.main.async {
                      self.errorMessage = error.localizedDescription
                  }
              }
          }
      }
      
    
    private func addParticipant() {
        guard let userID = userID else {
            print("User ID is not set")
            return
        }
        
        guard var activity = activity else {
            print("Activity not loaded")
            return
        }
        
        if !activity.participantID.contains(userID) {
            activity = activity.addingParticipant(userID)
            self.activity = activity
            
            do {
                try databaseManager.updateData(activity, type: .activity, id: activity.id) // 데이터 업데이트
                print("Participant ID updated successfully")
            } catch {
                print("Error updating participant ID: \(error.localizedDescription)")
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
    ActivityDetailView(id: .constant("10790E3E-B2AA-4AAF-9C17-43F30BF54B4A"), nickname: .constant("d"))
}
