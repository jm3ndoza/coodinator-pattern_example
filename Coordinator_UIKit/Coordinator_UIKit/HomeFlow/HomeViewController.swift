//
//  HomeViewController.swift
//  Coordinator
//
//  Created by Jeremiah Mendoza on 16/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

	init() {
		super.init(nibName: nil, bundle: nil)
		
		title = "Home"
		tabBarItem.image = UIImage(systemName: "house")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor(named: "BackgroundColor")
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		
	}
}
