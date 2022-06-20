//
//  HomeFlowCoordinator.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 18/05/2022.
//

import Foundation
import UIKit

class HomeFlowCoordinator: ChildCoordinator {
	
	var onCoordinatorFinish: (() -> Void)?
	
	lazy var homeViewController: HomeViewController = {
		let vc = HomeViewController()
		return vc
	}()
	
	lazy var accountFlow: AccountFlowCoordinator = {
		let flow = AccountFlowCoordinator()
		flow.onCoordinatorFinish = { [weak self] in
			self?.onCoordinatorFinish?()
		}
		return flow
	}()
	
	lazy var tabBarController: HomeTabBarController = {
		let tabBarController = HomeTabBarController()
		
		tabBarController.viewControllers = [
			homeViewController,
			accountFlow.start()
		]
		
		return tabBarController
	}()
	
	var parentCoordinator: UINavigationController?
	
	required init(parentCoordinator: UINavigationController?) {
		self.parentCoordinator = parentCoordinator
	}
	
	deinit {
		print(Self.self)
	}
	
	func start() -> UIViewController {
		tabBarController.selectedIndex = 0
		return tabBarController
	}
}
