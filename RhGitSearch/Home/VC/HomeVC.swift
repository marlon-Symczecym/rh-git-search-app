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
	private var loading: CustomLoading?
	
	override func loadView() {
		screen = HomeScreen()
		
		view = screen
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		alert = CustomAlert(controller: self)
		loading = CustomLoading(controller: self)
		
		screen?.configDelegateTextField(delegate: self)
		screen?.delegate(delegate: self)
		
		screen?.searchTextField.text = "Marlon Symczecym"
		
		Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
			CustomAnimations.magnifierAnimation(viewToAnimate: self.screen?.iconMaggnifierImage ?? UIView())
		}
		
		viewModel.delegate(delegate: self)
	}
	
	public func disabledButton(button: UIButton) {
		button.isEnabled = false
		button.backgroundColor = .detailYellow.withAlphaComponent(0.7)
	}
	
	public func enabledButton(button: UIButton) {
		button.isEnabled = true
		button.backgroundColor = .detailYellow
	}
}

extension HomeVC: HomeScreenProtocol {
	func tappedSearchButton(sender: UIButton) {
		CustomAnimations.searchButtonAnimationTapped(viewToAnimate: sender)
		screen?.searchTextField.resignFirstResponder()
		loading?.start()
		
		let userName = viewModel.removeSpaceTextField(textField: screen?.searchTextField.text ?? "")
		viewModel.fetchAllData(userName: userName)
	}
}

extension HomeVC: HomeViewModelProtocol {
	
	func sucess() {
		DispatchQueue.main.async {
			self.loading?.stop()
			
			self.screen?.configProtocolsCollectionView(delegate: self, dataSource: self)
			self.screen?.repositoriesCollectionView.reloadData()
			self.screen?.searchTextField.text = ""
			self.disabledButton(button: self.screen?.searchButton ?? UIButton())
		}
	}
	
	func error(error: String) {
		DispatchQueue.main.async {
			self.loading?.stop()
			
			self.alert?.simpleAlert(title: "ATENÇÃO", message: "Usuário não encontrado")
			self.screen?.searchTextField.text = ""
			
			self.disabledButton(button: self.screen?.searchButton ?? UIButton())
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
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			CustomAnimations.cardRepositoriesAnimation(viewToAnimate: cell)
		}
	}
		
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
	}
}

extension HomeVC: UITextFieldDelegate {
	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if viewModel.completeValidationTextField(textField: screen?.searchTextField.text ?? "") {
			self.enabledButton(button: self.screen?.searchButton ?? UIButton())
		} else {
			self.disabledButton(button: self.screen?.searchButton ?? UIButton())
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
}
