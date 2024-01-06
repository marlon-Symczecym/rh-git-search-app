//
//  CardUserCollectionViewCellScreen.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 03/01/24.
//

import UIKit

class CardUserCollectionViewCellScreen: UIView {
	
	lazy var cardUserRectangleView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .primaryDarkGreen
		view.clipsToBounds = true
		view.layer.cornerRadius = 20
		
		return view
	}()
	
	lazy var cardUserLayerImage: UIImageView = {
		let image = UIImageView()
		
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = .imageLayerCardUser
		image.contentMode = .scaleAspectFill
		
		return image
	}()
	
	lazy var cardUserNameLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Marlon \nSymczecym"
		label.textColor = .white
		label.font = UIFont.customFont(type: .medium, size: 20)
		label.textAlignment = .left
		label.numberOfLines = 2
		
		return label
	}()
	
	lazy var cardUserFollowersLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Seguidores:"
		label.textColor = .white
		label.font = UIFont.customFont(type: .regular, size: 14)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var cardUserFollowersNumberLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "76"
		label.textColor = .white
		label.font = UIFont.customFont(type: .bold, size: 14)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var cardUserFollowingLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Seguindo:"
		label.textColor = .white
		label.font = UIFont.customFont(type: .regular, size: 14)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var cardUserFollowingNumberLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "51"
		label.textColor = .white
		label.font = UIFont.customFont(type: .bold, size: 14)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var cardUserLocationLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Rio Negrinho, Santa Catarina, Brasil"
		label.textColor = .white
		label.font = UIFont.customFont(type: .regular, size: 14)
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var cardUserCircleAvatarView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		view.clipsToBounds = true
		view.layer.cornerRadius = 65
		
		return view
	}()
	
	lazy var cardUserAvatarImage: UIImageView = {
		let image = UIImageView()
		
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = .imageAvatar
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		image.layer.cornerRadius = 55
		
		return image
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
		addSubview(cardUserRectangleView)
		cardUserRectangleView.addSubview(cardUserLayerImage)
		cardUserRectangleView.addSubview(cardUserNameLabel)
		cardUserRectangleView.addSubview(cardUserFollowersLabel)
		cardUserRectangleView.addSubview(cardUserFollowersNumberLabel)
		cardUserRectangleView.addSubview(cardUserFollowingLabel)
		cardUserRectangleView.addSubview(cardUserFollowingNumberLabel)
		cardUserRectangleView.addSubview(cardUserLocationLabel)
		addSubview(cardUserCircleAvatarView)
		cardUserCircleAvatarView.addSubview(cardUserAvatarImage)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// cardUserRectangleView
			cardUserRectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
			cardUserRectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			cardUserRectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -39),
			cardUserRectangleView.heightAnchor.constraint(equalToConstant: 198),
			
			// cardUserLayerImage
			cardUserLayerImage.topAnchor.constraint(equalTo: cardUserRectangleView.topAnchor),
			cardUserLayerImage.leadingAnchor.constraint(equalTo: cardUserRectangleView.leadingAnchor),
			cardUserLayerImage.trailingAnchor.constraint(equalTo: cardUserRectangleView.trailingAnchor),
			cardUserLayerImage.bottomAnchor.constraint(equalTo: cardUserRectangleView.bottomAnchor),
			
			// cardUserNameLabel
			cardUserNameLabel.topAnchor.constraint(equalTo: cardUserRectangleView.topAnchor, constant: 10),
			cardUserNameLabel.leadingAnchor.constraint(equalTo: cardUserRectangleView.leadingAnchor, constant: 17),
			cardUserNameLabel.widthAnchor.constraint(equalToConstant: 180),
			
			// cardUserFollowersLabel
			cardUserFollowersLabel.topAnchor.constraint(equalTo: cardUserNameLabel.bottomAnchor, constant: 10),
			cardUserFollowersLabel.leadingAnchor.constraint(equalTo: cardUserNameLabel.leadingAnchor),
			
			// cardUserFollowersNumberLabel
			cardUserFollowersNumberLabel.topAnchor.constraint(equalTo: cardUserFollowersLabel.topAnchor),
			cardUserFollowersNumberLabel.leadingAnchor.constraint(equalTo: cardUserFollowersLabel.trailingAnchor, constant: 5),
			
			// cardUserFollowingLabel
			cardUserFollowingLabel.topAnchor.constraint(equalTo: cardUserFollowersLabel.bottomAnchor, constant: 1),
			cardUserFollowingLabel.leadingAnchor.constraint(equalTo: cardUserNameLabel.leadingAnchor),
			
			// cardUserFollowingNumberLabel
			cardUserFollowingNumberLabel.topAnchor.constraint(equalTo: cardUserFollowingLabel.topAnchor),
			cardUserFollowingNumberLabel.leadingAnchor.constraint(equalTo: cardUserFollowingLabel.trailingAnchor, constant: 5),
			
			// cardUserLocationLabel
			cardUserLocationLabel.leadingAnchor.constraint(equalTo: cardUserNameLabel.leadingAnchor),
			cardUserLocationLabel.bottomAnchor.constraint(equalTo: cardUserRectangleView.bottomAnchor, constant: -10),
			
			// cardUserCircleAvatarView
			cardUserCircleAvatarView.centerYAnchor.constraint(equalTo: cardUserRectangleView.centerYAnchor),
			cardUserCircleAvatarView.trailingAnchor.constraint(equalTo: cardUserRectangleView.trailingAnchor, constant: 20),
			cardUserCircleAvatarView.widthAnchor.constraint(equalToConstant: 130),
			cardUserCircleAvatarView.heightAnchor.constraint(equalToConstant: 130),
			
			// cardUserAvatarImage
			cardUserAvatarImage.centerXAnchor.constraint(equalTo: cardUserCircleAvatarView.centerXAnchor),
			cardUserAvatarImage.centerYAnchor.constraint(equalTo: cardUserCircleAvatarView.centerYAnchor),
			cardUserAvatarImage.widthAnchor.constraint(equalToConstant: 110),
			cardUserAvatarImage.heightAnchor.constraint(equalToConstant: 110),
		])
	}
	
}
