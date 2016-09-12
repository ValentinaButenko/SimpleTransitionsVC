//
//  SecondCustomTransitionController.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/12/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit

class SecondCustomTransitionController: NSObject, UIViewControllerAnimatedTransitioning{
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()

        toViewController.view.frame = finalFrameForVC
        toViewController.view.alpha = 0.8
        containerView?.addSubview(toViewController.view)
        containerView?.sendSubviewToBack(toViewController.view)

        let firstSnapshotView = fromViewController.view.resizableSnapshotViewFromRect(CGRectMake(fromViewController.view.frame.minX, fromViewController.view.frame.minY, fromViewController.view.frame.width, fromViewController.view.frame.height/2), afterScreenUpdates: false, withCapInsets: UIEdgeInsetsZero)
        let secondSnapshotView = fromViewController.view.resizableSnapshotViewFromRect(CGRectMake(fromViewController.view.frame.minX, fromViewController.view.frame.minY, fromViewController.view.frame.width, fromViewController.view.frame.height/2), afterScreenUpdates: false, withCapInsets: UIEdgeInsetsZero)

        firstSnapshotView.frame = CGRectMake(fromViewController.view.frame.minX, fromViewController.view.frame.minY, fromViewController.view.frame.width, fromViewController.view.frame.height/2)
        secondSnapshotView.frame = CGRectMake(fromViewController.view.frame.minX, fromViewController.view.frame.height/2, fromViewController.view.frame.width, fromViewController.view.frame.height/2)

        firstSnapshotView.alpha = 0.8
        secondSnapshotView.alpha = 0.8

        containerView?.addSubview(firstSnapshotView)
        containerView?.addSubview(secondSnapshotView)

        fromViewController.view.removeFromSuperview()


        UIView.animateWithDuration(transitionDuration(transitionContext),
                                   delay: 0.0,
                                   options: .CurveEaseIn,
                                   animations: {firstSnapshotView.frame = CGRectMake(fromViewController.view.frame.width,
                                                                                    fromViewController.view.frame.minY,
                                                                                    fromViewController.view.frame.width,
                                                                                    fromViewController.view.frame.height/2)
                                                secondSnapshotView.frame = CGRectMake(-fromViewController.view.frame.width,
                                                                                    fromViewController.view.frame.height/2,
                                                                                    fromViewController.view.frame.width,
                                                                                    fromViewController.view.frame.height/2)
                                                toViewController.view.alpha = 1.0},
                                   completion: {_ in firstSnapshotView.removeFromSuperview()
                                                        secondSnapshotView.removeFromSuperview()
                                                        transitionContext.completeTransition(true)})
    }
}





