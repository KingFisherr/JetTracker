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


        let button = UIButton(type: .system)
           // Configure the button's appearance and behavior
//           button.setTitle("Button Title", for: .normal)
//           button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//           // Add any other necessary configuration to the button
//           return button

      // }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(sampleImageView)
        addSubview(titleLabel)
       // let button = UIButton()

//        button.setImage(UIImage(systemName: "square.and.arrow.down.fill"), for: .normal)


                // Set button frame
        button.frame = CGRect(x: 300, y: 20, width: 80, height: 50)

                // Customize button appearance
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    
                // Add the button to the view


        contentView.addSubview(button)
        configureImageView()
        configureTitleView()
        setTitleLabelConstraints()


    }
    @objc func buttonTapped(_ sender: UIButton) {

//       var holder = UserDefaults.standard.array( forKey: "SavedFlight") as? [String]
//        if holder == nil{
//            UserDefaults.standard.set([titleLabel.text],forKey: "SavedFlight")
//        }
//        else{
//            holder.append(titleLabel)
//            UserDefaults.standard.set(holder,forKey: "SavedFlight")
//        }
//
        // Handle the button tap event for the specific cell at indexPath
       // print(holder)
        if var myArray = UserDefaults.standard.array(forKey: "SavedFlight") as? [String] {
            // Modify the array by appending the new element
            myArray.append(titleLabel.text!)
            
            // Save the updated array back to UserDefaults
            UserDefaults.standard.set(myArray, forKey: "SavedFlight")
            print(myArray)
        }
        else{
            UserDefaults.standard.set([titleLabel.text!], forKey: "SavedFlight")
        }
        
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(flight: String){

        titleLabel.text = flight

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

    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: sampleImageView.trailingAnchor,constant:20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant:80).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -12).isActive = true
    }

}

