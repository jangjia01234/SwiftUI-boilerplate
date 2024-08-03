//
//  ProfileView.swift
//  PiPi
//
//  Created by 신혜연 on 8/3/24.
//

import SwiftUI
import FirebaseDatabase

struct ProfileView: View {
    
    @State private var nickname: String = ""
    @State private var affiliation: String = ""
    @State private var address: String = ""
    @State private var level: String = ""
    
    @AppStorage("userID") var userID: String?  // @AppStorage로 UserDefaults로부터 값 불러올떄
    private let databaseManager = FirebaseDataManager.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("프로필")
                        .bold()
                        .font(.system(size: 28))
                        .padding(. leading, 23)
                    Spacer()
                    
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "house.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 23)
                    }
                }
                .padding(.bottom, 20)
                
                Divider()
                    .padding(.bottom, 13)
                
                HStack {
                    Spacer()
                    Button {
                        // TODO : CRUD 수정 구현
                    } label: {
                        Text("수정")
                            .padding(.trailing, 23)
                            .padding(.bottom, -10)
                            .foregroundColor(Color("AccentColor"))
                    }
                }
                
                List {
                    Section {
                        HStack {
                            Text("닉네임")
                                .frame(width: 60, alignment: .leading)
                            Text(nickname)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        
                        HStack {
                            Text("소속")
                                .frame(width: 60, alignment: .leading)
                            Text(affiliation)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        
                        HStack {
                            Text("이메일")
                                .frame(width: 60, alignment: .leading)
                            Text(address)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        
                        HStack {
                            Text("레벨")
                                .frame(width: 60, alignment: .leading)
                            Text(level)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color(.secondarySystemBackground))
                }
                
                .scrollContentBackground(.hidden)
            }
            .onAppear {
                if let userID = userID {
                    loadProfile(userID: userID)
                } else {
                    print("User ID is not set")
                }
            }
        }
    }
    private func loadProfile(userID: String) {
        databaseManager.fetchData(type: .user, id: userID) { (result: Result<UserProfile, Error>) in
            switch result {
            case .success(let profile):
                DispatchQueue.main.async {
                    self.nickname = profile.nickname
                    self.affiliation = profile.affiliation
                    self.address = profile.address
                    self.level = profile.level
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error fetching profile: \(error.localizedDescription)")
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
