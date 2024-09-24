//
//  CourseViewModel.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 02.03.2024.
//

import Foundation
import MapKit
import SwiftUI

class CourseViewModel : ObservableObject {
    @Published var courses : [Course]
    
    @Published var mapLocation : Course{
        didSet{
            updateMapRegion(course: mapLocation)
        }
    }
    
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showCoursesList : Bool = false
    
    //show location detail via sheet
    @Published var sheetLocation : Course? = nil
    
    @Published var showCoursesPreview: Bool = false

    init(){
        let courses = CoursesDataService.courses
        self.courses = courses
        self.mapLocation = courses.first!
        self.updateMapRegion(course: courses.first!)
    }
    
    private func updateMapRegion(course : Course){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: course.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleCourseList() {
        withAnimation(.easeInOut){
            showCoursesList.toggle()
        }
    }
    
    func showNextCourse(course : Course){
        withAnimation(.easeInOut){
            mapLocation = course
            showCoursesList = false
            showCoursesPreview = false
        }
    }
    
    func nextButtonPressed(){
        //get the current index
        guard let currentIndex = courses.firstIndex(where: {$0 == mapLocation}) else{
            print("Could not find current index!")
            return
        }
        
        // check  if the current index is valid
        let nextIndex = currentIndex + 1
        guard courses.indices.contains(nextIndex) else {
            //next index is not valid - start from [0]
            guard let firstLocation = courses.first else { return }
            showNextCourse(course: firstLocation)
            return
        }
        
        //next index is valid
        let nextLocation = courses[nextIndex]
        showNextCourse(course: nextLocation)
    }
}
