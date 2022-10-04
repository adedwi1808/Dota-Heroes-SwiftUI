//
//  FeedModel.swift
//  Funios-Board
//
//  Created by isa nur fajar on 18/09/22.
//

import Foundation

struct FeedModelData: Codable {
    let id: String
    let position: Int
    let ownerID, createdDate, textContent: String
    let mediaContentPath: String
    let tagIDS: [String]

    enum CodingKeys: String, CodingKey {
        case id, position
        case ownerID = "ownerId"
        case createdDate, textContent, mediaContentPath
        case tagIDS = "tagIds"
    }
}

typealias FeedModel = [FeedModelData]


extension FeedModelData {
    static func with(
        id: String,
        position: Int,
        ownerID: String,
        createdDate: String,
        textContent: String,
        mediaContentPath: String,
        tagIDS:[String]) -> FeedModelData {
        return FeedModelData(id: id, position: position, ownerID: ownerID, createdDate: createdDate, textContent: textContent, mediaContentPath: mediaContentPath, tagIDS: tagIDS)
    }
}

