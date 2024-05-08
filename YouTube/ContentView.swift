//
//  ContentView.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 23/04/24.
//

import SwiftUI
import WebKit

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
    
    @State private var index = 0
    @StateObject var viewModel = ViewModel()
    @State private var isPlaying = false
    var body: some View {
        NavigationView {
            if isPlaying == false {
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
                        if let count = viewModel.dataModel?.items?.count {
                            ForEach(0..<count) { index in
                                VideoCard(index: index, dataModel: self.viewModel.dataModel)
                            }
                            .onTapGesture {
                                isPlaying = true
                                index = index
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.getList()
                }
            }
            else {
                VideoPlayerWebView(videoID: (viewModel.dataModel?.items?[self.index].id.videoId)!)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct VideoCard: View {
    
    @State var index = 0
    @State var dataModel: DataModel?
    var body: some View {
        
        VStack(alignment: .leading) {
            if let item = dataModel?.items?[index] {
                if dataModel?.items != nil {
                    let url = URL(string: (item.snippet?.thumbnails.medium.url)!)
                    ImageView(url: url)
                }
                
                HStack {
                    Image(systemName: "person")
                        .frame(width: 30, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .alignmentGuide(.top) { dimension in
                            dimension[.top]
                        }
                    VStack(alignment: .leading) {
                        if dataModel?.items != nil {
                            Text((item.snippet?.title)!)
                                .font(.system(size: 15))
                                .foregroundColor(.primary)
                                .lineLimit(2)
                        }
                        
                        if dataModel?.items != nil {
                            Text("\((item.snippet?.channelTitle)!) • 497K views • 4 months ago")
                                .font(.system(size: 12))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
        
    }
}

struct VideoPlayerWebView: UIViewRepresentable {
    var videoID: String
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        if let url = URL(string: "https://www.youtube.com/embed/\(videoID)") {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // update code
    }
}

struct ImageView: View {
    let url: URL?
    var body: some View {
        if let url = url, let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
            
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
        }
        else {
            Image("apple")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
