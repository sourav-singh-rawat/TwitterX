//
//  Dictionary.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 11/01/23.
//

import Foundation

extension [String : Any] {
    func toData() -> Data? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            
            return data
        } catch {
            return nil
        }
    }
}
