//
//  BaseViewController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/16/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var menuShowing = false;
    
    var storyBoard: UIStoryboard!
    
    var detailPage: UIView!
    
    var allRegioPage: UIViewController!
    var specificRegioPage:UIViewController!
    var monumentenPage: UIViewController!
    var geschiedenisPage: UIViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailPage = UIView(frame: CGRect(x: 380, y: 64, width: 250, height: 603))
        
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        allRegioPage = storyBoard.instantiateViewController(withIdentifier: "AllRegioPage")
        specificRegioPage = storyBoard.instantiateViewController(withIdentifier: "SpecificRegioPage")
        monumentenPage = storyBoard.instantiateViewController(withIdentifier: "MonumentenPage")
        geschiedenisPage = storyBoard.instantiateViewController(withIdentifier: "GeschiedenisPage")
        
        detailPage.backgroundColor = UIColor.lightGray
        detailPage.layer.opacity = 1
        detailPage.layer.shadowRadius = 6
        view.addSubview(detailPage)
        
        
        let hamburgerMenu = UIButton(type: UIButtonType.custom)
        
        hamburgerMenu.frame = CGRect(x: 0, y: 0, width: 40, height: 33)
        hamburgerMenu.addTarget(self, action: #selector(HamburgerMenuClicked), for: .touchUpInside)
        hamburgerMenu.setImage(UIImage(named: "HamburgerMenu"), for: UIControlState())
        
        let menuBarButtonItem = UIBarButtonItem(customView: hamburgerMenu)
        
        let logo = UIImage(named: "BevrijdingsLogo")
        let imageView = UIImageView(image:logo)
        
        navigationItem.rightBarButtonItems = [menuBarButtonItem]
        navigationItem.titleView = imageView
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.HideDetailPageButton(_:)))
        self.view.addGestureRecognizer(gesture)
        
        
        CreateButtons()
        
    }
    
    func CreateButtons() {
        
        let monumentPageButton = UIButton(type: .system)
        monumentPageButton.frame = CGRect(x: 29, y: 49, width: 196, height: 36)
        monumentPageButton.setTitle("monumenten pagina", for: .normal)
        monumentPageButton.setTitleColor(UIColor.white, for: .normal)
        monumentPageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        monumentPageButton.addTarget(self, action: #selector(ChangePage), for: .touchUpInside)
        
        
        detailPage.addSubview(monumentPageButton)
        
        
    }
    
    @IBAction func HamburgerMenuClicked(_ sender: Any) {
        print("test")
        if(menuShowing){
            UIView.animate(withDuration: 0.5, animations: {self.detailPage.frame = CGRect(x: 380, y: 64, width: 250, height: 603)})
        } else{
            UIView.animate(withDuration: 0.5, animations: {self.detailPage.frame = CGRect(x: 125, y: 64, width: 250, height: 603)})
        }
        menuShowing = !menuShowing
    }
    
    @objc func HideDetailPageButton(_ sender:UITapGestureRecognizer){
        if(menuShowing){
            HideDetailPage()
        }
    }
    
    func  HideDetailPage() {
        UIView.animate(withDuration: 0.5, animations: {self.detailPage.frame = CGRect(x: 380, y: 64, width: 250, height: 603)})
        menuShowing = false
    }
    
    @objc func ChangePage(){
        HideDetailPage()
        self.navigationController?.pushViewController(monumentenPage, animated: true)
    }
}
