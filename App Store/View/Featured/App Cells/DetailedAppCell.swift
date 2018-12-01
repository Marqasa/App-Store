//
//  DetailedAppCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class DetailedAppCell: BaseAppCell {
	
	override var app: App? {
		didSet {
			if let imageName = app?.imageName {
				imageView.image = UIImage(named: imageName)
			}
			nameLabel.text = app?.name
			categoryLabel.text = app?.category
			if let price = app?.price {
				priceLabel.text = "$\(price)"
			}
		}
	}
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 2
		return label
	}()
	
	let categoryLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 12)
		label.textColor = .darkGray
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let priceLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 12)
		label.textColor = .darkGray
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func setupViews() {
		contentView.addSubview(nameLabel)
		contentView.addSubview(categoryLabel)
		contentView.addSubview(priceLabel)
		
		imageView.layer.cornerRadius = 16
		
		super.setupViews()
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
			
			nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
			nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			nameLabel.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor),
			
			categoryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			categoryLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor),
			
			priceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
			])
	}
}
