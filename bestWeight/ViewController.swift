//
//  ViewController.swift
//  bestWeight
//
//  Created by amr on 12/15/17.
//  Copyright © 2017 amr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var laGender: UILabel!
    @IBOutlet weak var pvGender: UIPickerView!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var laDisplayBestWeight: UILabel!
    @IBOutlet weak var txtHeight: UITextField!
    var gender = ["male","female"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pvGender.dataSource = self
        pvGender.delegate = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    var selectedgender=0
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedgender = row
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        laGender.text = gender[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buGetBestWeight(_ sender: Any) {
        let age:Int = Int(txtAge.text!)!
        let height:Int = Int(txtHeight.text!)!
        var bestweight = height*10-(age/5)
        if selectedgender == 0 {
            bestweight+=10
        }
        else{
            bestweight-=10
        }
        laDisplayBestWeight.text = "best weight is \(bestweight)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

