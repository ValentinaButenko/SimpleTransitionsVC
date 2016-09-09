//
//  PresentingVC.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit

class PresentingVC: UIViewController {

    var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.greenColor()
    }

    func setup(){

    }

    func setupDismissButton(){
        let dismissButton = UIButton(type: .System)
        dismissButton.setTitle("Dismiss", forState: .Normal)
        
    }
}
