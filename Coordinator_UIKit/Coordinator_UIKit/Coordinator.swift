//
//  Coordinator.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 16/05/2022.
//

import Foundation
import UIKit

protocol Coordinator {
	var onCoordinatorFinish: (() -> Void)? { get set }
	
	var rootCoordinator: UINavigationController? { get }
	
	@discardableResult func start() -> UINavigationController
}

protocol ChildCoordinator {
	var onCoordinatorFinish: (() -> Void)? { get set }
	
	var parentCoordinator: UINavigationController? { get }
	
	init(parentCoordinator: UINavigationController?)
}
