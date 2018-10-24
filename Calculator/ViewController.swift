//
//  ViewController.swift
//  Calculator
//
//  Created by Chhaileng Peng on 6/2/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentNum:Double = 0
    var preNum:Double = 0
    var operatorIsClick = false
    var operation = 0
    var test = ""
    var tem1:Double = 0
    var  myresult:Double = 0
     var plusMinusIsClickedOne:Bool = false
    var isClicked:Bool = false
    
    @IBOutlet weak var lblMid: UILabel!
    @IBOutlet weak var toplbl: UILabel!
    
    @IBAction func btnNumber(_ sender: UIButton) {
       
        
        test += (sender.titleLabel!.text!)
        if operatorIsClick == true {
            
            
             print("PRe\(preNum)")
             lblMid.text = test
             print("Test:"+test)
             operatorIsClick = false
             tem1 = Double(test)!
        }
         
        else{
            
           
            print("Curent\(currentNum)")
            lblMid.text = lblMid.text! + String(sender.tag)
            currentNum = Double(lblMid.text!)!
            operatorIsClick = true
        }
      
        
    }
  
    
    
    @IBAction func btnOperator(_ sender: UIButton) {
        
       //  currentNum = Double(lblMid.text!)!
        test = ""
         var tempo :Double = 0
        if lblMid.text != "" && sender.tag != 10 && sender.tag != 15{
            
           
            preNum = Double(lblMid.text!)!
            
            if sender.tag == 11{ // /
                
                currentNum = Double(test)!
                toplbl.text =  lblMid.text! + "÷"
                lblMid.text = "0"
                currentNum = 0.0
                preNum = Double(test)!
                print( " IN\(preNum)")
                print(test)
                toplbl.text  = String(myresult)
                print("%%\(myresult)")
               
            }else if sender.tag == 12{ //*
                toplbl.text =  lblMid.text! + "×"
               
                
                
                
            }else if sender.tag == 13{//-
                toplbl.text =  lblMid.text! + "-"
                
                //lblMid.text = "
                
            }else if sender.tag == 14{//+
                
                
                //lblMid.text = "+"
                if isClicked == false{
                    
                    print("MYRESUL2: \(myresult)")
                    toplbl.text =  lblMid.text! + "+"
                    
                    
                    isClicked = true
                    
                }
                else if isClicked == true {
                    print(tem1)
                    myresult = Total(val1: preNum, val2: tem1, Operation: 14)
                    print("MYRESUL1: \(myresult)")
                   
                    // toplbl.text = String(tempo) + "+"
                }
                 lblMid.text = "0"
                
            }else if sender.tag == 16 {
                print("Hello???")
                
                preNum = preNum * (-1)
                 print("WOW\(preNum)")
                lblMid.text = String(preNum)
                
            }
            
            operation = sender.tag
            operatorIsClick = true
            
        }
        ///Work When Click =
        else if sender.tag == 15{
            if operation == 11{
                lblMid.text = String(preNum / tem1)
            }else if operation == 12{
                toplbl.text = String(preNum * tem1)
                 lblMid.text = "0"
            
            }else if operation == 13{
                lblMid.text = String(preNum - tem1 )
            }else if operation == 14{
                
                print("\(preNum)  + \(tem1)")
                lblMid.text = "0"
                myresult =  (preNum + tem1)
                toplbl.text = String(myresult)
                print("MYRESUL:\(myresult)")
                
                
            }
            tempo = myresult
            print("%%\(tempo)")
           
        }else if sender.tag == 10{
            toplbl.text = ""
            lblMid.text = ""
            preNum = 0
            //test = ""
            currentNum = 0
            operation = 0
        }
        else if sender.tag == 16{
           
            print("HELLL??")
            if plusMinusIsClickedOne == true {
                 preNum = preNum * (-1)
                
                print("KLK\(preNum)")
            }
            else if plusMinusIsClickedOne == false {
                preNum = preNum * 1
            }
            
        }
        
    }
    
    
    
    func Total(val1:Double,val2:Double,Operation:Int) -> Double  {
        var total:Double  = 0.0
        switch Operation {
        case 14:total = val1 + val2
        case 13: total = val1 - val2
        case 12: total = val1 * val2
        case 11: total = val1 / val2
            
        default:
            print("Nothing")
        }
        return total
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

