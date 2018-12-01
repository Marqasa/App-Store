//
//  FullscreenImageCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 01/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class FullscreenImageCell: BaseCell {
	
	var imageName: String? {
		didSet {
			guard let name = imageName else { return }
			imageView.image = UIImage(named: name)
		}
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.backgroundColor = .black
		iv.contentMode = .scaleAspectFit
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
