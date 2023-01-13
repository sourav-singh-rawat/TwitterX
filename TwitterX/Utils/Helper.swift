//
//  helper.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import UIKit

public let TXScreenSize: CGRect = UIScreen.main.bounds

struct TXHelper{
    static func encode<T: Encodable>(value: T) -> Data? {
        
        do {
            let encoder = JSONEncoder()
            
            let obj = try encoder.encode(value)
            
            return obj
        } catch {
            return nil
        }
    }
}
