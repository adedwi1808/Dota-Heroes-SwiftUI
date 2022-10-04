//
//  DotaServices.swift
//  Funios-Board
//
//  Created by Ade Dwi Prayitno on 20/09/22.
//

import Foundation

protocol DotaServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getHeroes(endPoint: NetworkFactory) async throws -> DotaModel
}

final class DotaServices: DotaServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()){
        self.networker = networker
    }
    
    func getHeroes(endPoint: NetworkFactory) async throws -> DotaModel {
        return try await networker.taskAsync(type: DotaModel.self, endPoint: endPoint, isMultipart: false)
    }
}
