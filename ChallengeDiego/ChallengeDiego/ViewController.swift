//
//  ViewController.swift
//  ChallengeDiego
//
//  Created by Daniel Beltran on 7/30/18.
//  Copyright © 2018 Daniel Beltran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
    var arrayTest :[Int] = []
  //var arrayTest = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
   // var arrayTest = [1,7,3,8,9,1,7,46,9,10,11,12,13,14,2,16,17,18,19,20]
    //var estado = String()
    
    
    
    private(set)var estado = String() {
        didSet{
            updateLAbel()
        }
    }
    
    private(set)var labelArray = String() {
        didSet {
            uodateLabelArray()
        }
    }
    
    func updateLAbel(){
     
        label.text = estado
    }
    
    func uodateLabelArray(){
          arrayLabel.text = labelArray
    }
   
    
    @IBOutlet weak var arrayLabel: UILabel! {
        didSet {
            uodateLabelArray()
        }
    }
    @IBOutlet weak var label: UILabel!{
        didSet{
            updateLAbel()
        }
    }
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        if arrayTest.count == 20 {
            OrganizeTheArray(array: arrayTest)
         // Test(array: arrayTest)
        }else {
            FillInTheArray()
        }
        
    }
    
    
    func FillInTheArray(){
        
        for _ in 1...20{
            let randomInt = Int(arc4random_uniform(UInt32(100)))
            arrayTest.append( randomInt)
        }
       print(arrayTest)
       // Test(array: arrayTest)
        OrganizeTheArray(array: arrayTest)
    }
    
    

    
    func Test (array: Array<Int>) {
     print(array)
        let firstPositionOnArray = array[0]
        let LastPositionOnArray = array[array.count-1]
        
        if array.count == 0 {
            ArrayFail(status: "your array is empty",array: array)
        }else {
            if firstPositionOnArray < LastPositionOnArray{
                testOrder(array: array)
            }else {
                //ArrayFail(status: "your array is not successfully organized")
                OrganizeTheArray(array: array)
            }
        }
    }
    

    func testOrder (array :Array<Int>) {
        let Last = array.count
        var forzeOut = false
        
        if(array.count == 0){
            forzeOut = true
        }else {
            for position in 0...(Last-2){
                
                let inspectorOfPositions = array[position]
                let inspectorOfNextPosition = array[position+1]
                
                //print(inspectorOfPositions)
                //print(inspectorOfPositionLast)
                
                if inspectorOfPositions > inspectorOfNextPosition {
                    forzeOut = true
                }
                if forzeOut == true {
                    break
                }
            }
        }
        
        
        if forzeOut == false {
        ArrayFail(status: "your array is  successfully organized",array: array)
        }else {
        ArrayFail(status: "your array is not successfully organized",array: array)
            OrganizeTheArray(array: array)
        }
    }
    func OrganizeTheArray(array:Array<Int>){
        

        var organizedArray = array
        var varMinor = organizedArray[0]
        var varGreater = organizedArray[1]
        
        let lastPositionInArray = organizedArray.count-2
        
        for counter in 0...lastPositionInArray{
            
            if organizedArray[counter] <= organizedArray[counter+1] {
                varMinor = organizedArray[counter]
                varGreater = organizedArray[counter+1]
            }else {
                varMinor = organizedArray[counter+1]
                varGreater = organizedArray[counter]
                organizedArray[counter] = varMinor
                organizedArray[counter+1] = varGreater
                //varMinor = organizedArray[counter+1]
                //varGreater = organizedArray[counter+2]
            }
            
           // print(counter)
        }
        
        let firstPositionInArray = organizedArray.count-1
        
        for backCounter in (1...firstPositionInArray).reversed()
        {
            if organizedArray[backCounter] >= organizedArray[backCounter-1] {
                varMinor = organizedArray[backCounter-1]
                varGreater = organizedArray[backCounter]
            }else {
                varMinor = organizedArray[backCounter]
                varGreater = organizedArray[backCounter-1]
                organizedArray[backCounter] = varGreater
                organizedArray[backCounter-1] = varMinor
                //varMinor = organizedArray[counter+1]
                //varGreater = organizedArray[counter+2]
            }
            
           // print(counter)
            
            
        }
        Test(array: organizedArray)
        
    }
    
    
    
    func ArrayFail(status:String, array :Array<Int>){
        print(status)
        estado = status
        labelArray = array.description
    
      //  updateLAbel()
    }
}

