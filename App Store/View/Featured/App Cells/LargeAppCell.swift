//
//  LargeAppCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class LargeAppCell: BaseAppCell {
	
	override func setupViews() {
		imageView.layer.cornerRadius = 16
		
		super.setupViews()
	}
}
