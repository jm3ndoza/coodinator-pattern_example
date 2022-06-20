//
//  AppFlowCoordinator.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 16/05/2022.
//

import Foundation
import UIKit

class AppFlowCoordinator: Coordinator {
	
	var onCoordinatorFinish: (() -> Void)?
	
	private(set) var rootCoordinator: UINavigationController?
	
	lazy var onboardingViewController: OnboardingViewController = {
		let vc = OnboardingViewController()
		vc.onLoginAction = { self.showLogin() }
		vc.onSignUpAction = { self.showSignUp() }
		return vc
	}()
	
	private var signUpViewController: SignUpViewController?
	private var loginViewController: LoginViewController?
	private var homeFlow: HomeFlowCoordinator?
	
	func start() -> UINavigationController {
		let navigationController = NavigationController(rootViewController: onboardingViewController)
		rootCoordinator = navigationController
		return navigationController
	}
	
	func showSignUp() {
		let vc = SignUpViewController()
		vc.onFinished = { [weak self] in
			switch $0 {
			case .signUpSuccess:
				self?.rootCoordinator?.popToRootViewController(animated: false)
				self?.showHomeFlow()
			case .dismissed:
				break
			}
			
			self?.signUpViewController = nil
		}
		
		self.signUpViewController = vc
		rootCoordinator?.pushViewController(vc, animated: true)
	}
	
	func showLogin() {
		let vc = LoginViewController()
		vc.onFinished = { [weak self] in
			switch $0 {
			case .loginSuccess:
				self?.rootCoordinator?.popToRootViewController(animated: false)
				self?.showHomeFlow()
			case .dismissed:
				break
			}
			self?.loginViewController = nil
		}
		
		self.loginViewController = vc
		rootCoordinator?.pushViewController(vc, animated: true)
	}
	
	func showHomeFlow() {
		let flow = HomeFlowCoordinator(parentCoordinator: rootCoordinator)
		flow.onCoordinatorFinish  = { [weak self] in self?.homeFlow = nil }
		
		self.homeFlow = flow
		rootCoordinator?.present(flow.start(), animated: true)
	}
}
