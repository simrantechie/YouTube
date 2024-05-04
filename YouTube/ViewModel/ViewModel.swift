//
//  ViewModel.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 06/05/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var dataModel: DataModel?
    let networkLayer = NetworkManager()
    
    func getList() {
        let apiKey = "AIzaSyDBlcc2-psxOfd-YbeGRORwD5Q5O8cOfXU&q"
        let listURL = "https://www.googleapis.com/youtube/v3/search?key=\(apiKey)&part=snippet"
        
        networkLayer.fetchData(url: URL(string: listURL)!, type: DataModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }
            receiveValue: { response in
                self.dataModel = response
            }
            .store(in: &cancellables)
       
    }
}
