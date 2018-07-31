//
//  ViewController.swift
//  ChallengeDiego
//
//  Created by Daniel Beltran on 7/30/18.
//  Copyright © 2018 Daniel Beltran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrayTest :[Int] = []
    //var arrayTest = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    // var arrayTest = [1,7,3,8,9,1,7,46,9,10,11,12,13,14,2,16,17,18,19,20]
    //var estado = String()
 
    private(set)var InfoState = String() {
        didSet{
            updateInformationLabel()
        }
    }
    
    private(set)var labelArray = String() {
        didSet {
            uodateLabelArray()
        }
    }
    
    func updateInformationLabel(){
     
        label.text = InfoState
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
            updateInformationLabel()
        }
    }
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        if arrayTest.count == 20 {
        OrganizeTheArray(array: arrayTest)
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
                OrganizeTheArray(array: array)
            }
        }
    }
    

    func testOrder (array :Array<Int>) {
        let Last = array.count
        var forzeClose = false
        
            for position in 0...(Last-2){
                
                let inspectorOfPositions = array[position]
                let inspectorOfNextPosition = array[position+1]
            
                if inspectorOfPositions > inspectorOfNextPosition {
                    forzeClose = true
                }
                if forzeClose == true {
                    break
                }
            }
        
        
        
        if forzeClose == false {
        ArrayFail(status: "your array is  successfully organized",array: array)
        }else {
        ArrayFail(status: "your array is not successfully organized",array: array)
            OrganizeTheArray(array: array)
        }
    }
    func OrganizeTheArray(array:Array<Int>){
        

        var organizedArray = array
        var Minor = organizedArray[0]
        var Greater = organizedArray[1]
        
        let lastPositionInArray = organizedArray.count-2
        
        for counter in 0...lastPositionInArray{
            
            if organizedArray[counter] <= organizedArray[counter+1] {
                Minor = organizedArray[counter]
                Greater = organizedArray[counter+1]
            }else {
                Minor = organizedArray[counter+1]
                Greater = organizedArray[counter]
                organizedArray[counter] = Minor
                organizedArray[counter+1] = Greater
            }
        }
        
        let firstPositionInArray = organizedArray.count-1
        
        for backCounter in (1...firstPositionInArray).reversed()
        {
            if organizedArray[backCounter] >= organizedArray[backCounter-1] {
                Minor = organizedArray[backCounter-1]
                Greater = organizedArray[backCounter]
            }else {
                Minor = organizedArray[backCounter]
                Greater = organizedArray[backCounter-1]
                organizedArray[backCounter] = Greater
                organizedArray[backCounter-1] = Minor
            }
        }
        Test(array: organizedArray)
    }
    func ArrayFail(status:String, array :Array<Int>){
        print(status)
        InfoState = status
        labelArray = array.description
    }
}

