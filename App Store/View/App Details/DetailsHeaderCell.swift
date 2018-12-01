//
//  DetailsHeaderCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class DetailsHeaderCell: BaseCell {
	
	private let buttonHeight: CGFloat = 32
	
	var app: App? {
		didSet {
			if let imageName = app?.imageName {
				imageView.image = UIImage(named: imageName)
			}
			
			nameLabel.text = app?.name
			
			if let price = app?.price {
				buyButton.setTitle("$\(price)", for: .normal)
			}
		}
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.layer.masksToBounds = true
		iv.layer.cornerRadius = 16
		iv.contentMode = .scaleAspectFill
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 2
		return label
	}()
	
	let companyLabel: UILabel = {
		let label = UILabel()
		let text = NSMutableAttributedString(string: "Apple", attributes: [.font : UIFont.systemFont(ofSize: 14)])
		text.append(NSAttributedString(string: "›", attributes: [.foregroundColor : UIColor.gray]))
		label.attributedText = text
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		return label
	}()
	
	let purchasesLabel: UILabel = {
		let label = UILabel()
		label.text = "Offers In-App Purchases"
		label.font = .systemFont(ofSize: 11)
		label.textColor = .gray
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		return label
	}()
	
	let buyButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("GET", for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 15)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = appleBlue.cgColor
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let segmentedControl: UISegmentedControl = {
		let sc = UISegmentedControl(items: ["Details", "Reviews", "Related"])
		sc.tintColor = .gray
		sc.selectedSegmentIndex = 0
		sc.translatesAutoresizingMaskIntoConstraints = false
		return sc
	}()
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func setupViews() {
		contentView.addSubview(imageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(companyLabel)
		contentView.addSubview(purchasesLabel)
		contentView.addSubview(buyButton)
		contentView.addSubview(segmentedControl)
		contentView.addSubview(dividerView)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
			imageView.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -margin),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
			
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
			nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: margin),
			
			companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			companyLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
			companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: margin),
			
			purchasesLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 2),
			purchasesLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
			purchasesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: margin),
			
			buyButton.heightAnchor.constraint(equalToConstant: buttonHeight),
			buyButton.widthAnchor.constraint(equalToConstant: buttonHeight * 1.8),
			buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
			buyButton.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -margin),
			
			segmentedControl.heightAnchor.constraint(equalToConstant: buttonHeight),
			segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
			
			dividerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: margin),
			dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			dividerView.heightAnchor.constraint(equalToConstant: 0.5)
			])
	}
}
