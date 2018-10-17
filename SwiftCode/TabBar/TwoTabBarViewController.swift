//
//  TwoTabBarViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/12.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class TwoTabBarViewController: UIViewController {

    
    var button:UIButton!
    
    func addButton(){
        button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        addButtonConstraint(child: button, parent: nil)
    }
    
    func addButtonConstraint(child:UIView,parent:UIView?){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            child.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
    }
    
    
    @objc func closeView(){
        self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        addButton()
        // Do any additional setup after loading the view.
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
