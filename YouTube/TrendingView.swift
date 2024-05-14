//
//  TrendingView.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 03/05/24.
//

import SwiftUI

struct TrendingView: View {
    @State private var index = 0
    @State private var isPlaying = false
    @StateObject var viewModel = ViewModel()
    var body: some View {
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
                
                ScrollView {
                    if let count = viewModel.dataModel?.items?.count {
                        ForEach(0..<count) { index in
                            VideoCard(index: index, dataModel: self.viewModel.dataModel)
                        }
                        .onTapGesture {
                            isPlaying.toggle()
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
            YouTubePlayerView(videoID: (viewModel.dataModel?.items?[self.index].id.videoId)!, isPlaying: $isPlaying)
                .padding(.top, 20)
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
