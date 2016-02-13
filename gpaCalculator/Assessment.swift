//
//  Assessment.swift
//  gpaCalculator
//
//  Created by Paul McDonald  on 2/10/16.
//  Copyright © 2016 Paul McDonald . All rights reserved.
//

import Foundation

class Assessment {
    
    // variable that will hold an array of Course objects, used to simulate the courses on the chalkboard5
    var courseArray: [Course]
    
    //initializer for Assessment
    init(){
        courseArray = []
        
    }
    
    //given a Course object, adds Course to the Course array in the current Assessment
    func addCourse(newCourse: Course){
        
        self.courseArray.append(newCourse)
          
    }
    
    //returns the size of the course array
    func getSize() -> Int {
        
        return self.courseArray.count
        
    }
    
    //returns the current assessment's course array
    func getCourseArray() -> [Course] {
        return self.courseArray
    }
    
    //given an integer, id, removes that course from the array
    func deleteCourse(id: Int) {
        self.courseArray.removeAtIndex(id)
    }
    
    //calculates the GPA using the current array of courses
    //returns the GPA for the current assessment 
    func getGPA() -> Double {
        var totalCredits: Double = 0.0
        var totalGradePoints: Double = 0.0
        
        for items in self.courseArray {
            totalCredits += Double(items.getCredits())
            
            if (items.getAlphabetGrade() == "A"){
                totalGradePoints += 4.00 * Double(items.getCredits())
            }
            else if (items.getAlphabetGrade() == "B") {
                totalGradePoints += 3.00 * Double(items.getCredits())
            }
            else if (items.getAlphabetGrade() == "C") {
                totalGradePoints += 2.00 * Double(items.getCredits())

            }
            else if (items.getAlphabetGrade() == "D") {
                totalGradePoints += 1.00 * Double(items.getCredits())
            }
            else {
                
            }
        }
        
        return floor((totalGradePoints / totalCredits)*100)/100
    }
    
    //returns an array of the titles of each course in the assessment
    func getCourseTitleArray() -> [String] {
        var titleArray = [String]()
        for items in self.courseArray {
            titleArray.append(items.getTitle())
        }
        return titleArray
    }
    
    
    
}

