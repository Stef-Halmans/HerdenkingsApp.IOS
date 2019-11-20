//
//  File.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/18/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    
    var sideMenuController: SideMenuController?
    var centerPageController: PageController!
    
    var centerNavigationController: UINavigationController!
    
    var firstTime = true
    
    var window: UIWindow?
    
    let centerPanelExpandedOffset: CGFloat = 90
    
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPage(page: currentPage)
        configureSideMenu()
        
    }
    
    func setPage(page: pages!) {
        
        switch page {
        case .mainPage?:
            centerPageController = UIStoryboard.mainPage()
        case .alleGebiedenPage?:
            centerPageController = UIStoryboard.alleGebiedenPage()
        case .specificGebiedPage?:
            centerPageController = UIStoryboard.specificGebiedPage()
        case .monumentenPage?:
            centerPageController = UIStoryboard.monumentenPage()
        case .geschiedenisPage?:
            centerPageController = UIStoryboard.GeschiedenisPage()
        case .none:
            break
        }

        centerPageController.containerDelegate = self
        
        configureNavigationBar()
        
        centerNavigationController = UINavigationController(rootViewController: centerPageController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        centerNavigationController.didMove(toParentViewController: self)
    }
    
    @IBAction func backButtonPressed(_ sender: Any){
        changePage(page: previousPage)
    }
    
    func  configureNavigationBar() {
        if(currentPage != .mainPage){
            let backButton = UIButton(type: UIButtonType.custom)
            backButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
            backButton.setImage(UIImage(named: "BackButton"), for: UIControlState())
            let menuBarButtonItem = UIBarButtonItem(customView: backButton)
            centerPageController.navigationItem.leftBarButtonItem = menuBarButtonItem
        }
        let hamburgerMenu = UIButton(type: UIButtonType.custom)
        
        hamburgerMenu.frame = CGRect(x: 0, y: 0, width: 40, height: 33)
        hamburgerMenu.addTarget(self, action: #selector(HamburgerMenuClicked(_:)), for: .touchUpInside)
        hamburgerMenu.setImage(UIImage(named: "HamburgerMenu"), for: UIControlState())
        
        let menuBarButtonItem = UIBarButtonItem(customView: hamburgerMenu)
        
        let logo = UIImage(named: "BevrijdingsLogo")
        let imageView = UIImageView(image:logo)
        
        centerPageController.navigationItem.rightBarButtonItems = [menuBarButtonItem]
        centerPageController.navigationItem.titleView = imageView
        
        
    }
    
    func configureSideMenu(){
        sideMenuController = UIStoryboard.sideMenuController()
        sideMenuController?.containerDelegate = self
        view.insertSubview(sideMenuController!.view, at: 0)
        addChildViewController(sideMenuController!)
        sideMenuController?.didMove(toParentViewController: self)
    }
    
    @IBAction func HamburgerMenuClicked(_ sender: Any) {
        animateSideMenu(expand: !self.isExpanded)
        isExpanded = !isExpanded
    }
    
    func animateSideMenu(expand: Bool) {
        if expand {
            animateCenterPanelXPosition(
                targetPosition: -self.centerNavigationController.view.frame.width + centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
                UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut, animations: {
                       self.centerNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
        print("animated")
    }
}





