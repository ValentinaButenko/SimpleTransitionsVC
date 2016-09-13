//
//  FirstCustomAnimationController.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit

class FirstCustomAnimationController: NSObject, UIViewControllerAnimatedTransitioning{

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.8
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        let bounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height)
        containerView!.addSubview(toViewController.view)

        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0,
                                   usingSpringWithDamping: 0.6,
                                   initialSpringVelocity: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                        fromViewController.view.alpha = 0.6
                                        toViewController.view.frame = finalFrameForVC
                                    },
                                   completion: {
                                        _ in
                                        transitionContext.completeTransition(true)
                                        fromViewController.view.alpha = 1.0})
    }
}