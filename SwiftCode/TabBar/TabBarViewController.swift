//
//  TabBarViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/12.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    func addTabBar(){
        let one = OneTabBarViewController()
        one.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 100)
        let two = TwoTabBarViewController()
        two.tabBarItem = UITabBarItem(title: "Two", image: nil, tag: 200)
        self.viewControllers = [one,two]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        addTabBar()
        
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
