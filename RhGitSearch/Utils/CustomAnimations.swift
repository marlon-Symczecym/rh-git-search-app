//
//  CustomAnimations.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 09/01/24.
//

import UIKit

class CustomAnimations {

	static public func searchButtonAnimationTapped(viewToAnimate: UIView) {
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
			viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
		}) { (_) in
			UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
			}, completion: nil)
		}
	}
	
	static public func magnifierAnimation(viewToAnimate: UIView) {
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
			viewToAnimate.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
		}) { (_) in
			UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
			}, completion: nil)
		}
	}
	
	static public func cardUserAnimation(viewToAnimate: UIView) {
		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
			viewToAnimate.transform = CGAffineTransform(translationX: viewToAnimate.frame.origin.x + 20, y: 0)
		}) { (_) in
			UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
			}, completion: nil)
		}
	}
	
	static public func cardRepositoriesAnimation(viewToAnimate: UIView) {
		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
			viewToAnimate.transform = CGAffineTransform(translationX: viewToAnimate.frame.origin.x + 20, y: 0)
		}) { (_) in
			UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
			}, completion: nil)
		}
	}

}
