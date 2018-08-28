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
    var mutableData = NSMutableData()
    
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
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = URL(string: "http://127.0.0.1:8080/1.jpg")!
        let task = session.dataTask(with: url, completionHandler:{
            (data,response,error) -> Void in
            if(error == nil){
                let manager = FileManager()
                var error:Error?
                
                do{
                    var destinationPath = try manager.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: url, create: true)
                    
                    let componentsOfurl = url.absoluteURL.pathComponents
                    let fileNameForUrl = componentsOfurl[componentsOfurl.count-1]
                    destinationPath = destinationPath.appendingPathComponent(fileNameForUrl)
                    manager.createFile(atPath: destinationPath.path, contents: data, attributes: nil)
                    
                    let message = "Saved the downloaded data to = \(destinationPath)"
                    self.displayAlertWithTitle(title: "Success", message: message)
                    
                }catch let saveFileError {
                    error  = saveFileError
                }
                
                if error != nil {
                    print(error)
                }
                
            }else {
                self.displayAlertWithTitle(title: "Error", message: "Could not download the data. An error occurred")
            }
        })
        task.start()
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

