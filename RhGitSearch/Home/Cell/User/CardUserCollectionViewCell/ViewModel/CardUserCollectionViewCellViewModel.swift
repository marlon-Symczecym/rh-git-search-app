//
//  CardUserCollectionViewCellViewModel.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 05/01/24.
//

import Foundation

class CardUserCollectionViewCellViewModel {
	
	public func configUserNameDoubleLine(userName: String)-> String {
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
	
}
