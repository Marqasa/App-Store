//
//  BaseCategoryCollection.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

protocol CategoryCellDelegate: class {
	func showAppDetailsFor(app: App)
}

class BaseCategoryCollection: BaseCollectionCell {
	
	weak var delegate: CategoryCellDelegate?
	
	var appCategory: AppCategory? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let app = appCategory?.apps?[indexPath.item] else { return }
		delegate?.showAppDetailsFor(app: app)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return appCategory?.apps?.count ?? 0
	}
}
