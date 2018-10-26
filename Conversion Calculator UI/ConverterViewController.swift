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
        
        let action1 = (UIAlertAction(title: "fahrenheit to celcius", style: .default, handler: {(alertAction) -> Void in
            self.inputDisplay.placeholder = "°F"
            self.outputDisplay.placeholder = "°C"
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
        }))
        let action2 = (UIAlertAction(title: "celcius to fahrenheit", style: .default, handler: {(alertAction) -> Void in
            self.inputDisplay.placeholder = "°C"
            self.outputDisplay.placeholder = "°F"
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            
        }))
        let action3 = (UIAlertAction(title: "miles to kilometers,", style: .default, handler: {(alertAction) -> Void in
            self.inputDisplay.placeholder = "mi"
            self.outputDisplay.placeholder = "km"
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
        }))
        let action4 = (UIAlertAction(title: "kilometers to miles", style: .default, handler: {(alertAction) -> Void in
            self.inputDisplay.placeholder = "km"
            self.outputDisplay.placeholder = "mi"
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
        }))
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        
        self.present(sheet, animated: true, completion: nil)
    }

}
