//
//  CourseMapView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 02.03.2024.
//

import SwiftUI
import MapKit

struct CourseMapView: View {
        
    @EnvironmentObject private var vm : CourseViewModel

    var body: some View {
        TabView {
            NavigationView {
                ZStack{
                   mapLayer
                        .ignoresSafeArea()
                    
                    VStack(spacing:0){
                        header
                            .padding()
                        
                        Spacer()
                        
                        if vm.showCoursesPreview {
                            coursesPreviewStack
                        }
                    }
                }
                .sheet(item: $vm.sheetLocation, onDismiss: nil) { course in
                    CourseDetailView(course: course)
                }
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            CommunityView()
                .tabItem {
                    Image(systemName: "figure.socialdance")
                    Text("Community")
                }
            
            LeaderBoardView()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Leaderboard")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)))
    }

}

#Preview {
    CourseMapView()
        .environmentObject(CourseViewModel())
}

extension CourseMapView {
    private var header : some View {
        
        VStack {
            Button(action: vm.toggleCourseList) {
                Text(vm.mapLocation.title)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                   // .frame(width: 350, height: 55, alignment: .center)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showCoursesList ? 180 : 0))
                        
                    }
            }
            if vm.showCoursesList{
                CoursesListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }

    private var coursesPreviewStack : some View{
           ZStack {
               ForEach(vm.courses){course in
                   if  vm.mapLocation == course {
                       CoursePreviewView(course: course)
                           .shadow(color: Color.black.opacity(0.2), radius: 20)
                           .padding()
                           .transition(.asymmetric(
                               insertion: .move(edge : .trailing), removal: .move(edge: .leading)))
                   }
               }
           }
       }

    private var mapLayer : some View{
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.courses, annotationContent: { course in
            MapAnnotation(coordinate: course.coordinates){
                CourseMapAnnotationView()
                    .scaleEffect(vm.mapLocation == course ? 1 : 0.65)
                    .shadow(radius : 10)
                    .onTapGesture {
                        vm.showNextCourse(course: course)
                        withAnimation(.easeInOut){
                            vm.showCoursesPreview = true
                        }
                    }
            }
        })
    }
    
    
}
