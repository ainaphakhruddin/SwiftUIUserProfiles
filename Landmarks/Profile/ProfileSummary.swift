//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Aina Phakhruddin on 1/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    //take a profile value (not binding to prfile because ProfileHost (parent view)
    //manages the stat fro this view
    var profile: Profile
    static let goalFormat: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    var body: some View {
        List {
            Text(profile.username)
                .font(.title)
                .fontWeight(.bold)
            Text("Notification: \(self.profile.prefersNotifications ? "On": "Off" )")
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading){
                Text("Completed Badges")
                    .font(.headline)
                ScrollView{
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(/*@START_MENU_TOKEN@*/Angle(degrees: 90)/*@END_MENU_TOKEN@*/)
                        
                        HikeBadge(name: "10th Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                        

                    }
                }
                .frame(height: 140)
                
            }
            
            VStack(alignment: .leading)
            {
                Text("Recent Hikes")
                    .font(.headline)
                HikeView(hike: hikeData[0])
            }
        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
