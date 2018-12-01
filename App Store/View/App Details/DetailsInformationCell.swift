//
//  DetailsInformationCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 29/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class DetailsInformationCell: BaseCell {
	
	var appInfo: [AppInfo]? {
		didSet {
			setupStackViews()
			setNeedsLayout()
			layoutIfNeeded()
		}
	}
	
	private var stackViews: [UIStackView]?
	
	let infoLabel: UILabel = {
		let label = UILabel()
		label.text = "Information"
		label.font = .systemFont(ofSize: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func setupViews() {
		contentView.addSubview(infoLabel)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
			infoLabel.heightAnchor.constraint(equalToConstant: 20)
			])
	}
	
	private func setupStackViews() {
		
		guard let appInfo = appInfo else { return }
		
		guard let window = UIApplication.shared.keyWindow else { return }
		
		if stackViews == nil {
			stackViews = []
		} else {
			return
		}
		
		let insets = window.safeAreaInsets.left + window.safeAreaInsets.right
		let width = window.frame.width - insets
		
		for (i, info) in appInfo.enumerated() {
			
			let nameLabel = InfoLabel()
			nameLabel.text = info.name
			nameLabel.textAlignment = .right
			nameLabel.font = .systemFont(ofSize: 12)
			nameLabel.width = (width - margin * 2) / 3
			nameLabel.textColor = .darkGray
			
			let valueLabel = InfoLabel()
			valueLabel.text = info.value
			valueLabel.font = .systemFont(ofSize: 12)
			valueLabel.width = width - nameLabel.width
			
			let sv = UIStackView(arrangedSubviews: [nameLabel, valueLabel])
			sv.spacing = margin
			sv.distribution = .fillProportionally
			sv.sizeToFit()
			sv.translatesAutoresizingMaskIntoConstraints = false
			
			contentView.addSubview(sv)
			stackViews!.append(sv)
			
			NSLayoutConstraint.activate([
				sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
				sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
				sv.heightAnchor.constraint(equalToConstant: 20),
				])
			
			if i == 0 {
				sv.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: margin).isActive = true
			} else {
				sv.topAnchor.constraint(equalTo: stackViews![i-1].bottomAnchor).isActive = true
			}
		}
	}
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		
		guard let window = UIApplication.shared.keyWindow else { return layoutAttributes }
		
		let insets = window.safeAreaInsets.left + window.safeAreaInsets.right
		let width = window.frame.width - insets
		
		var height: CGFloat = 0
		
		for view in contentView.subviews {
			height += view.frame.height
		}
		
		height += margin
		
		let frame = CGRect(x: 0, y: 0, width: width, height: height)
		
		layoutAttributes.frame = frame
		
		return layoutAttributes
	}
}

class InfoLabel: UILabel {
	
	var width: CGFloat = 1.0
	
	override open var intrinsicContentSize: CGSize {
		return CGSize(width: width, height: 16)
	}
}
