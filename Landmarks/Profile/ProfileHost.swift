//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Aina Phakhruddin on 1/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            HStack{
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive
            {
            ProfileSummary(profile: draftProfile)
            }
            else
            {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
        .environmentObject(UserData())
    }
}