//
//  TXError.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 02/01/23.
//

import Foundation

protocol TXError: Error {
    var localizedDescription: String { get set }
}
