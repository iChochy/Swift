//
//  CustomTableViewCell.swift
//  SwiftCode
//
//  Created by MLeo on 2018/10/9.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let customImageView = UIImageView()
    let titleLabel = UILabel()
    let detailLabel = UILabel()
    let dateLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(dateLabel)
        addImageConstraints()
        addTileConstraints()
        addDetailConstraints()
        addDateConstraints()
        
    }
    
    
    func addTileConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    func addDetailConstraints(){
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            detailLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: detailLabel.trailingAnchor, constant: 0),
        detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }
    
    func addDateConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
                
            ]
        )
        
    }
    
    
    func addImageConstraints(){
        customImageView.contentMode = .center
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customImageView.widthAnchor.constraint(equalToConstant: 100),
            customImageView.heightAnchor.constraint(equalToConstant: 100),
            customImageView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor,constant:5),
            customImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10)
        
            ])
    
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
