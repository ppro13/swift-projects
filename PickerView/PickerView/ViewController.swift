//
//  ViewController.swift
//  PickerView
//
//  Created by Pedro Paulo on 12/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var backgroundView: UIView!
    
    let pickerViewData = ["branco", "azul", "verde", "amarelo", "preto", "laranja"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerViewData[row] == "branco" {
            backgroundView.backgroundColor = UIColor.white
        }
        else if pickerViewData[row] == "azul" {
            backgroundView.backgroundColor = UIColor.blue
        }
        else if pickerViewData[row] == "verde" {
            backgroundView.backgroundColor = UIColor.green
        }
        else if pickerViewData[row] == "amarelo" {
            backgroundView.backgroundColor = UIColor.yellow
        }
        else if pickerViewData[row] == "preto" {
            backgroundView.backgroundColor = UIColor.black
        }
        else if pickerViewData[row] == "laranja" {
            backgroundView.backgroundColor = UIColor.orange
        }
    }


}

