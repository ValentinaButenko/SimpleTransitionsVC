//
//  ViewController.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit

class SelectionVC: UIViewController {

    var topBorderView: SimpleBorderView!
    var bottomBorderView: SimpleBorderView!
    var firstButton: UIButton!

    var buttonsHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setup()
    }

    func setup(){
        self.setupBorderViews()
        self.setupFirstButton()
    }

    func setupBorderViews(){
        let topBorderView = SimpleBorderView()
        let bottomBorderView = SimpleBorderView()

        self.view.addSubview(topBorderView)
        self.view.addSubview(bottomBorderView)

        topBorderView.snp_makeConstraints { (make) in
            make.top.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
        }

        bottomBorderView.snp_makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(40)
        }

        self.topBorderView = topBorderView
        self.bottomBorderView = bottomBorderView

        self.calculateButtonsHeight()
    }

    func setupFirstButton(){
        let firstButton = UIButton()
        firstButton.setImage(UIImage(named: Names.flowers), forState: .Normal)

        guard let imgView = firstButton.imageView else{
            return
        }

        imgView.contentMode = .ScaleAspectFill

        self.view.addSubview(firstButton)

        firstButton.snp_makeConstraints { (make) in
            make.top.equalTo(topBorderView.snp_bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(self.buttonsHeight)
        }
        self.firstButton = firstButton
    }

    func calculateButtonsHeight(){
        let bordersHeight = topBorderView.frame.height + bottomBorderView.frame.height
        let buttonHeight = (self.view.frame.height - bordersHeight)/CGFloat(Names.amount)
        self.buttonsHeight = buttonHeight
    }
}

