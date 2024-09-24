//
//  CoursePreviewView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 04.03.2024.
//

import SwiftUI

struct CoursePreviewView: View {
    
    @EnvironmentObject private var vm : CourseViewModel
    let course : Course
    
    var body: some View {
        HStack (alignment: .bottom , spacing: 0){
            VStack(alignment: .leading , spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack(spacing : 8) {
                learnMoreButton
                nextButton
            }

        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
                .offset(y: 55)
        )
        .cornerRadius(10)
    }
}

struct CoursePreviewView_Priviews :PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            CoursePreviewView(course: CoursesDataService.courses.first!)
                .padding()
        }
        .environmentObject(CourseViewModel())
    }
}

extension CoursePreviewView{
    
    private var imageSection : some View {
        ZStack{
            if let imageName = course.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading,spacing: 3) {
            Text(course.title)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton : some View {
        Button {
            vm.sheetLocation = course
        } label: {
            Text("Learn more")
                .font(Font.system(size: 18, design: .rounded))
                .fontWeight(.bold)
                .frame(width: 125, height: 35)
            
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(Font.system(size: 18, design: .rounded))
                .fontWeight(.bold)
                .frame(width: 125, height: 35)
            
        }
        .buttonStyle(.bordered)
    }
}
