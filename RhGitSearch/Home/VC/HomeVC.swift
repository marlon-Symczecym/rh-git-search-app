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
	private var alert: CustomAlert?
	
	override func loadView() {
		screen = HomeScreen()
		
		view = screen
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		alert = CustomAlert(controller: self)
		
		screen?.configDelegateTextField(delegate: self)
		screen?.delegate(delegate: self)
		
		screen?.searchTextField.text = "Marlon Symczecym"
		
		viewModel.delegate(delegate: self)
	}
}

extension HomeVC: HomeScreenProtocol {
	func tappedSearchButton() {
			let userName = viewModel.removeSpaceTextField(textField: screen?.searchTextField.text ?? "")
			viewModel.fetchAllData(userName: userName)
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
		DispatchQueue.main.async {
			self.alert?.simpleAlert(title: "ATENÇÃO", message: "Usuário não encontrado")
			self.screen?.searchTextField.text = ""
		}
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
			
			cell?.setupCell(reposURL: viewModel.getUser().reposURL ?? "",publicRepo: viewModel.getPublicRepos())
			
			return cell ?? UICollectionViewCell()
		}
	}
		
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
	}
}

extension HomeVC: UITextFieldDelegate {
	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if viewModel.completeValidationTextField(textField: screen?.searchTextField.text ?? "") {
			screen?.searchButton.backgroundColor = .detailYellow
			screen?.searchButton.isEnabled = true
		} else {
			screen?.searchButton.backgroundColor = .detailYellow.withAlphaComponent(0.7)
			screen?.searchButton.isEnabled = false
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
}
