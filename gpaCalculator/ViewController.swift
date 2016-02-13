//
//  ViewController.swift
//  gpaCalculator
//
//  Created by Paul McDonald  on 2/7/16.
//  Copyright © 2016 Paul McDonald . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //course title field
    @IBOutlet weak var courseTitle: UITextField!
    
    //fields for the earned points, maximum points, 
    //and percentage of the final grade of the assignments
    @IBOutlet weak var assignmentsPoint: UITextField!
    @IBOutlet weak var assignmentsMax: UITextField!
    @IBOutlet weak var assignmentsPercent: UITextField!
    
    //fields for the earned points, maximum points,
    //and percentage of the final grade of the midterm
    @IBOutlet weak var midtermPoint: UITextField!
    @IBOutlet weak var midtermMax: UITextField!
    @IBOutlet weak var midtermPercent: UITextField!
    
    //fields for the earned points, maximum points,
    //and percentage of the final grade of the final
    @IBOutlet weak var finalPoint: UITextField!
    @IBOutlet weak var finalMax: UITextField!
    @IBOutlet weak var finalPercent: UITextField!
    
    //fields for the amount of credits for each course
    @IBOutlet weak var creditAmount: UITextField!
    
    //labels for all the courses
    @IBOutlet weak var courseOneTitle: UILabel!
    @IBOutlet weak var courseTwoTitle: UILabel!
    @IBOutlet weak var courseThreeTitle: UILabel!
    @IBOutlet weak var courseFourTitle: UILabel!
   
    //image views for the grades of each course
    @IBOutlet weak var courseOneGradeImage: UIImageView!
    @IBOutlet weak var courseTwoGradeImage: UIImageView!
    @IBOutlet weak var courseThreeGradeImage: UIImageView!
    @IBOutlet weak var courseFourGradeImage: UIImageView!
    
    //label for the GPA
    @IBOutlet weak var gpaLabel: UILabel!
    
    //field for the courseID that is needed on deletion of a course
    @IBOutlet weak var courseID: UITextField!
    
   
    // initializes the object that will take all four courses and return a GPA
    var gpaAssessment = Assessment()
    
    //based on the value of the GPA, sets the color of the gpaLabel text
    //used in updateGPALabel
    func determineGPAColor(gpa: Double, label: UILabel) {
        
        // if the current GPA is between 3.0 and 4.0 set the text color to green
        if (gpa >= 3.0 && gpa <= 4.0) {
            label.textColor = UIColor.greenColor()
        } // if the gpa is between 2.0 and 3.0 set the text color to orange
        else if (gpa >= 2.0 && gpa < 3.0) {
            label.textColor = UIColor.orangeColor()
        } // if the gpa is  less than 2.0 set the text color to red
        else if (gpa < 2.0) {
            label.textColor = UIColor.redColor()
        }
    }

    
    // updates the gpaLabel with the current GPA calculated from the current list of courses
    // sets color of the text of the GPA label using the method determineGPAColor()
    func updateGPALabel() {
        
        //gets GPA from the current assessment
       let gpaValue = gpaAssessment.getGPA()
        
        // if the assessment contains 0 courses, reset the GPA label to just "GPA: " and changes the text color to white
        if (gpaAssessment.getSize() == 0) {
            gpaLabel.text = "GPA: "
            gpaLabel.textColor = UIColor.whiteColor()
        } //sets the gpaLabel text value to the current gpa and based on that gpa, determines the text color
        else {
            gpaLabel.text = "GPA: " + String(gpaValue)
           
            determineGPAColor(gpaValue, label: gpaLabel)
        }
    }
    
    
    // updates classes corresponding imageview with the grade image appropriate to the actual grade
    // used in updateChalkboardCourses()
    func updateCourseGradeImage(currentCourse: Course, imageView: UIImageView) {
       
        let alphaGrade: String = currentCourse.getAlphabetGrade()
        var image: UIImage
        
        //based on the alphabetical grade for the current course, set the grade image associated with it
        switch alphaGrade {
        
        case "A":
            image = UIImage(named: "grade_a")!
            imageView.image = image
        case "B":
            image = UIImage(named: "grade_b")!
            imageView.image = image
        case "C":
            image = UIImage(named: "grade_c")!
            imageView.image = image
        case "D":
            image = UIImage(named: "grade_d")!
            imageView.image = image
        case "F":
            image = UIImage(named: "grade_f")!
            imageView.image = image
        default:
            image = UIImage(named: "grade_f")!
        }
        imageView.hidden = false
    }
   
    // updates the Chalkboard with the current values for each course, and the gpa
    func updateChalkboardCourses() {
        
        //gets the course array from the Assessment object
        let courseArray = gpaAssessment.getCourseArray()
        
        // if there are no courses in the assessment hide all course labels and grade image labels
        if (courseArray.count == 0) {
            courseOneTitle.hidden = true
            courseTwoTitle.hidden = true
            courseThreeTitle.hidden = true
            courseFourTitle.hidden = true
            
            courseOneGradeImage.hidden = true
            courseTwoGradeImage.hidden = true
            courseThreeGradeImage.hidden = true
            courseFourGradeImage.hidden = true
        } // if there is only one course, update and show the courselabel, update the grade image, and hide all other course labels and grade images
        else if (courseArray.count == 1) {
            courseOneTitle.text = "1) " + courseArray[0].getTitle() + " | " + String(courseArray[0].getCredits())
            courseOneTitle.hidden = false
            
            updateCourseGradeImage(courseArray[0], imageView: courseOneGradeImage)
            
            courseTwoTitle.hidden = true
            courseThreeTitle.hidden = true
            courseFourTitle.hidden = true
            
            courseTwoGradeImage.hidden = true
            courseThreeGradeImage.hidden = true
            courseFourGradeImage.hidden = true
            
        }// if there is only two course, update and show the courselabel for both, update and show the corresponding grade images, and hide all other course labels and grade images
        else if (courseArray.count == 2) {
            courseOneTitle.text = "1) " + courseArray[0].getTitle() + " | " + String(courseArray[0].getCredits())
            courseOneTitle.hidden = false
            updateCourseGradeImage(courseArray[0], imageView: courseOneGradeImage)

            
            courseTwoTitle.text = "2) " + courseArray[1].getTitle() + " | " + String(courseArray[1].getCredits())
            courseTwoTitle.hidden = false
            updateCourseGradeImage(courseArray[1], imageView: courseTwoGradeImage)
            
            courseThreeTitle.hidden = true
            courseFourTitle.hidden = true
            
            courseThreeGradeImage.hidden = true
            courseFourGradeImage.hidden = true

        }// if there is only three course, update and show the courselabel for all three, update and show the corresponding grade images, and hide the fourth course label and corresponding grade image
        else if (courseArray.count == 3) {
            courseOneTitle.text = "1) " + courseArray[0].getTitle() + " | " + String(courseArray[0].getCredits())
            courseOneTitle.hidden = false
            updateCourseGradeImage(courseArray[0], imageView: courseOneGradeImage)

            
            courseTwoTitle.text = "2) " + courseArray[1].getTitle() + " | " + String(courseArray[1].getCredits())
            courseTwoTitle.hidden = false
            updateCourseGradeImage(courseArray[1], imageView: courseTwoGradeImage)

            
            courseThreeTitle.text = "3) " + courseArray[2].getTitle() + " | " + String(courseArray[2].getCredits())
            courseThreeTitle.hidden = false
            updateCourseGradeImage(courseArray[2], imageView: courseThreeGradeImage)
            
            courseFourTitle.hidden = true
            
            courseFourGradeImage.hidden = true

        } // if there is 4 courses, update and show all courselabels and grade images corresponding to each course
        else if (courseArray.count == 4) {
            courseOneTitle.text = "1) " + courseArray[0].getTitle() + " | " + String(courseArray[0].getCredits())
            courseOneTitle.hidden = false
            updateCourseGradeImage(courseArray[0], imageView: courseOneGradeImage)

            
            courseTwoTitle.text = "2) " + courseArray[1].getTitle() + " | " + String(courseArray[1].getCredits())
            courseTwoTitle.hidden = false
            updateCourseGradeImage(courseArray[1], imageView: courseTwoGradeImage)

            
            courseThreeTitle.text = "3) " + courseArray[2].getTitle() + " | " + String(courseArray[2].getCredits())
            courseThreeTitle.hidden = false
            updateCourseGradeImage(courseArray[2], imageView: courseThreeGradeImage)

            
            courseFourTitle.text = "4) " + courseArray[3].getTitle() + " | " + String(courseArray[3].getCredits())
            courseFourTitle.hidden = false
            updateCourseGradeImage(courseArray[3], imageView: courseFourGradeImage)

        }
        
        //update the gpa label
        updateGPALabel()
        
    }
    
    // calculates grade given a dictionary of all the input from the view controller
    // returns grade as a double
    func calculateGrade(values:[String:String]) ->  Double{
        
        var assignmentPercentage =  (Double(values["assignPoint"]!)! / Double(values["assignMax"]!)!)
        assignmentPercentage = assignmentPercentage * (Double(values["assignPercent"]!))!
        
        var midtermPercentage = (Double(values["midPoint"]!)! / Double(values["midMax"]!)!)
        midtermPercentage = midtermPercentage * (Double(values["midPercent"]!))!
        
        var finalPercentage = (Double(values["finalPoint"]!)! / Double(values["finalMax"]!)!)
        finalPercentage = finalPercentage * (Double(values["finalPercent"]!))!
        
        let grade = assignmentPercentage + midtermPercentage + finalPercentage
        
        return grade
    }
    
    //calculates the sum of the weights for assignments, midterm, and final.
    //returns true if the weight sum is not equal to 100
    func checkWeightSum(values: [String: String]) -> Bool {
        
        let weightSum = Double(values["assignPercent"]!)! + Double(values["midPercent"]!)! + Double(values["finalPercent"]!)!
        
        if weightSum != 100 {
            return true
        }
        else {
            return false
        }
    }
    
    //checks to make sure all the "point" values
    func checkPoints(values: [String: String]) -> Bool{
        let assignPoint: Double = Double(values["assignPoint"]!)!
        let assignMax: Double = Double(values["assignMax"]!)!
        let midPoint: Double = Double(values["midPoint"]!)!
        let midMax: Double = Double(values["midMax"]!)!
        let finalPoint: Double = Double(values["finalPoint"]!)!
        let finalMax: Double = Double(values["finalMax"]!)!
        
        if ((assignPoint < 0) || (assignPoint > assignMax)) {
            return true
        }
        else if (midPoint < 0) || (midPoint > midMax) {
            return true
        }
        else if (finalPoint < 0) || (finalPoint > finalMax) {
            return true
        }
        else {
            return false
        }
    }
    
    //checks the name of each course in the assessment to make sure the new course is not the same name
    func checkCourseTitle(newTitle: String) -> Bool {
        let titleArray = gpaAssessment.getCourseTitleArray()
        
        for items in titleArray {
            if (items == newTitle) {
                return true
            }
        }
        
        return false
    }
    
    //handles the Add Course button click
    @IBAction func addCourse(sender: AnyObject) {
        let fieldValues: [String: String] = ["assignPoint": assignmentsPoint.text!, "assignMax": assignmentsMax.text!, "assignPercent": assignmentsPercent.text!, "midPoint":midtermPoint.text!, "midMax": midtermMax.text!, "midPercent": midtermPercent.text!, "finalPoint": finalPoint.text!, "finalMax": finalMax.text!, "finalPercent": finalPercent.text!]
    
        // if any of the fields are empty, show an alert letting the user know of their error
        if (courseTitle.text == "" || assignmentsPoint.text == "" || assignmentsMax.text == "" || assignmentsPercent.text == "" || midtermPoint.text == "" || midtermMax.text == "" || midtermPercent.text == "" || finalPoint.text == "" || finalMax.text == "" || finalPercent.text == "" || creditAmount.text == "") {
            
            let alert = UIAlertController(title: "Error", message: "all fields must be filled", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        // if the sum of the weights is not equal to 100, show an alert letting user know of their error
        else if (checkWeightSum(fieldValues)) {
            let alert = UIAlertController(title: "Error", message: "The sum of the weights must equal 100", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        // if any of the point fields are less than 0 or greater than 100, show an alert letting user know of their error
        else if (checkPoints(fieldValues)) {
            let alert = UIAlertController(title: "Error", message: "One of your point values is not between 0 and its max", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

        }
        // if any of the course titles already entered match the new course the user is attempting to enter, show an alert to let the user know of his error
        else if (checkCourseTitle(courseTitle.text!)) {
            let alert = UIAlertController(title: "Error", message: "You already have a course with the same name entered", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            
            //alerts the user that they cannot enter more than 4 courses
            if (gpaAssessment.getSize() >= 4) {
                let alert = UIAlertController(title: "Error", message: "Max course allowed is 4", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
               
            }
            else{
                // add the current course to the assessment
                let currentCourse = Course(title: courseTitle.text!, credits: Int(creditAmount.text!)!, grade: calculateGrade(fieldValues))
                gpaAssessment.addCourse(currentCourse)
                
                // update chalkboard with new values
                updateChalkboardCourses()
                
            }
            
        
        }
       
        
        
    }
    
    //handles the Delete Course button click
    @IBAction func deleteCourse(sender: AnyObject) {
        
        if (courseID.text! == "") {
            
        }
        else if ((Int(courseID.text!)! < 1) || (Int(courseID.text!)! > gpaAssessment.getSize()) ) {
            let alert = UIAlertController(title: "Error", message: "That course does not exist", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            gpaAssessment.deleteCourse(Int(courseID.text!)! - 1)
            updateChalkboardCourses()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //hide the courseLabels
        courseOneTitle.hidden = true
        courseTwoTitle.hidden = true
        courseThreeTitle.hidden = true
        courseFourTitle.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

