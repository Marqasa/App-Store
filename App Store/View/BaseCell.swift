//
//  BaseCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
		setupConstraints()
		configuration()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setupViews() {}
	
	func setupConstraints() {}
	
	func configuration() {}
}
