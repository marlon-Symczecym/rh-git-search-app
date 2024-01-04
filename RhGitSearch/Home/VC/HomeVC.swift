//
//  ViewController.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 02/01/24.
//

import UIKit

class HomeVC: UIViewController {
	
	private var screen: HomeScreen?
	private var viewModel: HomeViewModel = HomeViewModel()
	
	override func loadView() {
		screen = HomeScreen()
		
		view = screen
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		screen?.configProtocolsCollectionView(delegate: self, dataSource: self)
//		screen?.cardUserNameLabel.text = viewModel.configUserNameDoubleLine(userName: "marlon Symczecym")
	}
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if indexPath.row == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardUserCollectionViewCell.identifier, for: indexPath) as? CardUserCollectionViewCell
			
			return cell ?? UICollectionViewCell()
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoriesCollectionViewCell.identifier, for: indexPath) as? RepositoriesCollectionViewCell
			
			return cell ?? UICollectionViewCell()
		}
	}
		
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
	}
}
