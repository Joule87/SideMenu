//
//  MenuController.swift
//  SideMenu
//
//  Created by Julio Collado on 12/9/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    var tableView: UITableView!
    
    var delegate: MenuControllerDelegate?
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureTableView()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOptionTableViewCell.self, forCellReuseIdentifier: MenuOptionTableViewCell.identifier)
        
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        [tableView.leftAnchor.constraint(equalTo: view.leftAnchor), tableView.rightAnchor.constraint(equalTo: view.rightAnchor), tableView.topAnchor.constraint(equalTo: view.topAnchor), tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)].forEach{ $0.isActive = true}
        
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: MenuOptionTableViewCell.identifier) as! MenuOptionTableViewCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.iconImageView.image = menuOption?.image
        cell.descriptionLabel.text = menuOption?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menuOption = MenuOption(rawValue: indexPath.row) {
            delegate?.handleMenuOption(option: menuOption)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
