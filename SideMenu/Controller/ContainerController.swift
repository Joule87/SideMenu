//
//  ContainerController.swift
//  SideMenu
//
//  Created by Julio Collado on 12/9/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var menuController: UIViewController?
    var navigationCenterController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        navigationCenterController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(navigationCenterController.view)
        addChild(navigationCenterController)
        navigationCenterController.didMove(toParent: self)
        
    }
    
    func configureMenuController() {
        if menuController != nil {
            return
        }
        menuController = MenuController()
        if let menuViewController = menuController {
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuController?.didMove(toParent: self)
        }
        
    }
    
    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.navigationCenterController.view.frame.origin.x = self.navigationCenterController.view.frame.width - 80
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.navigationCenterController.view.frame.origin.x =  0
            }, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        configureMenuController()
        
        if let menu = menuController as? MenuController {
            menu.isExpanded = !menu.isExpanded
            showMenuController(shouldExpand: menu.isExpanded)
        }
    }
    
}
