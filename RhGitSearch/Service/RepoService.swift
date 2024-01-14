//
//  RepoService.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 05/01/24.
//

import Foundation

enum ReposErrorDetail: Swift.Error {
	case errorURL(urlString: String)
	case detailError(detail: String)
}

class RepoService {
	
	public func reposGetDataJsonURLSession(reposURL: String, completion: @escaping([Repo]?, Error?)-> Void) {
		let urlRepo: String = reposURL
		let perPage: String = "per_page=100"
		let sort: String = "sort=updated"
		
		let urlString: String = "\(urlRepo)?\(perPage)&\(sort)"
		
		guard let url: URL = URL(string: urlString) else {
			return completion(nil, ReposErrorDetail.errorURL(urlString: urlString))
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			guard let dataResult = data else {
				return completion(nil, ReposErrorDetail.detailError(detail: "Error Data"))
			}
			
			guard let response = response as? HTTPURLResponse else { return }
			
			if response.statusCode == 200 {
				do {
					let repoData: [Repo] = try JSONDecoder().decode([Repo].self, from: dataResult)
					completion(repoData, nil)
				} catch {
					completion(nil, error)
				}
			}
		}
		task.resume()
	}
	
	public func getDataJsonMock(reposURL: String, completion: @escaping([Repo]?, Error?)-> Void) {
		if let url = Bundle.main.url(forResource: "ReposData", withExtension: "json") {
			do {
				let data = try Data(contentsOf: url)
				
				let reposData: [Repo] = try JSONDecoder().decode([Repo].self, from: data)
				
				completion(reposData, nil)
			} catch {
				completion(nil, error)
			}
		}
	}
}
