//
//  ViewController.swift
//  JXReviewController
//
//  Created by Jianqiu Xiao on 07/02/2020.
//  Copyright (c) 2020 Jianqiu Xiao. All rights reserved.
//

import JXReviewController
import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        requestReview()
    }

    private func requestReview() {
        let reviewController = JXReviewController()
        reviewController.image = UIImage(systemName: "app.fill")
        reviewController.title = "Enjoy it?"
        reviewController.message = "Tap a star to rate it."
        reviewController.delegate = self
        present(reviewController, animated: true)
    }
}

extension ViewController: JXReviewControllerDelegate {

    func reviewController(_ reviewController: JXReviewController, didSelectWith point: Int) {
        print("Did select with \(point) point(s).")
    }

    func reviewController(_ reviewController: JXReviewController, didCancelWith point: Int) {
        print("Did cancel with \(point) point(s).")
    }

    func reviewController(_ reviewController: JXReviewController, didSubmitWith point: Int) {
        print("Did submit with \(point) point(s).")
    }
}
