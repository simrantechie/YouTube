//
//  TrendingView.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 03/05/24.
//

import SwiftUI

struct TrendingView: View {
    var body: some View {
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
                ForEach(1..<5) { index in
                    VideoCard()
                }
            }
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
