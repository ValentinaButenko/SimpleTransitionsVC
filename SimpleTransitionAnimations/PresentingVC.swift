//
//  PresentingVC.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit

class PresentingVC: UIViewController{

    var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.greenColor()
        self.setup()
    }

    func setup(){
        self.setupDismissButton()
    }

    func setupDismissButton(){
        let dismissButton = UIButton(type: .System)
        dismissButton.setTitle("Dismiss", forState: .Normal)
        dismissButton.addTarget(self, action: #selector(PresentingVC.showSelectionVC(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(dismissButton)

        dismissButton.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(view)
        }
        self.dismissButton = dismissButton
    }

    func showSelectionVC(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
