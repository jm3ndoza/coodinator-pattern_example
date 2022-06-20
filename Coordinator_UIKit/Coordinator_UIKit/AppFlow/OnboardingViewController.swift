//
//  OnboardingViewController.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 16/05/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
	
	var onSignUpAction: (() -> Void)?
	var onLoginAction: (() -> Void)?

	lazy var signUpButton: GenericButton = {
		let button = GenericButton(style: .secondary)
		button.setTitle("Sign Up", for: .normal)
		button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 50)
		])
		
		return button
	}()
	
	lazy var loginButton: GenericButton = {
		let button = GenericButton(style: .primary)
		button.setTitle("Login", for: .normal)
		button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 50),
		])
		
		return button
	}()
	
	lazy var buttonsStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [signUpButton, Spacer(height: 20), loginButton])
		stackView.axis = .vertical
		stackView.distribution = .fill
		return stackView
	}()
	
	lazy var body: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [Spacer(), buttonsStackView, Spacer()])
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
	
	@objc private func didTapSignUp() {
		onSignUpAction?()
	}
	
	@objc private func didTapLogin() {
		onLoginAction?()
	}
}
