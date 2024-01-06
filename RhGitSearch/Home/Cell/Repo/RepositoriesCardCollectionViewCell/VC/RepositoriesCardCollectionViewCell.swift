//
//  RepositoriesCardCollectionViewCell.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 04/01/24.
//

import UIKit

class RepositoriesCardCollectionViewCell: UICollectionViewCell {
	
	static var identifier: String = "RepositoriesCardCollectionViewCell"
	private var screen: RepositoriesCardCollectionViewCellScreen = RepositoriesCardCollectionViewCellScreen()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configScreen()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setupCell(data: Repo) {
		screen.titleLabel.text = data.name
		screen.languageLabel.text = data.language
		screen.updatedRepositorieLabel.text = data.updatedAt
	
		if (data.description ?? "").isEmpty {
			screen.describeLabel.text = "Repositório sem descrição... :("
		} else {
			screen.describeLabel.text = data.description
		}
	}
	
	private func configScreen() {
		contentView.addSubview(screen)
		screen.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			screen.topAnchor.constraint(equalTo: topAnchor),
			screen.leadingAnchor.constraint(equalTo: leadingAnchor),
			screen.trailingAnchor.constraint(equalTo: trailingAnchor),
			screen.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
	
}
