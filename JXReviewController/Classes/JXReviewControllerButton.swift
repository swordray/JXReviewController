//
//  JXReviewControllerButton.swift
//  JXReviewController
//
//  Created by Jianqiu Xiao on 5/7/2020.
//  Copyright (c) 2020 Jianqiu Xiao. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class JXReviewControllerButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setBackgroundColor(.systemFill, for: .highlighted)
        setTitleColor(tintColor, for: .normal)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()

        setTitleColor(tintColor, for: .normal)
    }
}

