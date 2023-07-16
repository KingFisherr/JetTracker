//
//  SavedTableViewCell.swift
//  JetTracker
//
//  Created by Ana Fuentes on 6/15/23.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    var sampleImageView = UIImageView()
    var titleLabel = UILabel()
    

        let button = UIButton(type: .system)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(sampleImageView)
        addSubview(titleLabel)
        let button = UIButton(type: .system)

        button.setImage(UIImage(systemName: "trash"), for: .normal)
       

                // Set button frame
        button.frame = CGRect(x: 300, y: 20, width: 80, height: 50)

                // Customize button appearance
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                
                // Add the button to the view

        
        contentView.addSubview(button)
        configureImageView()
        configureTitleView()
        setTitleLabelConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func set(flight: String){
//
//        titleLabel.text = flight
//
//    }
    
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
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: sampleImageView.trailingAnchor,constant:20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant:80).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -12).isActive = true
    }
    
}
    