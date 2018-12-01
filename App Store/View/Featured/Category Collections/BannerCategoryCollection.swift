//
//  BannerCategoryCollection.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class BannerCategoryCollection: BaseCategoryCollection {
	
	let bannerCellId = "bannerCellId"
	
	override func configuration() {
		collectionView.register(BannerAppCell.self, forCellWithReuseIdentifier: bannerCellId)
		
		super.configuration()
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellId, for: indexPath) as! BannerAppCell
		cell.app = appCategory?.apps?[indexPath.item]
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let height = frame.height
		let width = height * 2.05
		return CGSize(width: width, height: height)
	}
}
