//
//  RepositoriesCardCollectionViewCellScreen.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 04/01/24.
//

import UIKit

class RepositoriesCardCollectionViewCellScreen: UIView {
	
	lazy var cardRepositoriesRectangleView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		view.clipsToBounds = true
		view.layer.cornerRadius = 15
		
		return view
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.customFont(type: .bold, size: 20)
		label.textAlignment = .left
		label.numberOfLines = 1
		
		return label
	}()
	
	lazy var describeLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .mediumGray
		label.font = UIFont.customFont(type: .regular, size: 14)
		label.textAlignment = .justified
		label.numberOfLines = 3
		
		return label
	}()
	
	lazy var languageLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .detailBlue
		label.font = UIFont.customFont(type: .medium, size: 12)
		
		return label
	}()
	
	lazy var updatedRepositorieLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.customFont(type: .bold, size: 12)
		label.textAlignment = .left
		label.numberOfLines = 1
		
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
		addSubview(cardRepositoriesRectangleView)
		cardRepositoriesRectangleView.addSubview(titleLabel)
		cardRepositoriesRectangleView.addSubview(describeLabel)
		cardRepositoriesRectangleView.addSubview(languageLabel)
		cardRepositoriesRectangleView.addSubview(updatedRepositorieLabel)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// cardRepositoriesRectangleView
			cardRepositoriesRectangleView.topAnchor.constraint(equalTo: topAnchor),
			cardRepositoriesRectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			cardRepositoriesRectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			cardRepositoriesRectangleView.heightAnchor.constraint(equalToConstant: 155),
			
			// titleLabel
			titleLabel.topAnchor.constraint(equalTo: cardRepositoriesRectangleView.topAnchor, constant: 20),
			titleLabel.leadingAnchor.constraint(equalTo: cardRepositoriesRectangleView.leadingAnchor, constant: 20),
			titleLabel.trailingAnchor.constraint(equalTo: cardRepositoriesRectangleView.trailingAnchor, constant: -20),
			
			// describeLabel
			describeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			describeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			describeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			
			// languageLabel
			languageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			languageLabel.bottomAnchor.constraint(equalTo: cardRepositoriesRectangleView.bottomAnchor, constant: -20),
			
			// updatedRepositorieLabel
			updatedRepositorieLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			updatedRepositorieLabel.bottomAnchor.constraint(equalTo: languageLabel.bottomAnchor),
		])
	}
	
}
