//
//  ViewController.swift
//  Toast
//
//  Created by Ashu on 01/11/15.
//  Copyright © 2015 Ashu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    // MARK: - Button Action Methods
    @IBAction func showToastButtonAction(sender: AnyObject) {
        
         let alertView = VRAlertView(message: "Thankyou for using VRAlertView Library")
        alertView.showAlert()
    }
    
}

