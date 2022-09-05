//
//  Cell.swift
//  JetTracker
//
//  Created by Tahsin Provath on 9/4/22.
//

import UIKit

class Cell: UITableViewCell {
    
    var sampleImageView = UIImageView()
    var titleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sampleImageView)
        addSubview(titleLabel)
        
        configureImageView()
        configureTitleView()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(){
        
        
        
    }
    
    func configureImageView(){
        sampleImageView.layer.cornerRadius = 10
        sampleImageView.clipsToBounds = true
    }
    
    func configureTitleView(){
        titleLabel.numberOfLines = 10
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        sampleImageView.translatesAutoresizingMaskIntoConstraints = false
        sampleImageView.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
        sampleImageView.leadingAnchor.constraint(equalTo:leadingAnchor,constant:12).isActive = true
        sampleImageView.heightAnchor.constraint(equalToConstant:80).isActive = true
        sampleImageView.widthAnchor.constraint(equalTo:sampleImageView.heightAnchor,multiplier:16/9).isActive = true
    }
    
    func setLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: sampleImageView.trailingAnchor,constant:20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant:80).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -12).isActive = true
    }
    
}
    
