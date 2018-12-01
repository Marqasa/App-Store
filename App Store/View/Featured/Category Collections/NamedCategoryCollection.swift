//
//  NamedCategoryCollection.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class NamedCategoryCollection: BaseCategoryCollection {
	
	let detailedCellId = "detailedCellId"
	
	override var appCategory: AppCategory? {
		didSet {
			nameLabel.text = appCategory?.name
			
			collectionView.reloadData()
		}
	}
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func setupViews() {
		contentView.addSubview(nameLabel)
		contentView.addSubview(dividerView)
		
		super.setupViews()
	}
	
	override func configuration() {
		collectionView.register(DetailedAppCell.self, forCellWithReuseIdentifier: detailedCellId)
		
		super.configuration()
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: margin),
			nameLabel.heightAnchor.constraint(equalToConstant: 40),
			
			collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
			collectionView.bottomAnchor.constraint(equalTo: dividerView.topAnchor),
			
			dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
			dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			dividerView.heightAnchor.constraint(equalToConstant: 0.5)
			])
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailedCellId, for: indexPath) as! DetailedAppCell
		cell.app = appCategory?.apps?[indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		
		return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
	}
	
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let height = contentView.frame.height - nameLabel.frame.height - dividerView.frame.height
		return CGSize(width: 100, height: height)
	}
}
