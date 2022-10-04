//
//  DotaModel.swift
//  Funios-Board
//
//  Created by Ade Dwi Prayitno on 20/09/22.
//

import Foundation

struct DotaModelElement: Codable {
    let id: Int
    let name, localizedName: String
    let primaryAttr: String
    let attackType: String
    let roles: [String]
    let legs: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, legs
    }
}
//
//enum AttackType: String, Codable {
//    case melee = "Melee"
//    case ranged = "Ranged"
//}
//
//enum PrimaryAttr: String, Codable {
//    case agi = "agi"
//    case int = "int"
//    case str = "str"
//}
//
//enum Role: String, Codable {
//    case carry = "Carry"
//    case disabler = "Disabler"
//    case durable = "Durable"
//    case escape = "Escape"
//    case initiator = "Initiator"
//    case jungler = "Jungler"
//    case nuker = "Nuker"
//    case pusher = "Pusher"
//    case support = "Support"
//}

typealias DotaModel = [DotaModelElement]
