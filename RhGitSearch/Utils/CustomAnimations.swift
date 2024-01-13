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
			UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
			}, completion: nil)
		}
	}
	
	static public func repoButtonURLAnimation(viewToAnimate: UIView) {
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
			viewToAnimate.layer.shadowColor = UIColor.darkGray.cgColor
			viewToAnimate.layer.shadowOpacity = 0.3
			viewToAnimate.layer.shadowOffset = CGSize(width: 0, height: 0)
			viewToAnimate.layer.shadowRadius = 4
			viewToAnimate.layer.masksToBounds = false
			viewToAnimate.layer.rasterizationScale = UIScreen.main.scale
		}) { (_) in
			UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
				viewToAnimate.layer.shadowOpacity = .zero
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
	
	static public func repositoriesAnimation(viewToAnimate: UIView) {
		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
			viewToAnimate.transform = CGAffineTransform(translationX: viewToAnimate.frame.origin.x + 20, y: 0)
		}) { (_) in
			UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
			}, completion: nil)
		}
	}
}
