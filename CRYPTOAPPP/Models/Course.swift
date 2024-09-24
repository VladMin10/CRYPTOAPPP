//
//  Course.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 01.03.2024.
//

import Foundation
import MapKit

struct Course: Identifiable, Equatable {
    let title: String
    let noOfBreakPoints: Int
    let description: String
    let imageNames: [String]
    let supportLink: String
    let coordinates: CLLocationCoordinate2D // Corrected indentation
    
    var id: String {
        title + String(noOfBreakPoints)
    }
    
    // Equatable
    static func == (lhs: Course, rhs: Course) -> Bool {
        lhs.id == rhs.id
    }
}
