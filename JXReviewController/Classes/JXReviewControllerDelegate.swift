//
//  JXReviewControllerDelegate.swift
//  JXReviewController
//
//  Created by Jianqiu Xiao on 07/02/2020.
//  Copyright (c) 2020 Jianqiu Xiao. All rights reserved.
//

@available(iOS 13, *)
public protocol JXReviewControllerDelegate: AnyObject {

    func reviewController(_ reviewController: JXReviewController, didSelectWith point: Int)

    func reviewController(_ reviewController: JXReviewController, didCancelWith point: Int)

    func reviewController(_ reviewController: JXReviewController, didSubmitWith point: Int)
}

@available(iOS 13, *)
public extension JXReviewControllerDelegate {

    func reviewController(_ reviewController: JXReviewController, didSelectWith point: Int) {}

    func reviewController(_ reviewController: JXReviewController, didCancelWith point: Int) {}

    func reviewController(_ reviewController: JXReviewController, didSubmitWith point: Int) {}
}
