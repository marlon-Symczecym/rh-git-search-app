//
//  RepositoriesCollectionViewCellScreen.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//  RepositoriesCount

import UIKit

class RepositoriesCollectionViewCellScreen: UIView {
	
	lazy var repositoriesLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Repositórios:"
		label.textColor = .darkGray
		label.font = UIFont.customFont(type: .extraBold, size: 20)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var repositoriesCountLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.customFont(type: .extraBold, size: 20)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var cardRepositoriesCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.backgroundColor = .clear
		cv.showsVerticalScrollIndicator = false

		cv.register(RepositoriesCardCollectionViewCell.self, forCellWithReuseIdentifier: RepositoriesCardCollectionViewCell.identifier)
		
		return cv
	}()
	
	public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
		cardRepositoriesCollectionView.delegate = delegate
		cardRepositoriesCollectionView.dataSource = dataSource
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(repositoriesLabel)
		addSubview(repositoriesCountLabel)
		addSubview(cardRepositoriesCollectionView)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// repositoriesLabel
			repositoriesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
			repositoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			repositoriesLabel.widthAnchor.constraint(equalToConstant: 132),
			
			// repositoriesCountLabel
			repositoriesCountLabel.topAnchor.constraint(equalTo: repositoriesLabel.topAnchor),
			repositoriesCountLabel.leadingAnchor.constraint(equalTo: repositoriesLabel.trailingAnchor, constant: 5),
			repositoriesCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			
			// cardRepositoriesCollectionView
			cardRepositoriesCollectionView.topAnchor.constraint(equalTo: repositoriesLabel.bottomAnchor, constant: 25),
			cardRepositoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			cardRepositoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			cardRepositoriesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
}
