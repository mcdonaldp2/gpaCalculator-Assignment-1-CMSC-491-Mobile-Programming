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
   
    //image views to 
    @IBOutlet weak var courseOneGradeImage: UIImageView!
    @IBOutlet weak var courseTwoGradeImage: UIImageView!
    @IBOutlet weak var courseThreeGradeImage: UIImageView!
    @IBOutlet weak var courseFourGradeImage: UIImageView!
    
    @IBOutlet weak var gpaLabel: UILabel!
    
    
    //field for the courseID that is needed on deletion of a course
    @IBOutlet weak var courseID: UITextField!
    
   
    // initializes the object that will take all four courses and return a GPA
    var gpaAssessment = Assessment()
    func determineGPAColor(gpa: Double, label: UILabel) {
        if (gpa >= 3.0 && gpa <= 4.0) {
            label.textColor = UIColor.greenColor()
        }
        else if (gpa >= 2.0 && gpa < 3.0) {
            label.textColor = UIColor.orangeColor()
        }
        else if (gpa < 2.0) {
            label.textColor = UIColor.redColor()
        }
    }

    func updateGPALabel() {
       let gpaValue = gpaAssessment.getGPA()
        
        if (gpaAssessment.getSize() == 0) {
            gpaLabel.text = "GPA: "
            gpaLabel.textColor = UIColor.whiteColor()
        }
        else {
            gpaLabel.text = "GPA: " + String(gpaValue)
           
            determineGPAColor(gpaValue, label: gpaLabel)
        }
    }
    
    
    // updates classes corresponding imageview with the grade image appropriate to the actual grade
    func updateCourseGradeImage(currentCourse: Course, imageView: UIImageView) {
       
        let alphaGrade: String = currentCourse.getAlphabetGrade()
        var image: UIImage
        
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
   
    func updateChalkboardCourses() {
        let courseArray = gpaAssessment.getCourseArray()
        
        if (courseArray.count == 0) {
            courseOneTitle.hidden = true
            courseTwoTitle.hidden = true
            courseThreeTitle.hidden = true
            courseFourTitle.hidden = true
            
            courseOneGradeImage.hidden = true
            courseTwoGradeImage.hidden = true
            courseThreeGradeImage.hidden = true
            courseFourGradeImage.hidden = true
        }
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
            
        }
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

        }
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

        }
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

    
    //handles the Add Course button click
    @IBAction func addCourse(sender: AnyObject) {
        let fieldValues: [String: String] = ["assignPoint": assignmentsPoint.text!, "assignMax": assignmentsMax.text!, "assignPercent": assignmentsPercent.text!, "midPoint":midtermPoint.text!, "midMax": midtermMax.text!, "midPercent": midtermPercent.text!, "finalPoint": finalPoint.text!, "finalMax": finalMax.text!, "finalPercent": finalPercent.text!]
        
    
        if (courseTitle.text == "" || assignmentsPoint.text == "" || assignmentsMax.text == "" || assignmentsPercent.text == "" || midtermPoint.text == "" || midtermMax.text == "" || midtermPercent.text == "" || finalPoint.text == "" || finalMax.text == "" || finalPercent.text == "" || creditAmount.text == "") {
            
            
            
        }
        else {
            
            //alerts the user that they cannot enter more than 4 courses
            if (gpaAssessment.getSize() >= 4) {
                let alert = UIAlertController(title: "Error", message: "Max course allowed is 4", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
               
            }
            else{
                
                let currentCourse = Course(title: courseTitle.text!, credits: Int(creditAmount.text!)!, grade: calculateGrade(fieldValues))
                gpaAssessment.addCourse(currentCourse)
                
                
                updateChalkboardCourses()
                
            }
            
        
        }
       
        
        
    }
    
    //handles the Delete Course button click
    @IBAction func deleteCourse(sender: AnyObject) {
        
        let id = Int(courseID.text!)!
        
        if (courseID.text! == "" || (id < 1) || (id > gpaAssessment.getSize()) ) {
            let alert = UIAlertController(title: "Error", message: "That course does not exist", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            gpaAssessment.deleteCourse(id - 1)
            updateChalkboardCourses()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

