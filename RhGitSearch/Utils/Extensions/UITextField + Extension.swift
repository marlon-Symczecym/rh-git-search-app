//
//  UITextField = Extension.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import UIKit

extension UITextField {
	
	func setPlaceholderColor(placeholder: String, color: UIColor) {
		self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
	}
}
