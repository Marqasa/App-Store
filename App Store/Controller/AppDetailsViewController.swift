//
//  AppDetailsViewController.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class AppDetailsViewController: UICollectionViewController {
	
	private let headerId = "headerId"
	private let screenshotsId = "screenshotsId"
	private let descriptionId = "descriptionId"
	private let infoId = "infoId"
	
	var app: App? {
		didSet {
			
			// Return if additional app details have already been obtained
			if app?.screenshots != nil { return }
			
			if let id = app?.id {
				getGenericData(urlString: "\(detailUrl)\(id)") { (app: App) in
					self.app = app
					self.collectionView.reloadData()
				}
			}
		}
	}
	
	var numberOfSections: Int {
		
		var sections = 0
		
		if app?.screenshots != nil { sections += 1 }
		if app?.description != nil { sections += 1 }
		if app?.appInformation != nil { sections += 1 }
		
		return sections
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if #available(iOS 11.0, *) {
			collectionView?.contentInsetAdjustmentBehavior = .always
		}
		
		if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
			layout.headerReferenceSize = CGSize(width: view.frame.width, height: 170)
		}
		
		collectionView.backgroundColor = .white
		collectionView.register(DetailsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
		collectionView.register(DetailsScreenshotsCollection.self, forCellWithReuseIdentifier: screenshotsId)
		collectionView.register(DetailsDescriptionCell.self, forCellWithReuseIdentifier: descriptionId)
		collectionView.register(DetailsInformationCell.self, forCellWithReuseIdentifier: infoId)
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		
		collectionViewLayout.invalidateLayout()
		
		super.viewWillTransition(to: size, with: coordinator)
	}

	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DetailsHeaderCell
		header.app = app
		return header
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if indexPath.item == 0 {
			let screenshotsCell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotsId, for: indexPath) as! DetailsScreenshotsCollection
			screenshotsCell.screenshots = app?.screenshots
			return screenshotsCell
		} else if indexPath.item == 1 {
			let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionId, for: indexPath) as! DetailsDescriptionCell
			descriptionCell.text = app?.description
			return descriptionCell
		} else {
			let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: infoId, for: indexPath) as! DetailsInformationCell
			infoCell.appInfo = app?.appInformation
			return infoCell
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return numberOfSections
	}
}

extension AppDetailsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		guard let window = UIApplication.shared.keyWindow else { return .zero }
		
		let insets = window.safeAreaInsets.left + window.safeAreaInsets.right
		let width = window.frame.width - insets
		
		return CGSize(width: width, height: 150)
	}
}
