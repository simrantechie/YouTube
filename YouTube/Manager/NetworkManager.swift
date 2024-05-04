//
//  NetworkManager.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 06/05/24.
//

import Foundation
import Combine

class NetworkManager: NSObject {
    
    func fetchData<T: Decodable>(url: URL, type: T.Type ) -> Future<T, Error> {
        return Future<T, Error> { promise in
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    _ = error?.localizedDescription ?? "Unknown error"
                    promise(.failure(URLError(.cancelled)))
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    print(String(data: data, encoding: .utf8)!)
                    promise(.success(decodedData))
                } catch {
                    _ = error.localizedDescription
                    promise(.failure(URLError(.cancelled)))
                }
            }.resume()
        }
    }
}
