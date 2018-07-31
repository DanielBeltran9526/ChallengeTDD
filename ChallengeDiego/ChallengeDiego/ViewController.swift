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
    
    
   // var arrayTest :[Int] = []
   var arrayTest = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
   //  var arrayTest = [1,2,3,4,5,6,7,46,9,10,11,12,13,14,2,16,17,18,19,20]
    //var estado = String()
    
    
    
    private(set)var estado = String() {
        didSet{
            updateLAbel()
        }
    }
    
    func updateLAbel(){
     //label.attributedText = estado
        label.text = estado
    }
    
    @IBOutlet weak var label: UILabel!{
        didSet{
            updateLAbel()
        }
    }
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        if arrayTest.count == 20 {
          Test(array: arrayTest)
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
        Test(array: arrayTest)
    }
    
    func Test (array: Array<Int>) {
     
        let firstPositionOnArray = array[0]
        let LastPositionOnArray = array[array.count-1]
        
        if array.count == 0 {
            ArrayFail(status: "your array is empty")
        }else {
            if firstPositionOnArray < LastPositionOnArray{
                testOrder(array: array, first: firstPositionOnArray, Last: LastPositionOnArray)
            }else {
                ArrayFail(status: "your array is not successfully organized")
            }
        }
    }
    

    func testOrder (array :Array<Int>,first:Int,Last: Int) {
        
        var forzeOut = false
       
            for position in 0...(Last/2)-1{
                for lastPosition in (Last/2...Last-1).reversed(){
                    
                    let inspectorOfPositions = array[position]
                    let inspectorOfPositionLast = array[lastPosition]
                    print(inspectorOfPositions)
                    print(inspectorOfPositionLast)
                    
                    if inspectorOfPositions > inspectorOfPositionLast {
                         forzeOut = true
                    }
                }
                if forzeOut == true {
                    break
                }
            }
        if forzeOut == false {
        ArrayFail(status: "your array is  successfully organized")
        }else {
             ArrayFail(status: "your array is not successfully organized")
        }
        
    }
    
    
    func ArrayFail(status:String){
        print(status)
        estado = status
      //  updateLAbel()
    }
}

