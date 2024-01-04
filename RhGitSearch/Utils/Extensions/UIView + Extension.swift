//
//  UIView + Extension.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 04/01/24.
//

import UIKit

extension UIView {

	func roundCorners(cornerRadiuns: CGFloat, typeCorners: CACornerMask) {
		self.layer.cornerRadius = cornerRadiuns
		self.layer.maskedCorners = typeCorners
		self.clipsToBounds = true
	}
}

extension CACornerMask {
	static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
	static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
	static public let topRight: CACornerMask = .layerMaxXMinYCorner
	static public let topLeft: CACornerMask = .layerMinXMinYCorner
}
