//
//  SubscriptionsView.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 24/04/24.
//

import SwiftUI

struct SubscriptionsView: View {
    @StateObject var viewModel = ViewModel()
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
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1..<8) { index in
                        ProfileImage()
                    }
                }
                .padding(10)
            }
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
                }
            }
        }
        .onAppear {
            viewModel.getList()
        }
    }
}

struct ProfileImage: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text("subscriptions")
                .font(.system(size: 12))
        }
    }
}

struct SubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}
