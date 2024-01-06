//
//  Repo.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 04/01/24.
//

import Foundation

struct Repo: Codable {
	var name: String?
	var htmlURL: String?
	var description: String?
	var createdAt, updatedAt: String?
	var language: String?
	
	enum CodingKeys: String, CodingKey {
		case name
		case htmlURL = "html_url"
		case description
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case language
	}
}
