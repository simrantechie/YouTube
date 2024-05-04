//
//  ContentView.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 23/04/24.
//

import SwiftUI

var optionsArr = ["All", "Gaming", "Music", "Science"]

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            TrendingView()
                .tabItem {
                    Label("Trending", systemImage: "flame")
                }
            
            SubscriptionsView()
                .tabItem {
                    Label("Subscriptions", systemImage: "play.rectangle")
                }
            
            UserProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(.black)
    }
}

struct HomeView: View {
    
    let viewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("YouTube")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.accentColor)
                    Text("YouTube")
                        .bold()
                    
                    Spacer()
                    
                    Image("search")
                        .frame(width: 20, height: 20)
                        .foregroundColor(.accentColor)
                }
                .padding()
                
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            print("All")
                        } label: {
                            Text("All")
                                .font(.system(size: 12))
                                .frame(width: 30, height: 30)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button {
                            print("Gaming")
                        } label: {
                            Text("Gaming")
                                .font(.system(size: 12))
                                .frame(width: 80, height: 30)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button {
                            print("Music")
                        } label: {
                            Text("Music")
                                .font(.system(size: 12))
                                .frame(width: 60, height: 30)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button {
                            print("Science")
                        } label: {
                            Text("Science")
                                .font(.system(size: 12))
                                .frame(width: 80, height: 30)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button {
                            print("ASMR")
                        } label: {
                            Text("ASMR")
                                .font(.system(size: 12))
                                .frame(width: 50, height: 30)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button {
                            print("Novel")
                        } label: {
                            Text("Novel")
                                .font(.system(size: 12))
                                .frame(width: 50, height: 30)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                    }
                    .padding()
                }
                .frame(height: 30)
                ScrollView {
                    ForEach(1..<5) { index in
                        VideoCard()
                    }
                }
            }
            .onAppear {
                viewModel.getList()
            }
        }
    }
}

struct VideoCard: View {
    var body: some View {
        VStack {
            Image("video_thumbnail")
                .resizable()
                .scaledToFit()
            
            HStack {
                Image(systemName: "person")
                    .frame(width: 30, height: 30)
                    .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 1)
                    )
                Text("Cooking a Christmas Feast 200 Years ago | 1820s Historical ASMR Cooking")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }
            
            Text("Early American • 497K views • 4 months ago")
                .padding(.leading, 5)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
        }
        .padding(10)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
