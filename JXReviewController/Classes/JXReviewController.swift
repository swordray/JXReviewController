//
//  JXReviewController.swift
//  JXReviewController
//
//  Created by Jianqiu Xiao on 07/02/2020.
//  Copyright (c) 2020 Jianqiu Xiao. All rights reserved.
//

import SnapKit
import UIKit

@available(iOS 13, *)
public class JXReviewController: UIViewController {

    private var cancelButton: UIButton!
    public weak var delegate: JXReviewControllerDelegate?
    public var image: UIImage?
    public var message: String?
    private var point = 0
    private var submitButton: UIButton!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        super.loadView()

        view.backgroundColor = UIColor { UIColor.black.withAlphaComponent($0.userInterfaceStyle == .dark ? 0.6 : 0.4) }

        let contentView = UIVisualEffectView()
        contentView.clipsToBounds = true
        contentView.effect = UIBlurEffect(style: .systemMaterial)
        contentView.layer.cornerRadius = 16
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
            $0.width.equalTo(270)
        }

        let stackView = UIStackView()
        stackView.axis = .vertical
        contentView.contentView.addSubview(stackView)
        stackView.snp.makeConstraints { $0.edges.equalToSuperview() }

        let headerView = UIStackView()
        headerView.alignment = .center
        headerView.axis = .vertical
        headerView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        headerView.isLayoutMarginsRelativeArrangement = true
        headerView.snp.makeConstraints { $0.height.greaterThanOrEqualTo(170) }
        stackView.addArrangedSubview(headerView)

        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = image
        imageView.layer.cornerRadius = 60 * 0.223_7
        imageView.snp.makeConstraints { $0.size.equalTo(60) }
        headerView.addArrangedSubview(imageView)
        headerView.setCustomSpacing(15, after: imageView)

        let titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        titleLabel.textAlignment = .center
        headerView.addArrangedSubview(titleLabel)
        headerView.setCustomSpacing(2, after: titleLabel)

        let messageLabel = UILabel()
        messageLabel.font = .preferredFont(forTextStyle: .subheadline)
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textAlignment = .center
        headerView.addArrangedSubview(messageLabel)

        headerView.addArrangedSubview(UIView())

        let headerSeparator = UIView()
        headerSeparator.backgroundColor = .separator
        headerSeparator.snp.makeConstraints { $0.height.equalTo(1 / traitCollection.displayScale) }
        stackView.addArrangedSubview(headerSeparator)

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 40, height: 44)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset.left = 35

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(JXReviewControllerStarCell.self, forCellWithReuseIdentifier: JXReviewControllerStarCell.description())
        collectionView.snp.makeConstraints { $0.height.equalTo(44) }
        stackView.addArrangedSubview(collectionView)

        let collectionSeparator = UIView()
        collectionSeparator.backgroundColor = .separator
        collectionSeparator.snp.makeConstraints { $0.height.equalTo(1 / traitCollection.displayScale) }
        stackView.addArrangedSubview(collectionSeparator)

        let actionsView = UIStackView()
        actionsView.distribution = .fillEqually
        actionsView.snp.makeConstraints { $0.height.equalTo(44) }
        stackView.addArrangedSubview(actionsView)

        cancelButton = JXReviewControllerButton()
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.setTitle(l("Not Now"), for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 17)
        actionsView.addArrangedSubview(cancelButton)

        submitButton = JXReviewControllerButton()
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        submitButton.isHidden = true
        submitButton.setTitle(l("Submit"), for: .normal)
        submitButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        actionsView.addArrangedSubview(submitButton)

        let submitSeparator = UIView()
        submitSeparator.backgroundColor = .separator
        submitButton.addSubview(submitSeparator)
        submitSeparator.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(1 / traitCollection.displayScale)
        }
    }

    @objc
    private func cancel() {
        dismiss(animated: true) {
            self.delegate?.reviewController(self, didCancelWith: self.point)
        }
    }

    @objc
    private func submit() {
        dismiss(animated: true) {
            self.delegate?.reviewController(self, didSubmitWith: self.point)
        }
    }

    private func l(_ key: String) -> String {
        let bundle = Bundle(path: Bundle(for: JXReviewController.self).path(forResource: "JXReviewController", ofType: "bundle") ?? "") ?? .main
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}

@available(iOS 13, *)
extension JXReviewController: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JXReviewControllerStarCell.description(), for: indexPath) as? JXReviewControllerStarCell ?? .init()
        cell.isFilled = indexPath.item < point
        return cell
    }
}

@available(iOS 13, *)
extension JXReviewController: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        point = indexPath.item + 1
        collectionView.reloadData()
        cancelButton.setTitle(l("Cancel"), for: .normal)
        submitButton.isHidden = false
        delegate?.reviewController(self, didSelectWith: point)
    }
}
