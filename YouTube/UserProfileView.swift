//
//  UserProfileView.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 24/04/24.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack {
                    Text("username")
                    Text("@userid")
                }
                Spacer()
            }
            .padding()
            
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "play.rectangle")
                        .frame(width: 20, height: 20)
                    Text("Your Videos")
                    Spacer()
                }
                
                
                HStack {
                    Image("download")
                        .frame(width: 20, height: 20)
                    Text("Downloads")
                    Spacer()
                }
                
                HStack {
                    Image("help_feedback")
                        .frame(width: 20, height: 20)
                    Text("Help & Feedback")
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "play.rectangle")
                        .frame(width: 20, height: 20)
                    Text("Get YouTube Premium")
                    Spacer()
                }
            }
            .padding(20)
            
            Spacer()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
