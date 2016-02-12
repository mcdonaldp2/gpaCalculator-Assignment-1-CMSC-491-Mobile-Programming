//
//  Assessment.swift
//  gpaCalculator
//
//  Created by Paul McDonald  on 2/10/16.
//  Copyright © 2016 Paul McDonald . All rights reserved.
//

import Foundation

class Assessment {
    var inc: Int
    var courseArray: [Course]
    
    init(){
        inc = 0
        courseArray = []
        
    }
    
    func addCourse(newCourse: Course){
        
        self.courseArray.append(newCourse)
          
    }
    
    func getSize() -> Int {
        
        return self.courseArray.count
        
    }
    
    func getCourseArray() -> [Course] {
        return self.courseArray
    }
    
    func deleteCourse(id: Int) {
        self.courseArray.removeAtIndex(id)
    }
    
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
        
        return (totalGradePoints / totalCredits)
    }
    
    
    
}

