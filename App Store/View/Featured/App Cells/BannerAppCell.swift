//
//  BannerAppCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class BannerAppCell: BaseAppCell {
	
	override func setupViews() {
		imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
		imageView.layer.borderWidth = 0.5
		
		super.setupViews()
	}
}
