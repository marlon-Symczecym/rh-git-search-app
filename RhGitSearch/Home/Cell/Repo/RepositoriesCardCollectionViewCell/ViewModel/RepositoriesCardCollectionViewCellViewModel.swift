//
//  RepositoriesCardCollectionViewCellViewModel.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 05/01/24.
//

import Foundation

protocol RepositoriesCardCollectionViewCellViewModelProtocol: AnyObject {
	func success()
	func error(error: String)
}

class RepositoriesCardCollectionViewCellViewModel {
	
	private var service: RepoService = RepoService()
	private weak var delegate: RepositoriesCardCollectionViewCellViewModelProtocol?
	
	private var repos = [Repo]()
	
	public func delegate(delegate: RepositoriesCardCollectionViewCellViewModelProtocol?) {
		self.delegate = delegate
	}
	
	public func getRepos(indexPath: IndexPath)-> Repo {
		return repos[indexPath.row]
	}
	
	public var numberForItems: Int {
		return repos.count
	}
	
	public func fetchAllData(userName: String) {
		service.reposGetDataJsonURLSession(userName: userName) { repoData, error in
			if error == nil {
				self.repos = repoData ?? []
				self.delegate?.success()
			} else {
				self.delegate?.error(error: error?.localizedDescription ?? "")
			}
		}
	}
}
