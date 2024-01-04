//
//  UIText + Extension.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation
import UIKit

extension UIFont {
	
	enum FontType {
		case extraBold
		case bold
		case medium
		case regular
		
		func getFontName()-> String {
			switch self {
			case .extraBold:
				return "Inter-ExtraBold"
			case .bold:
				return "Inter-Bold"
			case .medium:
				return "Inter-Medium"
			case .regular:
				return "Inter-Regular"
			}
		}
		
		func getWeight()-> UIFont.Weight {
			switch self {
			case .extraBold:
				return .heavy
			case .bold:
				return .bold
			case .medium:
				return .medium
			case .regular:
				return .regular
			}
		}
	}
	
	static func customFont(type: FontType, size: CGFloat)-> UIFont {
		guard let font = UIFont(name: type.getFontName(), size: size) else {
			return UIFont.systemFont(ofSize: size, weight: type.getWeight())
		}
		
		return font
	}
}
