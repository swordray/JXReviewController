//
//  JXReviewControllerStarCell.swift
//  JXReviewController
//
//  Created by Jianqiu Xiao on 07/02/2020.
//  Copyright (c) 2020 Jianqiu Xiao. All rights reserved.
//

import SnapKit
import UIKit

@available(iOS 13, *)
internal class JXReviewControllerStarCell: UICollectionViewCell {

    private var imageView: UIImageView!
    public var isFilled = false { didSet { didSetFilled() } }

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { $0.center.equalToSuperview() }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func didSetFilled() {
        imageView.image = UIImage(systemName: isFilled ? "star.fill" : "star")
    }
}
