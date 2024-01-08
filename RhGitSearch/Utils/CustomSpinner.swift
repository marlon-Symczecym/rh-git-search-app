//
//  UIViewController + Extension.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 08/01/24.
//

import UIKit

class CustomSpinner {
	
	var spinner: UIActivityIndicatorView?
	var controller: UIViewController?
	var spinnerUIView: UIView?
	
	init(controller: UIViewController) {
		self.controller = controller
	}
	
	func spinnerStart() {
		spinnerUIView = UIView(frame: self.controller?.view.bounds ?? .zero)
		spinnerUIView?.backgroundColor = .clear
		
		spinner = UIActivityIndicatorView(style: .large)
		spinner?.color = .darkGray
		spinner?.center = spinnerUIView?.center ?? .zero
		
		self.spinner?.startAnimating()
		self.spinnerUIView?.addSubview(self.spinner ?? UIActivityIndicatorView())
		self.controller?.view.addSubview(self.spinnerUIView ?? UIView())
	}
	
	func spinnerStop() {
		spinner?.stopAnimating()
		spinnerUIView?.removeFromSuperview()
	}

}
