# JXReviewController

Request rating by 1-5 stars.

[![CI Status](https://img.shields.io/travis/swordray/JXReviewController.svg?style=flat)](https://travis-ci.org/swordray/JXReviewController)
[![Version](https://img.shields.io/cocoapods/v/JXReviewController.svg?style=flat)](https://cocoapods.org/pods/JXReviewController)
[![License](https://img.shields.io/cocoapods/l/JXReviewController.svg?style=flat)](https://cocoapods.org/pods/JXReviewController)
[![Platform](https://img.shields.io/cocoapods/p/JXReviewController.svg?style=flat)](https://cocoapods.org/pods/JXReviewController)

## Requirements

* iOS 13+

## Installation

JXReviewController is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'JXReviewController'
```

## Usage

* Present a `JXReviewController` instance from your view controller.

  ```swift
  import JXReviewController

  class ViewController: UIViewController {

      func requestReview() {
          let reviewController = JXReviewController()
          reviewController.image = UIImage(systemName: "app.fill")
          reviewController.title = "Enjoy it?"
          reviewController.message = "Tap a star to rate it."
          reviewController.delegate = self
          present(reviewController, animated: true)
      }
  }
  ```

* Receive feedbacks by implimenting `JXReviewControllerDelegate`.

  ```swift
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
  ```

## Author

Jianqiu Xiao, swordray@gmail.com

## License

JXReviewController is available under the MIT license. See the LICENSE file for more info.
