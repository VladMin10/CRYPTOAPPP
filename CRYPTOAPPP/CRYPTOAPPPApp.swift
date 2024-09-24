//
//  CRYPTOAPPPApp.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 01.03.2024.
//

import SwiftUI

@main
struct CRYPTOAPPPApp: App {
    
    @StateObject private var vm = CourseViewModel()

    var body: some Scene {
        WindowGroup {
            OnBoardingView()
                .environmentObject(vm)
        }
    }
}
