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
	private var repoURL: String?
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		screen.delegate(delegate: self)
		
		configScreen()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setupCell(data: Repo) {
		screen.titleLabel.text = data.name
		screen.languageLabel.text = data.language
		
		repoURL = data.htmlURL
		
		let dateString = DateFormatter.updatedDateFormatter(dateString: data.updatedAt ?? "")
		screen.updatedRepositorieLabel.text = "Atualizado em \(dateString)"
	
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

extension RepositoriesCardCollectionViewCell: RepositoriesCardCollectionViewCellScreenProtocol {
	func tappedRepoButtonURL() {
		guard let url = URL(string: self.repoURL ?? "") else { return }
		
		UIApplication.shared.open(url)
	}
}
