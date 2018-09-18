//
//  DisplayViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/17.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    
    var labelValue:String!
    
    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "信息"
        getLabelValue()
        addLabel()
    }

    
    func addLabel(){
        label = UILabel();
        label.text = labelValue
        label.backgroundColor = UIColor.brown
        label.textAlignment = .center
        self.view.addSubview(label)
        addConstraint()
    }
    
    
    func getLabelValue(){
        let userDefaults = UserDefaults.standard
        if let value =  userDefaults.object(forKey: "text") as? String{
            labelValue = value
        }
    }
    
    func addConstraint(){
        label.translatesAutoresizingMaskIntoConstraints = false
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide;
        
        NSLayoutConstraint.activate(
            [
                label.heightAnchor.constraint(equalToConstant: 50),
                label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
            ]
        
        )
       
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
