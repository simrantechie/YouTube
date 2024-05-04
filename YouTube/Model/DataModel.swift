//
//  DataModel.swift
//  YouTube
//
//  Created by Simranjeet Kaur on 06/05/24.
//

import Foundation

class DataModel: Decodable {
    var items: [ItemsModel]?
}

class ItemsModel: Decodable {
    var id: IDModel
    var snippet: SnippetModel?
}

class IDModel: Decodable {
    var kind: String
    var videoId: String
}

class SnippetModel: Decodable {
    var publishedAt: String
    var channelId: String
    var title: String
    var description: String
}
