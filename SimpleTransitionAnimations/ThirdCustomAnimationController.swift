//
//  ThirdCustomAnimationController.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/12/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit

class ThirdCustomAnimationController: NSObject, UIViewControllerAnimatedTransitioning{
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()

        toViewController.view.frame = finalFrameForVC
        toViewController.view.alpha = 0.0
        fromViewController.view.alpha = 0.8

        containerView?.addSubview(toViewController.view)
        containerView?.sendSubviewToBack(toViewController.view)

        let firstSnapshotView = toViewController.view.resizableSnapshotViewFromRect(CGRectMake(toViewController.view.frame.minX, toViewController.view.frame.minY, toViewController.view.frame.width/2, toViewController.view.frame.height), afterScreenUpdates: false, withCapInsets: UIEdgeInsetsZero)

        let secondSnapshotView = toViewController.view.resizableSnapshotViewFromRect(CGRectMake(toViewController.view.frame.width/2, toViewController.view.frame.minY, toViewController.view.frame.width/2, toViewController.view.frame.height), afterScreenUpdates: false, withCapInsets: UIEdgeInsetsZero)

        firstSnapshotView.frame = CGRectMake(-toViewController.view.frame.width/2, toViewController.view.frame.minY, toViewController.view.frame.width/2, toViewController.view.frame.height)
        secondSnapshotView.frame = CGRectMake(toViewController.view.frame.width, toViewController.view.frame.minY, toViewController.view.frame.width/2, toViewController.view.frame.height)

        firstSnapshotView.alpha = 0.5
        secondSnapshotView.alpha = 0.5

        containerView?.addSubview(firstSnapshotView)
        containerView?.addSubview(secondSnapshotView)

        UIView.animateWithDuration(transitionDuration(transitionContext),
                                   delay: 0.0,
                                   options: .CurveEaseOut,
                                   animations: {
                                    firstSnapshotView.frame = CGRectMake(toViewController.view.frame.minX,
                                                                            toViewController.view.frame.minY,
                                                                            toViewController.view.frame.width/2,
                                                                            toViewController.view.frame.height)
                                    secondSnapshotView.frame = CGRectMake(toViewController.view.frame.width/2,
                                                                            toViewController.view.frame.minY,
                                                                            toViewController.view.frame.width/2,
                                                                            toViewController.view.frame.height)
                                    firstSnapshotView.alpha = 1.0
                                    secondSnapshotView.alpha = 1.0
                                    },
                                   completion: {_ in toViewController.view.alpha = 1.0
                                                     firstSnapshotView.removeFromSuperview()
                                                     secondSnapshotView.removeFromSuperview()
                                                     transitionContext.completeTransition(true)})

    }
}
