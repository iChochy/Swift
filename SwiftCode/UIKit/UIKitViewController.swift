//
//  UIKitViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/25.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class UIKitViewController: UITableViewController {
    
    var tableViewGroups:[TableViewGroup]? {
        get{
            if let path = Bundle.main.path(forResource: "SwiftCode", ofType: "plist") {
                let data = FileManager.default.contents(atPath: path)
                typealias Settings = [TableViewGroup]
                var groups:[TableViewGroup]?
                let decoder = PropertyListDecoder()
                do{
                   groups =  try decoder.decode(Settings.self, from: data!)
                    return groups
                }catch{
                    print(error)
                }
            }
            return nil
        }
        
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
        cell!.titleLabel.numberOfLines = 0

        let group = tableViewGroups![indexPath.section]
        let details = group.details
        let detail = details[indexPath.row]
        let createDate = detail.createDate
        let image = UIImage(named: "pay")!
        
        cell!.titleLabel.text = detail.title
        cell!.detailLabel.text = detail.detail
        
        cell!.dateLabel.text = dateFormatter.string(from: createDate)
       
        cell!.customImageView.image = imageResetSize(image: image,size:100)
        return cell!
    }
    
    let dateFormatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    
    func imageResetSize(image:UIImage,size:CGFloat) -> UIImage{
        var scale:CGFloat
        if image.size.width > image.size.height {
            scale = image.size.width/size
        }else{
            scale = image.size.height/size
        }
        let itemSize = CGSize.init(width: image.size.width/scale, height: image.size.height/scale)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        image.draw(in: imageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewGroups![section].groupName
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewGroups!.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
