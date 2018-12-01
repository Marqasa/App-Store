//
//  DetailsScreenshotsCollection.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

protocol ScreenshotsDelegate: class {
	func showScreenshots(_ screenshots: [String], _ indexPath: IndexPath)
}

class DetailsScreenshotsCollection: BaseCollectionCell {
	
	weak var delegate: ScreenshotsDelegate?
	
	let screenshotId = "screenshotId"
	
	var screenshots: [String]? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func setupViews() {
		super.setupViews()
		
		contentView.addSubview(dividerView)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: dividerView.topAnchor),
		
			dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			dividerView.heightAnchor.constraint(equalToConstant: 0.5)
			])
	}
	
	override func configuration() {
		super.configuration()
		
		collectionView.register(DetailsScreenshotCell.self, forCellWithReuseIdentifier: screenshotId)
	}
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		
		return layoutAttributes
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return screenshots?.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let screenshotCell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId, for: indexPath) as! DetailsScreenshotCell
		screenshotCell.screenshot = screenshots?[indexPath.item]
		return screenshotCell
	}
	
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let itemHeight = contentView.frame.height - margin * 2
		let itemWidth = (itemHeight * (16/9)).rounded()
		return CGSize(width: itemWidth, height: itemHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		
		return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		
		return margin
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let screenshots = screenshots else { return }
		delegate?.showScreenshots(screenshots, indexPath)
	}
}
