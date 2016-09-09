//
//  BlurEffect.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func makeBlurEffect(targetImageView: UIImageView, style: UIBlurEffectStyle){
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = targetImageView.bounds

        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        targetImageView.addSubview(blurEffectView)
    }
}