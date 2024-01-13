//
//  RepositoriesCollectionViewCell.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import UIKit

class RepositoriesCollectionViewCell: UICollectionViewCell {
	
	static var identifier: String = "RepositoriesCollectionViewCell"
	private var screen: RepositoriesCollectionViewCellScreen = RepositoriesCollectionViewCellScreen()
	private var viewModel: RepositoriesCardCollectionViewCellViewModel = RepositoriesCardCollectionViewCellViewModel()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
				
		viewModel.delegate(delegate: self)
		
		configScreen()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setupCell(reposURL: String, publicRepo: Int) {
		screen.repositoriesCountLabel.text = String(publicRepo)
		viewModel.fetchAllData(reposURL: reposURL)
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

extension RepositoriesCollectionViewCell: RepositoriesCardCollectionViewCellViewModelProtocol {
	func success() {
		DispatchQueue.main.async {
			self.screen.cardRepositoriesCollectionView.contentOffset.y = 0
			self.screen.configProtocolsCollectionView(delegate: self, dataSource: self)
			self.screen.cardRepositoriesCollectionView.reloadData()
		}
	}
	
	func error(error: String) {
		print("ERROR: -> \(#function)")
	}
}

extension RepositoriesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberForItems
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoriesCardCollectionViewCell.identifier, for: indexPath) as? RepositoriesCardCollectionViewCell
		
		cell?.setupCell(data: viewModel.getRepos(indexPath: indexPath))
		
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: collectionView.frame.width, height: 165)
	}
}
