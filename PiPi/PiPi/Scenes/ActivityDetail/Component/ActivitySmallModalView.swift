//
//  ActivitySmallModal.swift
//  PiPi
//
//  Created by Byeol Kim on 8/6/24.
//

import SwiftUI

struct ActivitySmallModalView: View {
    
    @Binding var activity: Activity?
    @Binding var errorMessage: String?
    
    @ObservedObject var viewModel = RegistrationStatusViewModel()
    
    var body: some View {
        
        
        if let activity = activity {
            VStack{
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
            }
            .padding([.top, .leading], 10)
            
        }
        else if let errorMessage = errorMessage {
            Text("Error: \(errorMessage)")
        } else {
            Text("Loading...")
        }
    }
}
    
struct ActivitySmallModal_Previews: PreviewProvider {
    @State static var activity: Activity? = Activity(
        hostID: "123",
        title: "Sample Activity",
        description: "This is a sample activity description.",
        maxPeopleNumber: 10,
        category: .sport,
        startDateTime: Date(),
        estimatedTime: 60,
        coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194)
    )
    @State static var errorMessage: String? = nil
    
    static var previews: some View {
        ActivitySmallModalView(activity: $activity, errorMessage: $errorMessage)
    }
}
