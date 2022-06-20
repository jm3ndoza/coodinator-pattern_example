//
//  AccountFlowCoordinator.swift
//  Coordinator_UIKit
//
//  Created by Jeremiah Mendoza on 20/05/2022.
//

import Foundation
import UIKit

class AccountFlowCoordinator: Coordinator {
	
	var onCoordinatorFinish: (() -> Void)?
	
	lazy var accountViewController: AccountViewController = {
		let vc = AccountViewController()
		vc.onSettingsAction = { [weak self]  in
			self?.presentSettings()
		}
		return vc
	}()
	
	lazy var settingsViewController: SettingsViewController = {
		let vc = SettingsViewController()
		vc.onLogoutAction = { [weak self] in
			self?.rootCoordinator?.popToRootViewController(animated: false)
			self?.popToRoot()
		}
		return vc
	}()
	
	private(set) var rootCoordinator: UINavigationController?
	
	func start() -> UINavigationController {
		let nc = NavigationController(rootViewController: accountViewController)
		nc.popToRootViewController(animated: true)
		rootCoordinator = nc
		return nc
	}
	
	private func presentSettings() {
		rootCoordinator?.pushViewController(settingsViewController, animated: true)
	}
	
	private func popToRoot() {
		rootCoordinator?.dismiss(animated: true) {
			self.onCoordinatorFinish?()
		}
	}
}
