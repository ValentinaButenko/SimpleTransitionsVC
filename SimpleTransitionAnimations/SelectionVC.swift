//
//  ViewController.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit
import SwiftEventBus

class SelectionVC: UIViewController, UIViewControllerTransitioningDelegate {

    var bottomBorderView: SimpleBorderView!
    var firstButton: UIButton!
    var secondButton: UIButton!
    var thirdButton: UIButton!

    var buttonsHeight: CGFloat!

    var selectedButton: String!

    let firstCustomAnimationController = FirstCustomAnimationController()
    let secondCustomAnimationController = SecondCustomTransitionController()
    let thirdCustomAnimationControler = ThirdCustomAnimationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setup()
    }

    func setup(){
        self.setupBorderViews()
        self.calculateButtonsHeight()
        self.setupFirstButton()
        self.setupSecondButton()
        self.setupThirdButton()
    }

    func setupBorderViews(){
        let bottomBorderView = SimpleBorderView()

        self.view.addSubview(bottomBorderView)

        bottomBorderView.snp_makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(40)
        }
        self.bottomBorderView = bottomBorderView
    }

    func setupFirstButton(){
        let firstButton = UIButton()

        firstButton.setImage(UIImage(named: Names.flowers), forState: .Normal)
        firstButton.alpha = 0.8

        guard let imgView = firstButton.imageView else{
            return
        }

        imgView.contentMode = .ScaleAspectFill

        firstButton.addTarget(self, action: #selector(SelectionVC.actionOnButtonsClick(_:)), forControlEvents: .TouchUpInside)

        self.view.addSubview(firstButton)

        firstButton.snp_makeConstraints { (make) in
            make.top.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(self.buttonsHeight)
        }
        self.firstButton = firstButton

        self.setupExplanationTextFirstButton()
    }

    func setupSecondButton(){
        let secondButton = UIButton()
        secondButton.setImage(UIImage(named: Names.template), forState: .Normal)
        secondButton.alpha = 0.7

        guard let imgView = secondButton.imageView else{
            return
        }

        imgView.contentMode = .ScaleAspectFill
        secondButton.addTarget(self, action: #selector(SelectionVC.actionOnButtonsClick(_:)), forControlEvents: .TouchUpInside)

        self.view.addSubview(secondButton)

        secondButton.snp_makeConstraints { (make) in
            make.top.equalTo(firstButton.snp_bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(self.buttonsHeight)
        }
        self.secondButton = secondButton

        self.setupExplanationTextSecondButton()
    }

    func setupThirdButton(){
        let thirdButton = UIButton()
        thirdButton.setImage(UIImage(named: Names.chocko), forState: .Normal)
        thirdButton.alpha = 0.7

        guard let imgView = thirdButton.imageView else{
            return
        }

        imgView.contentMode = .ScaleAspectFill
        thirdButton.addTarget(self, action: #selector(SelectionVC.actionOnButtonsClick(_:)), forControlEvents: .TouchUpInside)

        self.view.addSubview(thirdButton)

        thirdButton.snp_makeConstraints { (make) in
            make.top.equalTo(secondButton.snp_bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(self.buttonsHeight)
        }
        self.thirdButton = thirdButton

        self.setupExplanationTextThirdButton()
    }

    func setupExplanationTextFirstButton(){
        let textView = ExplanationText()
        textView.explanatoryLabel.text = "First"
        self.firstButton.addSubview(textView)

        textView.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(self.firstButton).inset(100)
            make.top.bottom.equalTo(self.firstButton).inset(80)
        }
    }

    func setupExplanationTextSecondButton(){
        let textView = ExplanationText()
        textView.explanatoryLabel.text = "Second"
        self.secondButton.addSubview(textView)

        textView.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(self.secondButton).inset(100)
            make.top.bottom.equalTo(self.secondButton).inset(80)
        }
    }

    func setupExplanationTextThirdButton(){
        let textView = ExplanationText()
        textView.explanatoryLabel.text = "Third"
        self.thirdButton.addSubview(textView)

        textView.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(self.thirdButton).inset(100)
            make.top.bottom.equalTo(self.thirdButton).inset(80)
        }
    }

    func calculateButtonsHeight(){
        let buttonHeight = (self.view.frame.height - 40)/CGFloat(Names.amount)
        self.buttonsHeight = buttonHeight
    }

    func actionOnButtonsClick(sender: UIButton){
        if sender == self.firstButton{
            self.selectedButton = ActionsName.first
            self.showFirstAnimation(sender)
        }
        else if sender == self.secondButton{
            self.selectedButton = ActionsName.second
            self.showFirstAnimation(sender)
        }
        else if sender == self.thirdButton{
            self.selectedButton = ActionsName.third
            self.showFirstAnimation(sender)
        }
    }

    func showFirstAnimation(sender: UIButton){
        let toVC = PresentingVC()
        toVC.transitioningDelegate = self
        self.presentViewController(toVC, animated: true, completion: nil)
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let result = self.transitionsSelector()
        return result
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let result = self.transitionsSelector()
        return result
    }

    func transitionsSelector() -> UIViewControllerAnimatedTransitioning?{
        if self.selectedButton == ActionsName.first{
            return firstCustomAnimationController
        }
        else if self.selectedButton == ActionsName.second{
            return secondCustomAnimationController
        }
        else{
            return thirdCustomAnimationControler
        }
    }
}

