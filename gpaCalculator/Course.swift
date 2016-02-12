//
//  Course.swift
//  gpaCalculator
//
//  Created by Paul McDonald  on 2/8/16.
//  Copyright © 2016 Paul McDonald . All rights reserved.
//

import Foundation

class Course {
    
    var title: String
    var credits: Int
    var grade: Double
    //var finalGrade: Double
    //var courseGrade: Double
    
    init(title: String, credits: Int, grade: Double) {
        self.title = title
        self.credits = credits
        self.grade = grade
        }
    
   
    
    func getTitle()-> String{
     return self.title
    }
    
    func setTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func getCredits() -> Int {
        return self.credits
    }
    
    func setCredits(newCredits: Int) {
        self.credits = newCredits
    }
    
    func getGrade() -> Double {
        return self.grade
    }
    
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
    
    // calculates grade given a dictionary of all the input from the view controller
    // returns grade as a double

    
    
    
    
    
    
    
    
}
