//
//  HomeViewModel.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation

class HomeViewModel {
	
	func configUserNameDoubleLine(userName: String)-> String {
		if !userName.isEmpty {
			let result = userName.split(separator: " ")
			
			if result.count == 1 {
				return "\(result[0].capitalized)"
			} else if result.count == 2 {
				return "\(result[0].capitalized)\n\(result[1].capitalized)"
			} else {
				return "\(result[0].capitalized)\n\(result[1].capitalized)..."
			}
		} else {
			return ""
		}
	}
	
	func sizeForItem(indexPath: IndexPath, frame: CGRect)-> CGSize {
		if indexPath.row == 0 {
			return CGSize(width: frame.width, height: 198 + 20)
		} else {
			return CGSize(width: frame.width, height: frame.height)
		}
	}
}
