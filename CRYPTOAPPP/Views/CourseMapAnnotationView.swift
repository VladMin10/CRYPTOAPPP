//
//  CourseMapAnnotationView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 04.03.2024.
//

import SwiftUI

struct CourseMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7399368791))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(46)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)))
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 50)
            

            
        }
    }
}

#Preview {
    CourseMapAnnotationView()
}
