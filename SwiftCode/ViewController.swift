//
//  ViewController.swift
//  swift-11
//
//  Created by MLeo on 2018/8/27.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit


extension URLSessionTask{
    func start(){
        self.resume()
    }
}

class ViewController: UIViewController,URLSessionDelegate,URLSessionDataDelegate {
    
    var session:URLSession!
    
    convenience init() {
        
        self.init(nibName: nil, bundle: nil)
        
        let configuration = URLSessionConfiguration.default
        
        configuration.timeoutIntervalForRequest = 15
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    
    
    func displayAlertWithTitle(title:String,message:String){
        let controller  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    

    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        session.finishTasksAndInvalidate()
        DispatchQueue.main.async {
            var message = "Finished Downloading your content"
            if error != nil {
                message = "Failed to Download your content"
            }
            self.displayAlertWithTitle(title: "Done", message: message)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataToUpload = "Hello World".data(using: .utf8, allowLossyConversion: false)
        
        let url = URL(string: "http://127.0.0.1:8080/upload")!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        let task = session.uploadTask(with: request as URLRequest, from: dataToUpload!)
        task.start()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}


