//
//  StyleLabelForButtons.swift
//  SimpleTransitionAnimations
//
//  Created by Valentina Butenko on 9/9/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ExplanationText: UIView{

    var explanatoryLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func setup(){
        let explanatoryLabel = UILabel()
        self.backgroundColor = UIColor.whiteColor()
        self.alpha = 0.7
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.whiteColor().CGColor

        explanatoryLabel.backgroundColor = UIColor.clearColor()
        explanatoryLabel.textColor = UIColor.blackColor()
        explanatoryLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        explanatoryLabel.textAlignment = .Center

        self.addSubview(explanatoryLabel)
        explanatoryLabel.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(self)
            make.leading.trailing.equalTo(self).inset(10)
            make.top.bottom.equalTo(self).inset(10)
        }

        self.explanatoryLabel = explanatoryLabel
    }
}