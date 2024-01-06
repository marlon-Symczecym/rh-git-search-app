//
//  UIImageView + Extension.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation
import UIKit

extension UIImageView {
	func loadImageFromRemoteURL(url: String) {
		guard let stringUrl = URL(string: url) else { return }
		
		DispatchQueue.global().async {
			guard let data = try? Data(contentsOf: stringUrl) else { return }
			
			DispatchQueue.main.async {
				self.image = UIImage(data: data)
			}
		}
	}
}
