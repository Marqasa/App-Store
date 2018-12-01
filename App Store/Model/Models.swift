//
//  Models.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 27/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import Foundation

struct Featured: Decodable {
	var bannerCategory: AppCategory?
	var categories: [AppCategory]?
	
	static func getFeaturedApps(completion: @escaping (Featured) -> ()) {
		getGenericData(urlString: featuredUrl, completion: completion)
	}
}

struct AppCategory: Decodable {
	var name: String?
	var apps: [App]?
	var type: String?
}

struct App: Codable {
	var id: Int?
	var name: String?
	var category: String?
	var price: Double?
	var imageName: String?
	var screenshots: [String]?
	var description: String?
	var appInformation: [AppInfo]?
	
	enum CodingKeys: String, CodingKey {
		case id = "Id"
		case name = "Name"
		case category = "Category"
		case price = "Price"
		case imageName = "ImageName"
		case screenshots = "Screenshots"
		case description = "description"
		case appInformation = "appInformation"
	}
}

struct AppInfo: Codable {
	var name: String?
	var value: String?
	
	enum CodingKeys: String, CodingKey {
		case name = "Name"
		case value = "Value"
	}
}
