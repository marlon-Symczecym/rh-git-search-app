//
//  CardUserCollectionViewCell.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import Foundation
import UIKit

class CardUserCollectionViewCell: UICollectionViewCell {
	
	static var identifier: String = "CardUserCollectionViewCell"
	
	private var screen: CardUserCollectionViewCellScreen = CardUserCollectionViewCellScreen()
	private var viewModel: CardUserCollectionViewCellViewModel = CardUserCollectionViewCellViewModel()
	
	private var userURL: String?
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		screen.delegate(delegate: self)
		
		configScreen()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setupCell(data: User) {
		screen.cardUserNameLabel.text = viewModel.configUserNameDoubleLine(userName: data.name ?? "")
		screen.cardUserFollowersNumberLabel.text = String(data.followers  ?? 0)
		screen.cardUserFollowingNumberLabel.text = String(data.following ?? 0)
		screen.cardUserLocationLabel.text = data.location
		screen.cardUserAvatarImage.loadImageFromRemoteURL(url: data.avatarURL ?? "")
		userURL = data.htmlURL ?? ""
	}
	
	private func configScreen() {
		contentView.addSubview(screen)
		screen.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			screen.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			screen.leadingAnchor.constraint(equalTo: leadingAnchor),
			screen.trailingAnchor.constraint(equalTo: trailingAnchor),
			screen.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
		])
	}
}

extension CardUserCollectionViewCell: CardUserCollectionViewCellScreenProtocol {
	func tappedCardUserSeeMoreButton() {
		guard let url = URL(string: userURL ?? "") else { return }
		UIApplication.shared.open(url)
	}
}
