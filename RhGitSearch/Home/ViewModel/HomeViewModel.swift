//
//  HomeViewModel.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
	func sucess()
	func error(error: String)
}

class HomeViewModel {

	private var service: UserService = UserService()
	private var user = User()
	
	private weak var delegate: HomeViewModelProtocol?
	
	public func delegate(delegate: HomeViewModelProtocol?) {
		self.delegate = delegate
	}
	
	public func getUser()-> User {
		return self.user
	}
	
	public func getPublicRepos()-> Int {
		return self.user.publicRepos ?? 0
	}
	
	public var numberOfItems: Int {
		2
	}
	
	public func sizeForItem(indexPath: IndexPath, frame: CGRect)-> CGSize {
		if indexPath.row == 0 {
			return CGSize(width: frame.width, height: 198 + 20)
		} else {
			return CGSize(width: frame.width, height: frame.height)
		}
	}
	
	public func validationTextField(textFieldText: String)-> Bool {
		if !textFieldText.isEmpty &&
			textFieldText.count >= 4 &&
			textFieldText.count <= 100 {
			
			return true
		} else {
			return false
		}
	}
	
	public func fetchAllData(userName: String) {
		service.userGetDataJsonURLSession(userName: userName) { user, error in
			if error == nil {
				self.user = user ?? User()
				self.delegate?.sucess()
			} else {
				self.delegate?.error(error: error?.localizedDescription ?? "")
			}
		}
	}
}
