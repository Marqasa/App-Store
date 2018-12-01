//
//  ScreenshotsViewController.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 01/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class ScreenshotsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	let cellId = "cellId"
	
	var initialLoad = true
	
	var screenshots: [String]? {
		didSet {
			guard let screenshots = screenshots else { return }
			pageControl.numberOfPages = screenshots.count
		}
	}
	
	let pageControl: UIPageControl = {
		let pc = UIPageControl()
		pc.translatesAutoresizingMaskIntoConstraints = false
		return pc
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupViews()
		setupConstraints()
		
		if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
		}
		
		collectionView.isPagingEnabled = true
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(FullscreenImageCell.self, forCellWithReuseIdentifier: cellId)
    }
	
	private func setupViews() {
		view.addSubview(pageControl)
	}
	
	private func setupConstraints() {
		
		var topAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, bottomAnchor: NSLayoutYAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor
		
		if #available(iOS 11.0, *) {
			topAnchor = view.safeAreaLayoutGuide.topAnchor
			leadingAnchor = view.safeAreaLayoutGuide.leadingAnchor
			bottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
			trailingAnchor = view.safeAreaLayoutGuide.trailingAnchor
		} else {
			topAnchor = view.topAnchor
			leadingAnchor = view.leadingAnchor
			bottomAnchor = view.bottomAnchor
			trailingAnchor = view.trailingAnchor
		}
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
			
			pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
			pageControl.bottomAnchor.constraint(equalTo: bottomAnchor),
			pageControl.trailingAnchor.constraint(equalTo: trailingAnchor),
			pageControl.heightAnchor.constraint(equalToConstant: 50)])
	}
	
	override func viewDidLayoutSubviews() {
		if initialLoad {
			initialLoad = false
			
			let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
			self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
		}
	}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
        return screenshots?.count ?? 0
    }
	
	override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let x = targetContentOffset.pointee.x
		pageControl.currentPage = Int(x / collectionView.frame.width)
	}

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FullscreenImageCell
		cell.imageName = screenshots?[indexPath.item]
        return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return collectionView.frame.size
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		
		collectionViewLayout.invalidateLayout()
		
		coordinator.animate(alongsideTransition: { (_) in
			let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
			self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		})
	}
}
