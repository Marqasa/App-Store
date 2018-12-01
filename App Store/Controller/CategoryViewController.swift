//
//  CategoryViewController.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 27/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class CategoryViewController: UICollectionViewController {
	
	private let bannerCatId = "bannerCatId"
	private let namedCatId = "namedCellId"
	private let largeCatId = "largeCellId"
	
	private var bannerCategory: AppCategory?
	private var appCategories: [AppCategory]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		Featured.getFeaturedApps { (featured) in
			self.bannerCategory = featured.bannerCategory
			self.appCategories = featured.categories
			self.collectionView.reloadData()
		}
		
		navigationItem.title = "Featured"
		
		if #available(iOS 11.0, *) {
			collectionView?.contentInsetAdjustmentBehavior = .always
		}
		
		collectionView.backgroundColor = .white
		collectionView.register(BannerCategoryCollection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: bannerCatId)
		collectionView.register(NamedCategoryCollection.self, forCellWithReuseIdentifier: namedCatId)
		collectionView.register(LargeCategoryCollection.self, forCellWithReuseIdentifier: largeCatId)
	}
	
	private func getFrame() -> CGRect {
		
		if #available(iOS 11.0, *) {
			return view.safeAreaLayoutGuide.layoutFrame
		} else {
			return view.frame
		}
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		
		collectionViewLayout.invalidateLayout()
		
		super.viewWillTransition(to: size, with: coordinator)
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: bannerCatId, for: indexPath) as! BannerCategoryCollection
		cell.appCategory = bannerCategory
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if appCategories?[indexPath.item].type == "large" {
			let largeCell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCatId, for: indexPath) as! LargeCategoryCollection
			largeCell.appCategory = appCategories?[indexPath.item]
			return largeCell
		}
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: namedCatId, for: indexPath) as! NamedCategoryCollection
		cell.appCategory = appCategories?[indexPath.item]
		cell.delegate = self
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return appCategories?.count ?? 0
	}
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		
		let width = getFrame().size.width
		return CGSize(width: width, height: 120)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width = getFrame().size.width
		if appCategories?[indexPath.item].type == "large" {
			return CGSize(width: width, height: 150)
		}
		return CGSize(width: width, height: 230)
	}
}

extension CategoryViewController: CategoryCellDelegate {
	
	func showAppDetailsFor(app: App) {
		let layout = UICollectionViewFlowLayout()
		let vc = AppDetailsViewController(collectionViewLayout: layout)
		vc.app = app
		navigationController?.pushViewController(vc, animated: true)
	}
}
