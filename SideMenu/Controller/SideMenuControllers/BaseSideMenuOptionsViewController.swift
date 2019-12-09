//
//  BaseSideMenuOptionsViewController.swift
//  SideMenu
//
//  Created by Julio Collado on 12/9/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class BaseSideMenuOptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        let clearImage = #imageLiteral(resourceName: "clear")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: clearImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
    @objc private func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    


}
