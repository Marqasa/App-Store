//
//  DetailsDescriptionCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 29/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class DetailsDescriptionCell: BaseCell {
	
	var text: String? {
		didSet {
			textView.text = text
			textView.sizeToFit()
			setNeedsLayout()
			layoutIfNeeded()
		}
	}
	
	let descLabel: UILabel = {
		let label = UILabel()
		label.text = "Description"
		label.font = .systemFont(ofSize: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let textView: UITextView = {
		let tv = UITextView()
		tv.textColor = .darkGray
		tv.isScrollEnabled = false
		tv.translatesAutoresizingMaskIntoConstraints = false
		return tv
	}()
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func setupViews() {
		contentView.addSubview(descLabel)
		contentView.addSubview(textView)
		contentView.addSubview(dividerView)
	}
	
	override func setupConstraints() {
		
		NSLayoutConstraint.activate([
			descLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
			descLabel.heightAnchor.constraint(equalToConstant: 18),
			
			textView.topAnchor.constraint(equalTo: descLabel.bottomAnchor),
			textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
			
			dividerView.topAnchor.constraint(equalTo: textView.bottomAnchor),
			dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			dividerView.heightAnchor.constraint(equalToConstant: 0.5)
			])
	}
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		
		guard let window = UIApplication.shared.keyWindow else { return layoutAttributes }
		
		let insets = window.safeAreaInsets.left + window.safeAreaInsets.right
		let width = window.frame.width - insets
		
		let tvSize = textView.sizeThatFits(CGSize(width: width - (margin * 2), height: .infinity))
		
		let height = descLabel.frame.height + tvSize.height + dividerView.frame.height
		
		let frame = CGRect(x: 0, y: 0, width: width, height: height)
		
		layoutAttributes.frame = frame
		
		return layoutAttributes
	}
}
