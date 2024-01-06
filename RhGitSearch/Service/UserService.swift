//
//  UserService.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 05/01/24.
//

import Foundation

enum UserErrorDetail: Swift.Error {
	case errorURL(urlString: String)
	case detailError(detail: String)
}

class UserService {
	
	public func userGetDataJsonURLSession(userName: String, completion: @escaping(User?, Error?)-> Void) {
		let urlString = "https://api.github.com/users/\(userName)"
		
		guard let url: URL = URL(string: urlString) else {
			return completion(nil, UserErrorDetail.errorURL(urlString: urlString))
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			guard let dataResult = data else {
				return completion(nil, UserErrorDetail.detailError(detail: "Error Data"))
			}
			
			guard let response = response as? HTTPURLResponse else { return }
			
			if response.statusCode == 200 {
				do {
					let userData: User = try JSONDecoder().decode(User.self, from: dataResult)
					
					completion(userData, nil)
				} catch {
					completion(nil, error)
				}
			}
		}
		task.resume()
	}
	
	public func getDataJsonMock(userName: String, completion: @escaping(User?, Error?)-> Void) {
		if let url = Bundle.main.url(forResource: "UserData", withExtension: "json") {
			do {
				let data = try Data(contentsOf: url)
				let userData: User = try JSONDecoder().decode(User.self, from: data)
				
				print(userData)
				completion(userData, nil)
			} catch {
				completion(nil, error)
			}
		}
	}
	
}
