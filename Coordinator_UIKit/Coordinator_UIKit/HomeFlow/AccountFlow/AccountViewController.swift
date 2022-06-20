//
//  AccountViewController.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 18/05/2022.
//

import UIKit

class AccountViewController: UIViewController {
	
	var onSettingsAction: (() -> Void)?

	lazy var settingsButton: GenericButton = {
		let button = GenericButton(style: .secondary)
		button.setTitle("Settings", for: .normal)
		button.addTarget(self, action: #selector(didTapSettings), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 50),
			button.widthAnchor.constraint(equalToConstant: 200)
		])
		
		return button
	}()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		
		title = "Account"
		tabBarItem.image = UIImage(systemName: "person.crop.circle")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor(named: "BackgroundColor")
		
		view.addSubview(settingsButton)
		
		NSLayoutConstraint.activate([
			settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
    }
	
	@objc private func didTapSettings() {
		onSettingsAction?()
	}
}
