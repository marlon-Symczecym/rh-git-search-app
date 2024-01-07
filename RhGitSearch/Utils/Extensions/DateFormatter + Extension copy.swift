//
//  DateFormatter + Utils.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 06/01/24.
//

import Foundation

extension DateFormatter {
	
	static func updatedDateFormatter(dateString: String)-> String {
		let dateFormatter = DateFormatter()
		
		dateFormatter.locale = Locale(identifier: "pt_BR")
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
		
		let date = dateFormatter.date(from: dateString)
		dateFormatter.dateFormat = "dd MMM yyyy"
		
		return dateFormatter.string(from: date ?? Date())
	}
	
}
