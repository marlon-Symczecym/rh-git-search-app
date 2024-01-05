//
//  User.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 04/01/24.
//

import Foundation

struct User: Codable {
	var login: String?
	var avatarURL: String?
	var htmlURL: String?
	var name, location: String?
	var email: String?
	var publicRepos, followers, following: Int?
	var createdAt, updatedAt: Date?
	var repos: [Repos]
	
	enum CodingKeys: String, CodingKey {
		case login
		case avatarURL = "avatar_url"
		case htmlURL = "html_url"
		case name, location, email
		case publicRepos = "public_repos"
		case followers, following
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
}
