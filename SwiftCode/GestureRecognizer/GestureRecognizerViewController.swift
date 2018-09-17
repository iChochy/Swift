//
//  GestureRecognizerViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/14.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class GestureRecognizerViewController: UIViewController {

    
    var moveView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addMoveView()
    }
    
    
    
    func addPanGestureRecognizer(child:UIView){
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
        child.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @objc func pan(_ recognizer:UIPanGestureRecognizer){
        print(recognizer)
        let point = recognizer.location(in: self.view)
        moveView.center = point
        
    }
    
    
    func addMoveView(){
        moveView = UIView()
        moveView.backgroundColor = UIColor.blue
        self.view.addSubview(moveView)
        addPanGestureRecognizer(child: moveView)
        addMoveViewConstraint(child: moveView)
        
    }
    
    func addMoveViewConstraint(child:UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                child.widthAnchor.constraint(equalToConstant: 50),
                child.heightAnchor.constraint(equalToConstant: 50),
                child.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                child.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
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
