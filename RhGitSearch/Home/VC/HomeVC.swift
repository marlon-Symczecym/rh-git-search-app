//
//  HomeVC.swift
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
		
		
		screen?.configDelegateTextField(delegate: self)
		screen?.delegate(delegate: self)
		screen?.searchTextField.text = "marlon-Symczecym"
		
		viewModel.delegate(delegate: self)
	}
}

extension HomeVC: HomeScreenProtocol {
	func tappedSearchButton() {
		if viewModel.validationTextField(textFieldText: screen?.searchTextField.text ?? "") {
			viewModel.fetchAllData(userName: screen?.searchTextField.text ?? "")
		} else {
			print("Disparar Alert...")
		}
	}
}

extension HomeVC: HomeViewModelProtocol {
	
	func sucess() {
		DispatchQueue.main.async {
			self.screen?.configProtocolsCollectionView(delegate: self, dataSource: self)
			self.screen?.repositoriesCollectionView.reloadData()
			self.screen?.searchTextField.text = ""
		}
		
	}
	
	func error(error: String) {
		print("ERROR -> \(error)")
	}
	
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		viewModel.numberOfItems
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if indexPath.row == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardUserCollectionViewCell.identifier, for: indexPath) as? CardUserCollectionViewCell
			
			cell?.setupCell(data: viewModel.getUser())
			
			return cell ?? UICollectionViewCell()
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoriesCollectionViewCell.identifier, for: indexPath) as? RepositoriesCollectionViewCell
			
			cell?.setupCell(userName: viewModel.getUser().login ?? "",publicRepo: viewModel.getPublicRepos())
			
			return cell ?? UICollectionViewCell()
		}
	}
		
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
	}
}

extension HomeVC: UITextFieldDelegate {
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print(screen?.searchTextField.text ?? "")
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
}
