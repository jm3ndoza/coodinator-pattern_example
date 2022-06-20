//
//  LoginViewController.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 16/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

	enum LoginAction {
		case dismissed
		case loginSuccess
	}
	
	var onFinished: ((LoginAction) -> Void)?
	
	lazy var loginButton: GenericButton = {
		let button = GenericButton(style: .primary)
		button.setTitle("Login", for: .normal)
		button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 50)
		])
		
		return button
	}()
	
	lazy var body: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [Spacer(), loginButton, Spacer()])
		stackView.axis = .vertical
		stackView.distribution = .equalCentering
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(named: "BackgroundColor")
		
		view.addSubview(body)
		
		NSLayoutConstraint.activate([
			body.topAnchor.constraint(equalTo: view.topAnchor),
			body.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
			body.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
			body.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		onFinished?(.dismissed)
	}
	
	deinit {
		print(Self.self)
	}
	
	@objc private func didTapLogin() {
		onFinished?(.loginSuccess)
	}
}
