//
//  UIViewExtentions.swift
//  JetTracker
//
//  Created by Tahsin Provath on 9/4/22.
//

import UIKit

extension UIView{
    
    func pin(to SuperView: UIView){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: SuperView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: SuperView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: SuperView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: SuperView.trailingAnchor).isActive = true
    }
}
