//
//  File.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/18/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    
    // var sideMenuController: UIViewController?
    var centerPageController: PageController!
    
    var centerNavigationController: UINavigationController!
    
    var firstTime = true
    
    var window: UIWindow?
    
    let centerPanelExpandedOffset: CGFloat = 90
    
    let transition = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPage(page: currentPage)
        
        
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
        centerPageController.containerButtonDelegate = self
        
        configureNavigationBar()
        
        
        
        centerNavigationController = UINavigationController(rootViewController: centerPageController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        centerNavigationController.didMove(toParentViewController: self)
        
        
    }
    
    
    
    
    @IBAction func backButtonPressed(_ sender: Any){
        switch currentPage{
        case .specificGebiedPage?:
            changePage(page: .alleGebiedenPage)
        case .monumentenPage?:
            changePage(page: .specificGebiedPage)
        case .mainPage?:
            changePage(page: .mainPage)
        case .alleGebiedenPage?:
            changePage(page: .mainPage)
        case .geschiedenisPage?:
            changePage(page: .mainPage)
        case .none:
            break
        }
        

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
    
    @IBAction func HamburgerMenuClicked(_ sender: Any) {
        guard let sideMenuController = UIStoryboard.sideMenuController()
            else {return}
        sideMenuController.modalPresentationStyle = .overCurrentContext
        sideMenuController.transitioningDelegate = self
        sideMenuController.containerDelegate = self
        transition.containerButtonDelegate = self
        present(sideMenuController, animated: true)
    }
    
    
}

extension ContainerController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        showingSideMenu = false
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        showingSideMenu = true
        return transition
    }
}




