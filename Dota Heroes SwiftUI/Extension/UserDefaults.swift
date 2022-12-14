//
//  UserDefaults.swift
//  Funios-Board
//
//  Created by Ade Dwi Prayitno on 30/09/22.
//

import Foundation

extension UserDefaults {
    func getDataFromLocal<T: Codable>(_ type: T.Type, with key: Key, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key.rawValue) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    func setDataToLocal<T: Codable>(_ object: T, with key: Key, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key.rawValue)
    }
}

extension UserDefaults {
    enum Key: String {
        case dotaHeroes
    }
}
