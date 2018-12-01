//
//  LargeCategoryCollection.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class LargeCategoryCollection: NamedCategoryCollection {
	
	let largeCellId = "largeCellId"
	
	override func configuration() {
		collectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeCellId)
		
		super.configuration()
	}
	
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		
		return UIEdgeInsets(top: 0, left: margin, bottom: margin, right: margin)
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeAppCell
		cell.app = appCategory?.apps?[indexPath.item]
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let height = frame.height - nameLabel.frame.height - dividerView.frame.height - margin
		return CGSize(width: 200, height: height)
	}
}
