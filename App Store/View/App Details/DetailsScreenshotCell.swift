//
//  DetailsScreenshotCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class DetailsScreenshotCell: BaseCell {
	
	var screenshot: String? {
		didSet {
			guard let screenshot = screenshot else { return }
			imageView.image = UIImage(named: screenshot)
		}
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.layer.masksToBounds = true
		iv.backgroundColor = .yellow
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	
	override func setupViews() {
		contentView.addSubview(imageView)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
			])
	}
}
