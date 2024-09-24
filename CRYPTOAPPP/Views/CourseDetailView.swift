//
//  CourseDetailView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 04.03.2024.
//

import SwiftUI
import MapKit

struct CourseDetailView: View {
    
    @EnvironmentObject private var vm : CourseViewModel
    let course : Course
    
    var body: some View {
        ScrollView{
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x : 0, y: 10)
                
                VStack(alignment: .leading,spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
           
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topLeading)
    }
}

#Preview {
    CourseDetailView(course: CoursesDataService.courses.first!)
        .environmentObject(CourseViewModel())
}

extension CourseDetailView {
    
    private var imageSection: some View{
        TabView{
            ForEach(course.imageNames, id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection : some View{
        VStack(alignment: .leading, spacing: 8){
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }
    
    private var descriptionSection : some View{
        VStack(alignment: .leading, spacing: 8){
            Text(course.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string : course.supportLink){
                Link("Contact our support!", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var backButton : some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .frame(width: 13, height: 13)
                .font(.headline)
                .padding(16)
                .foregroundColor(.indigo)
                .background(.thickMaterial)
                .cornerRadius(15)
                .shadow(radius: 8)
                .padding()

            
        }

    }
    
   
    
}
