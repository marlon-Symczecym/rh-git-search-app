//
//  CustomAlert.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 06/01/24.
//

import Foundation
import UIKit

class CustomAlert {
	
	var controller: UIViewController?
	
	init(controller: UIViewController? = nil) {
		self.controller = controller
	}
	
	public func simpleAlert(title: String, message: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let closeAction = UIAlertAction(title: "Fechar", style: .default)
		
		alertController.addAction(closeAction)
		
		self.controller?.present(alertController, animated: true)
	}
	
}
