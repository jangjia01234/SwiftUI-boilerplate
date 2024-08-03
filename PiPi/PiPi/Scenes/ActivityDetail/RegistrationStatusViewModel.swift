//
//  RegistrationStatusViewModel.swift
//  PiPi
//
//  Created by Byeol Kim on 8/3/24.
//

import SwiftUI
import Combine
import FirebaseDatabase

class RegistrationStatusViewModel: ObservableObject {
    
    @ObservedObject var model = ActivityViewModel()
    
    
      @Published var status: String = "모집중"
      
      private var cancellables = Set<AnyCancellable>()
      
    init() {
           model.$activity
               .sink { [weak self] activity in
                   guard let activity = activity
                   else { return }
                   self?.status = activity.currentPeopleNumber >= activity.maxPeopleNumber ? "모집완료" : "모집중"
               }
               .store(in: &cancellables)
       }
   }
