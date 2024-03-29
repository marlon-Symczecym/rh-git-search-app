//
//  UIImage + Extension.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation
import UIKit

extension UIImage {
	class var imageLayerTop: UIImage {
		guard let image = UIImage(named: "wave-header") else {
			return UIImage()
		}
		return image
	}
	
	class var imageLayerCardUser: UIImage {
		guard let image = UIImage(named: "wave-card-user") else {
			return UIImage()
		}
		return image
	}
	
	class var imageAvatar: UIImage {
		guard let image = UIImage(named: "avatar") else {
			return UIImage()
		}
		
		return image
	}
}
