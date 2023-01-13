//
//  DateX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 13/01/23.
//

import Foundation

extension Date {
    func toTimeDifference(to lastDate: Date) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second,.minute,.hour,.day,.weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self, to: lastDate)
    }
}
