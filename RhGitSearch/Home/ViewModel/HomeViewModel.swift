//
//  HomeViewModel.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation
import RegexBuilder

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
	
	public func completeValidationTextField(textField: String)-> Bool {
		if !textField.isEmpty &&
			textField.count >= 4 &&
			textField.count <= 100 &&
			textRegexValidate(textField: textField) {
			
			return true
		} else {
			return false
		}
	}
	
	public func textRegexValidate(textField: String)-> Bool {
		if ((textField.wholeMatch(of: CustomRegex.regex)?.output) != nil){
			return true
		} else {
			return false
		}
	}
	
	public func removeSpaceTextField(textField: String)-> String {
		let replaceSpacesText = textField.replacingOccurrences(of: " ", with: "-", options: .literal, range: nil)
		let formatText = replaceSpacesText.lowercased()
		
		return formatText
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
