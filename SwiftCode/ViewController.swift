//
//  ViewController.swift
//  swift-11
//
//  Created by MLeo on 2018/8/27.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let center = NotificationCenter.default
        
        center.addObserver(self, selector: #selector(handleKeyboardWillShow), name:  NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
    }
    
    
    
    @objc func handleKeyboardWillShow(notification:Notification){
       let userInfo = notification.userInfo
        if let info  = userInfo{
            //动画持续的时间
            let animationDurationObject = info[UIKeyboardAnimationDurationUserInfoKey] as! NSValue
            //键盘动画结束时的 frame
            let keyboardEndRectObject = info[UIKeyboardFrameEndUserInfoKey] as! NSValue
            
            var animationDuration = 0.0
            var keyboardEndRect = CGRect.zero
            
            animationDurationObject.getValue(&animationDuration)
            keyboardEndRectObject.getValue(&keyboardEndRect)
            
            let window = UIApplication.shared.keyWindow
            
            //键盘在窗口的坐标
            keyboardEndRect = view.convert(keyboardEndRect, from: window)
            
            //键盘覆盖窗口的大小
            let intersectionOfKeyboardRectAndWindowRect = keyboardEndRect.intersection(self.view.frame)
            
            UIView.animate(withDuration: animationDuration, animations: {
                    self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: intersectionOfKeyboardRectAndWindowRect.height+5, right: 0)
                    self.scrollView.scrollRectToVisible(self.textField.frame, animated: false)
            })
        }
        
        
    }
    
    @objc func handleKeyboardWillHide(notification:Notification){
        
        let userInfo = notification.userInfo
        if let info = userInfo{
            let animationDuration = info[UIKeyboardAnimationDurationUserInfoKey] as! Double
            UIView.animate(withDuration: animationDuration, animations: {
                self.scrollView.contentInset = UIEdgeInsets.zero
            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

