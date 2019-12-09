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
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return (menuController as? MenuController)?.isExpanded ?? false
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
        if let menuViewController = menuController as? MenuController {
            menuViewController.delegate = self
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuController?.didMove(toParent: self)
        }
        
    }
    
    func showMenuController(shouldExpand: Bool, for menuOption: MenuOption? = nil) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.navigationCenterController.view.frame.origin.x = self.navigationCenterController.view.frame.width - 80
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.navigationCenterController.view.frame.origin.x =  0
            }) { (_) in
                if let option = menuOption {
                    self.didSelectOptionMenu(option)
                }
            }
        }
        animateStatusBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ContainerController: HomeControllerDelegate {
    private func handleMenuControllerExpansion(menuOption: MenuOption? = nil) {
        if let menu = menuController as? MenuController {
            menu.isExpanded = !menu.isExpanded
            showMenuController(shouldExpand: menu.isExpanded, for: menuOption)
        }
    }
    
    func handleMenuToggle() {
        configureMenuController()
        handleMenuControllerExpansion()
    }
    
}

extension ContainerController: MenuControllerDelegate {
    
    func handleMenuOption(option: MenuOption) {
        handleMenuControllerExpansion(menuOption: option)
    }
    
    func didSelectOptionMenu(_ option: MenuOption) {
        switch option {
        case .Profile:
            let profile = ProfileViewController()
            present(UINavigationController(rootViewController: profile), animated: true, completion: nil)
        case .Inbox:
            let inbox = InboxViewController()
            present(UINavigationController(rootViewController: inbox), animated: true, completion: nil)
        case .Notifications:
            let notifications = NotificationsViewController()
            present(UINavigationController(rootViewController: notifications), animated: true, completion: nil)
        case .Settings:
            let settings = SettingsViewController()
            present(UINavigationController(rootViewController: settings), animated: true, completion: nil)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}
