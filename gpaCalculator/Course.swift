//
//  Course.swift
//  gpaCalculator
//
//  Created by Paul McDonald  on 2/8/16.
//  Copyright © 2016 Paul McDonald . All rights reserved.
//

import Foundation

class Course {
    
    //variables to hold the value of the courses title, credits, and grade
    var title: String
    var credits: Int
    var grade: Double
    
    //initialization for Course
    init(title: String, credits: Int, grade: Double) {
        self.title = title
        self.credits = credits
        self.grade = grade
        }
    
   
    //returns the courses title
    func getTitle()-> String{
     return self.title
    }
    
    //sets title for course
    func setTitle(newTitle: String) {
        self.title = newTitle
    }
    
    //returns the number of credits for the current course
    func getCredits() -> Int {
        return self.credits
    }
    
    //sets the amount of credits a class is worth
    func setCredits(newCredits: Int) {
        self.credits = newCredits
    }
    
    //returns the current grade of the course
    func getGrade() -> Double {
        return self.grade
    }
    
    //based on the current course's grade, returns a corresponding alphabetical grade. (i.e A, B, C,....)
    func getAlphabetGrade() -> String {
        var alphaGrade: String
        
        if (self.grade >= 90.0) {
            alphaGrade = "A"
            return alphaGrade
        }
        else if (self.grade >= 80 && self.grade < 90.0) {
            alphaGrade = "B"
            return alphaGrade
        }
        else if (self.grade >= 70 && self.grade < 80.0) {
            alphaGrade = "C"
            return alphaGrade
        }
        else if (self.grade >= 60 && self.grade < 70.0) {
            alphaGrade = "D"
            return alphaGrade
        }
        else{
            alphaGrade = "F"
            return alphaGrade
        }
    }
    
}
