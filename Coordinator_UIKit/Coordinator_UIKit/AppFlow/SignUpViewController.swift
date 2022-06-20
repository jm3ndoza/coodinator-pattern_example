//
//  SignUpViewController.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 16/05/2022.
//

import UIKit



class SignUpViewController: UIViewController {
	
	enum SignUpAction {
		case dismissed
		case signUpSuccess
	}
	
	var onFinished: ((SignUpAction) -> Void)?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor(named: "BackgroundColor")
    }
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		self.onFinished?(.dismissed)
	}
	
	deinit {
		print(Self.self)
	}
}
