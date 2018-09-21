//
//  UserDefaultsViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/17.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    
    var textField:UITextField!
    var updateButton:UIButton!
    var removeButton:UIButton!
    var userDefaults:UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults = UserDefaults.standard
        
        addNavigationItem()
        addTextField()
        addUpdateButton()
        addRemoveButton()
    }

    
    
    func addNavigationItem(){
        self.title = "UserDefaults"
        let rightBarButtonItem = UIBarButtonItem(title: "显示", style: .plain, target: self, action: #selector(displayView))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    
    
    func addTextField(){
        textField = UITextField()
        textField.placeholder = "请输入信息"
        textField.borderStyle = .roundedRect
        
        if let setValue = userDefaults.object(forKey: "text") as? String {
            textField.text = setValue
        }
        
        view.addSubview(textField)
        addConstraints(child: textField, layoutGuide: self.view.safeAreaLayoutGuide)
    }
    
    
    func addUpdateButton(){
        updateButton = UIButton(type: .roundedRect);
        updateButton.setTitle("更新", for: .normal)
        updateButton.layer.borderWidth = 5
        updateButton.layer.borderColor = UIColor.red.cgColor
//        confirmButton.layer.masksToBounds = true
        updateButton.layer.cornerRadius = 10
        updateButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        updateButton.addTarget(self, action: #selector(updateLabelValue),for: .touchUpInside)
        view.addSubview(updateButton)
        addConstraints(child: updateButton, layoutGuide: textField.layoutMarginsGuide)
    }
    
    @objc func updateLabelValue(){
        let value = textField.text
        userDefaults.set(value, forKey: "text")
        userDefaults.synchronize()
    }
    
    
    
    
    
    
    func addRemoveButton(){
        removeButton = UIButton(type: .roundedRect);
        removeButton.setTitle("删除", for: .normal)
        removeButton.addTarget(self, action: #selector(removeLabelValue), for: .touchUpInside)
        view.addSubview(removeButton)
        addConstraints(child: removeButton, layoutGuide: updateButton.layoutMarginsGuide)
    }
    
    @objc func removeLabelValue(){
        textField.text = nil
        userDefaults.removeObject(forKey: "text")
    }
    
    
    func addConstraints(child:UIView,layoutGuide:UILayoutGuide){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            child.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 40)
            ])
    }
    
    
    @objc func displayView(){
        let dispaly = DisplayViewController()
        self.navigationController?.pushViewController(dispaly, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
