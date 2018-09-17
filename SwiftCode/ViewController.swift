//
//  ViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/11.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class  ViewController: UIViewController,UIPickerViewDataSource ,UIPickerViewDelegate {
    
    
    let pickerData =
        [
        "UIViewController 跳转",
        "UINavigationController 跳转",
        "UITabBarController 跳转",
        "UIGestureRecognizer 手势"
    ]
    
    
    var picker:UIPickerView!
    var button:UIButton!
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    
    override func loadView() {
        self.view = UIView()
        view.backgroundColor = UIColor.white
        addPickerView()
        addButton()
    }
    
    
    
    func addPickerView(){
        picker = UIPickerView()
        picker.center = view.center
        view.addSubview(picker)
        picker.delegate = self
        addPickerConstraint(child: picker, parent: nil)
        
    }
    
    func addPickerConstraint(child:UIView,parent:UIView?){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                child.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                child.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])
    }
    
    
    func addButton(){
        button = UIButton(type: .system)
        button.setTitle("GO", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        addButtonConstraint(child: button, parent: picker)
    }
    

    @objc func touchButton(){
        let row = picker.selectedRow(inComponent: 0)
        switch row {
        case 0:
            let defaultView = DefaultViewController()
            defaultView.loadValue = "default"
            self.present(defaultView, animated: true, completion: nil)
        case 1:
            self.present(UINavigationController(rootViewController: NavigationController()), animated: true, completion: nil)
        case 2:
            self.present(TabBarViewController(), animated: true, completion: nil)
        case 3:
            self.present(GestureRecognizerViewController(), animated: true, completion: nil)
        default:
            print("default")
        }
    }
    
    
    func addButtonConstraint(child:UIView,parent:UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.topAnchor.constraint(equalTo: parent.bottomAnchor)
            ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
