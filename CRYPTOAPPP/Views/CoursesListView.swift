//
//  CoursesListView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 04.03.2024.
//

import SwiftUI

struct CoursesListView: View {
    
    @EnvironmentObject private var vm : CourseViewModel
    
    var body: some View {
        List {
            ForEach(vm.courses) { course in
                Button {
                    vm.showNextCourse(course: course)
                } label: {
                    listRowView(course: course)
                }
                .listRowBackground(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.3818294702)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.1987272351))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )

            }
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)  // Скрыть стандартный фон списка
        .foregroundColor(.white)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7399368791))]), startPoint: .topLeading, endPoint: .bottomTrailing)
        ) // Установить новый цвет фона
        
    }
}

struct CoursesListView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesListView()
            .environmentObject(CourseViewModel())
    }
}

extension CoursesListView {
    
    private func listRowView(course : Course) -> some View {
        
        HStack{
            if let imageName = course.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 55, height : 55)
                    .cornerRadius(10)
            }
            
            VStack(alignment : .leading) {
                Text(course.title)
                    .font(.headline)
                    
            }
            .frame(maxWidth : .infinity, alignment: .leading)
        }
        
        
    }
    
    
    
}
