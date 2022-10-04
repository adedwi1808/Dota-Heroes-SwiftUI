//
//  HomeServices.swift
//  Funios-Board
//
//  Created by isa nur fajar on 18/09/22.
//

import Foundation
protocol HomeServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getPost(endPoint: NetworkFactory) async throws -> FeedModel
    func getUsers(endPoint: NetworkFactory) async throws -> UserModel
}

final class HomeServices: HomeServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getPost(endPoint: NetworkFactory) async throws -> FeedModel {
        return try await networker.taskAsync(type: FeedModel.self, endPoint: endPoint, isMultipart: false)
    }
    func getUsers(endPoint: NetworkFactory) async throws -> UserModel {
        return try await networker.taskAsync(type: UserModel.self, endPoint: endPoint, isMultipart: false)
    }
}
