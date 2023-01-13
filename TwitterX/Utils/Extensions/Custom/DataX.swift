//
//  DataX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 11/01/23.
//

import Foundation

extension Data{
    func decode<T: Decodable>(to type: T.Type) -> T? {
        
        do {
            let decoder = JSONDecoder()
            
            let obj = try decoder.decode(type, from: self)
            
            return obj
        } catch {
            return nil
        }
    }
    
    func toJSON() -> [String:Any]? {
        do {
            let data = try JSONSerialization.jsonObject(with: self) as? [String:Any]
            
            return data
        } catch {
            return nil
        }
    }
}
