//
//  Dictionary+index.swift
//  Funios-Board
//
//  Created by Ade Dwi Prayitno on 30/09/22.
//

import Foundation


extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}
