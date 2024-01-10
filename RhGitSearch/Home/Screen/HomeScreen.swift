//
//  HomeScreen.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 02/01/24.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
	func tappedSearchButton(sender: UIButton)
}

class HomeScreen: UIView {
	
	private weak var delegate: HomeScreenProtocol?
	
	public func delegate(delegate: HomeScreenProtocol?) {
		self.delegate = delegate
	}
	
	lazy var titleHeaderLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "RH Git Search"
		label.textColor = .white
		label.font = UIFont.customFont(type: .bold, size: 24)
		label.textAlignment = .center
		
		return label
	}()
	
	lazy var imageLayerTopUIImage: UIImageView = {
		let image = UIImageView()
		
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = .imageLayerTop
		image.contentMode = .scaleAspectFill
		
		return image
	}()
	
	lazy var textFieldRectangleView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		view.clipsToBounds = true
		view.layer.cornerRadius = 15
		
		return view
	}()
	
	lazy var iconMaggnifierImage: UIImageView = {
		let image = UIImageView()
		
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
		image.tintColor = .primaryLightGreen
		image.contentMode = .scaleAspectFill
		
		return image
	}()
	
	lazy var searchTextField: UITextField = {
		let tf = UITextField()
		
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.keyboardType = .default
		tf.setPlaceholderColor(placeholder: "Digite o nome do usuário...", color: .mediumGray)
		tf.font = UIFont.customFont(type: .regular, size: 14)
		tf.textColor = .mediumGray
		tf.textAlignment = .left
		tf.backgroundColor = .clear
		
		return tf
	}()
	
	lazy var searchButton: UIButton = {
		let button = UIButton()
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Buscar", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.customFont(type: .bold, size: 18)
		button.backgroundColor = .detailYellow.withAlphaComponent(0.7)
		button.clipsToBounds = true
		button.layer.cornerRadius = 8
		button.isEnabled = false
		button.addTarget(self, action: #selector(tappedSearchButton(sender:)), for: .touchUpInside)
		
		return button
	}()
	
	@objc func tappedSearchButton(sender: UIButton) {
		self.delegate?.tappedSearchButton(sender: sender)
	}
	
	lazy var repositoriesCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.backgroundColor = .lightGray
		cv.clipsToBounds = true
		cv.roundCorners(cornerRadiuns: 40, typeCorners: [.topLeft, .topRight])
		cv.showsVerticalScrollIndicator = false
		
		cv.register(CardUserCollectionViewCell.self, forCellWithReuseIdentifier: CardUserCollectionViewCell.identifier)
		cv.register(RepositoriesCollectionViewCell.self, forCellWithReuseIdentifier: RepositoriesCollectionViewCell.identifier)
		
		return cv
	}()
	
	public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
		repositoriesCollectionView.delegate = delegate
		repositoriesCollectionView.dataSource = dataSource
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .primaryLightGreen
		
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(titleHeaderLabel)
		addSubview(imageLayerTopUIImage)
		
		addSubview(textFieldRectangleView)
		textFieldRectangleView.addSubview(iconMaggnifierImage)
		textFieldRectangleView.addSubview(searchTextField)
		
		addSubview(searchButton)
		
		addSubview(repositoriesCollectionView)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// titleHeaderLabel
			titleHeaderLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			titleHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
			titleHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
			
			// imageLayerTopUIImage
			imageLayerTopUIImage.topAnchor.constraint(equalTo: titleHeaderLabel.bottomAnchor, constant: 20),
			imageLayerTopUIImage.centerXAnchor.constraint(equalTo: centerXAnchor),
			imageLayerTopUIImage.widthAnchor.constraint(equalToConstant: 393),
			imageLayerTopUIImage.heightAnchor.constraint(equalToConstant: 279),
			
			// textFieldRectangleView
			textFieldRectangleView.topAnchor.constraint(equalTo: imageLayerTopUIImage.topAnchor, constant: 44),
			textFieldRectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			textFieldRectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			textFieldRectangleView.heightAnchor.constraint(equalToConstant: 60),
			
			// iconMaggnifierUIImage
			iconMaggnifierImage.centerYAnchor.constraint(equalTo: textFieldRectangleView.centerYAnchor),
			iconMaggnifierImage.leadingAnchor.constraint(equalTo: textFieldRectangleView.leadingAnchor, constant: 15),
			iconMaggnifierImage.widthAnchor.constraint(equalToConstant: 30),
			iconMaggnifierImage.heightAnchor.constraint(equalToConstant: 30),
			
			// searchTextField
			searchTextField.centerYAnchor.constraint(equalTo: textFieldRectangleView.centerYAnchor),
			searchTextField.leadingAnchor.constraint(equalTo: iconMaggnifierImage.trailingAnchor, constant: 15),
			searchTextField.trailingAnchor.constraint(equalTo: textFieldRectangleView.trailingAnchor, constant: -15),
			
			// searchButton
			searchButton.topAnchor.constraint(equalTo: textFieldRectangleView.bottomAnchor, constant: 20),
			searchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			searchButton.widthAnchor.constraint(equalToConstant: 150),
			searchButton.heightAnchor.constraint(equalToConstant: 50),
			
			// repositoriesCollectionView
			repositoriesCollectionView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 30),
			repositoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			repositoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			repositoriesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
	
	func configDelegateTextField(delegate: UITextFieldDelegate) {
		self.searchTextField.delegate = delegate
	}
}
