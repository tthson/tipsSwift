//
//  ViewController.swift
//  tips
//
//  Created by Son, Tran Thai on 6/29/16.
//  Copyright © 2016 Son, Tran Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultPercentageValue = defaults.integerForKey("percentDefault")
        tipControl.selectedSegmentIndex = defaultPercentageValue
        editingChangePercentage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipsLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultsPercentage = tipControl.selectedSegmentIndex
        defaults.setInteger(defaultsPercentage, forKey: "percentDefault")
        defaults.synchronize()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        editingChangePercentage()
        
    }
    func editingChangePercentage(){
        let tipPercentages = [0.18,0.2,0.3]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tips = billAmount * tipPercentage
        let total = tips + billAmount
        
        tipsLabel.text = String(format: "$%.2f", tips)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTapView(sender: AnyObject) {
        view.endEditing(true)
    }
}

