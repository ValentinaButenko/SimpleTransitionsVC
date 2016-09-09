//
//  SimpleBorderView.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SimpleBorderView: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func setup(){
        let label = UILabel()
        label.contentMode = .Center

        label.text = "Simple Transition Animations between VC"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        label.textColor = UIColor(red: 108/255, green: 122/255, blue: 137/255, alpha: 1.0)

        self.addSubview(label)

        label.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        self.backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0)
    }
}