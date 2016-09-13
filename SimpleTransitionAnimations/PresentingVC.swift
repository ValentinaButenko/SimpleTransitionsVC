//
//  PresentingVC.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit
import SwiftEventBus

class PresentingVC: UIViewController{

    var dismissButton: UIButton!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setup()
    }

    func setup(){
        self.setupImageView()
        self.setupDismissButton()
    }

    func setupImageView(){
        let imgView = UIImageView()
        imgView.image = UIImage(named: Names.flowers)
        imgView.makeBlurEffect(imgView, style: .Dark)
        imgView.contentMode = .ScaleAspectFill
        self.view.addSubview(imgView)

        imgView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }

        self.imageView = imgView
    }

    func setupDismissButton(){
        let dismissButton = UIButton(type: .System)
        dismissButton.setTitle("Dismiss", forState: .Normal)
        dismissButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        dismissButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 25)

        dismissButton.addTarget(self, action: #selector(PresentingVC.showSelectionVC(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(dismissButton)

        dismissButton.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(view)
            make.width.height.equalTo(200)
        }
        self.dismissButton = dismissButton
    }

    func showSelectionVC(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
