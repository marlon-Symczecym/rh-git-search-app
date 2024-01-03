//
//  HomeScreen.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 02/01/24.
//

import UIKit

class HomeScreen: UIView {
	
	lazy var label: UILabel = {
		
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Teste de Fonte"
		label.textColor = .primaryDarkGreen
		
		return label
		
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(label)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// label
			label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 25),
		])
	}
	
}
