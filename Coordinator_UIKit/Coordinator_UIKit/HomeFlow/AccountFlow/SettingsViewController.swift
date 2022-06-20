//
//  SettingsViewController.swift
//  Coordinator_UIKit
//
//  Created by Jeremiah Mendoza on 20/05/2022.
//

import UIKit

class SettingsViewController: UIViewController {

	var onLogoutAction: (() -> Void)?
	
	lazy var logoutButton: GenericButton = {
		let button = GenericButton(style: .secondary)
		button.setTitle("Logout", for: .normal)
		button.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 50)
		])
		
		return button
	}()
	
	lazy var body: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [Spacer(), logoutButton, Spacer()])
		stackView.axis = .vertical
		stackView.distribution = .equalCentering
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Settings"
		view.backgroundColor = UIColor(named: "BackgroundColor")
		
		view.addSubview(body)
		
		NSLayoutConstraint.activate([
			body.topAnchor.constraint(equalTo: view.topAnchor),
			body.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
			body.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
			body.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	@objc private func didTapLogout() {
		onLogoutAction?()
	}
}
