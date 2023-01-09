//
//  TXMediaCatch.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import Foundation

class TXMediaCatch {
    
    static let shared = TXMediaCatch()
    
    private init() {}
    
    var catchedImages = [String:Data]()
}
