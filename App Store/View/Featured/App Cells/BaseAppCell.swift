//
//  BaseAppCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class BaseAppCell: BaseCell {
	
	var app: App? {
		didSet {
			if let imageName = app?.imageName {
				imageView.image = UIImage(named: imageName)
			}
		}
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.layer.masksToBounds = true
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	
	override func setupViews() {
		contentView.addSubview(imageView)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
			])
	}
}
