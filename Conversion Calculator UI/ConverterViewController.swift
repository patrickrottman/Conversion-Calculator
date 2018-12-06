//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by Patrick Rottman on 10/26/18.
//  Copyright © 2018 Patrick Rottman. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBOutlet weak var OutputSign: UITextField!
    
    @IBOutlet weak var InputSign: UITextField!
    
    
    
    var number: Double = 0;
    var converted: Double = 0;
    var currentConversion: Int = 0;
    var sign: Bool = false;
    
    struct ConversionType {
        let label: String?
        let inputUnit: String?
        let outputUnit: String?
    }
    
    let conversions = [
        ConversionType(label: "Fahrenheit to Celcius", inputUnit: "°F", outputUnit: "°C"),
        ConversionType(label: "Celcius to Fahrenheit", inputUnit: "°C", outputUnit: "°F"),
        ConversionType(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
        ConversionType(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi"),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertorButton(_ sender: Any) {
        let sheet = UIAlertController(title: "Choice", message: "Convertor", preferredStyle: .actionSheet)
        
        let action1 = (UIAlertAction(title: conversions[0].label, style: .default, handler: {(alertAction) -> Void in
            self.InputSign.placeholder = self.conversions[0].inputUnit
            self.OutputSign.placeholder = self.conversions[0].outputUnit
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            self.currentConversion = 0
        }))
        let action2 = (UIAlertAction(title: conversions[1].label, style: .default, handler: {(alertAction) -> Void in
            self.InputSign.placeholder = self.conversions[1].inputUnit
            self.OutputSign.placeholder = self.conversions[1].outputUnit
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            self.currentConversion = 1
            
        }))
        let action3 = (UIAlertAction(title: conversions[2].label, style: .default, handler: {(alertAction) -> Void in
            self.InputSign.placeholder = self.conversions[2].inputUnit
            self.OutputSign.placeholder = self.conversions[2].outputUnit
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            self.currentConversion = 2
        }))
        let action4 = (UIAlertAction(title: conversions[3].label, style: .default, handler: {(alertAction) -> Void in
            self.InputSign.placeholder = self.conversions[3].inputUnit
            self.OutputSign.placeholder = self.conversions[3].outputUnit
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            self.currentConversion = 3
        }))
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        
        self.present(sheet, animated: true, completion: nil)
    }
    
    
    @IBAction func ClearClicked(_ sender: UIButton){
        outputDisplay.text = ""
        inputDisplay.text = ""
        sign = false;
        number = 0;
        
    }
    
    
    @IBAction func SignChange(_ sender: UIButton) {
    if sign == false{
        number = number * -1
        sign = true;
        if(inputDisplay.text != "" || inputDisplay.text == nil)
        {
        inputDisplay.text = "-" + inputDisplay.text!
        }else{
            sign = false
            return
        }
    }
    else {
        number = number * -1
        sign = false;
        inputDisplay.text = String(number)
    }
    convert()
    
}
    
    @IBAction func NumberClicked(_ sender: UIButton) {
    if sender.titleLabel!.text != "." {
            inputDisplay.text = inputDisplay.text! + sender.titleLabel!.text!
            number = Double(inputDisplay.text!)!
            convert()
        }else{
            inputDisplay.text = inputDisplay.text! + "."
            number = Double(inputDisplay.text!)!
            convert()
        }
    }
    
    func fToC(number: Double) -> Double{
        return ((number - 32) * (5/9))
    }
    
    func cToF(number: Double) -> Double{
        return (number * 9/5 + 32)
    }
    
    func kmToM(number: Double) -> Double{
        return (number * 0.6213711922)
    }
    
    func mToKm(number: Double) -> Double{
        return (number * 1.60934)
    }
    
    func convert() {
        
        switch(currentConversion){
            
        case 0:
            let celsius = fToC(number: number)
            outputDisplay.text = String(celsius)
            
        case 1:
            let farhenheit = cToF(number: number)
            outputDisplay.text = String(farhenheit)
            
        case 2:
            let kilometers = mToKm(number: number)
            outputDisplay.text = String(kilometers)
            
        case 3:
            let miles = kmToM(number: number)
            outputDisplay.text = String(miles)
            
        default:
            print("ERROR")
            break;
            
        }
    }

}
