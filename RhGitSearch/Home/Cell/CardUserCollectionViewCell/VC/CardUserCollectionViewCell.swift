//
//  CardUserCollectionViewCell.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import UIKit

class CardUserCollectionViewCell: UICollectionViewCell {
	
	static var identifier: String = "CardUserCollectionViewCell"
	
	private var screen: CardUserCollectionViewCellScreen = CardUserCollectionViewCellScreen()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configScreen()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configScreen() {
		contentView.addSubview(screen)
		screen.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			screen.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			screen.leadingAnchor.constraint(equalTo: leadingAnchor),
			screen.trailingAnchor.constraint(equalTo: trailingAnchor),
			screen.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
		])
	}
}
