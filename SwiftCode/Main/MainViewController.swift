//
//  UIKitViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/25.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var tableViewGroups:[TableViewGroup]?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = tableViewGroups![indexPath.section].details[indexPath.row]
        let viewController = viewControllerFactory(key: detail.key)
        viewController.title = detail.title
        self.show(viewController, sender: nil)
//         self.present(defaultView, animated: true, completion: nil)
    }
    
    
    
    
    func viewControllerFactory(key:String) -> UIViewController {
        var viewController:UIViewController
        switch key {
        case "UIViewController":
            viewController = DefaultViewController()
        case "UINavigationController":
            viewController = UINavigationController(rootViewController: NavigationController())
        case "UITabBarController":
            viewController = TabBarViewController()
        case "UIGestureRecognizer":
            viewController = GestureRecognizerViewController()
        case "UserDefaults":
            viewController = UserDefaultsViewController()
        case "SQLite":
            viewController = SQLiteViewController()
        case "CoreData":
            viewController = CoreDataViewController()
        default:
            viewController = DefaultViewController()
        }
        return viewController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewGroups![section].details.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell:CustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        cell!.accessoryType = .detailButton
        cell!.detailLabel.numberOfLines = 0

        let group = tableViewGroups![indexPath.section]
        let details = group.details
        let detail = details[indexPath.row]
        let createDate = detail.createDate
        let defaultImage = UIImage(named: "Image")
        let image = UIImage(named: detail.imageName)
        
        cell!.titleLabel.text = detail.title
        cell!.detailLabel.text = detail.detail
        cell!.dateLabel.text = Utils.dateFormatter.string(from: createDate)
        cell!.customImageView.image = Utils.imageResetSize(image: image ?? defaultImage!,size:100)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewGroups![section].groupName
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewGroups!.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "功能列表"
        addTableView()
        // Do any additional setup after loading the view.
    }
    
    
    func addTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.sectionHeaderHeight = 50
        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
//        self.view.addSubview(tableView)
//        addTableViewConstraints(child: tableView, layoutGuide: self.view.safeAreaLayoutGuide)
    }
    
    func addTableViewConstraints(child:UIView,layoutGuide:UILayoutGuide){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            child.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            child.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
            
            ])
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
