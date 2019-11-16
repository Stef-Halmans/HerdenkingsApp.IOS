//
//  ViewController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/16/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var masterPage: UIView!
    
    @IBOutlet weak var detailPage: UIView!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.HideDetailPage(_:)))
        self.masterPage.addGestureRecognizer(gesture)
        
        detailPage.layer.shadowOpacity = 1
        detailPage.layer.shadowRadius = 6
    }
    @IBAction func HamburgerMenuClicked(_ sender: Any) {
        
        if(menuShowing){
            leadingConstraint.constant = -255
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        } else{
           leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        menuShowing = !menuShowing
    }
    
    
    
    
    
    @objc func HideDetailPage(_ sender:UITapGestureRecognizer){
        if(menuShowing){
            leadingConstraint.constant = -255
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            menuShowing = false
        }
        
    }

}

