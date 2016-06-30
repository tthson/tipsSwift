//
//  SettingViewController.swift
//  tips
//
//  Created by Son, Tran Thai on 6/29/16.
//  Copyright © 2016 Son, Tran Thai. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet weak var percentSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultPercentageValue = defaults.integerForKey("percentDefault")
        percentSegment.selectedSegmentIndex = defaultPercentageValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onChangePercentageDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultsPercentage = percentSegment.selectedSegmentIndex
        defaults.setInteger(defaultsPercentage, forKey: "percentDefault")
        defaults.synchronize()
    }
}
