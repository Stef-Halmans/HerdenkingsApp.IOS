//
//  File.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/18/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit
import MapKit

class ContainerController: UIViewController{ 
    
    // var sideMenuController: UIViewController?
    var centerPageController: PageController!
    
    var centerNavigationController: UINavigationController!
    
    var firstTime = true
    
    var window: UIWindow?
    
    let centerPanelExpandedOffset: CGFloat = 90
    
    let transition = SlideInTransition()
    
    var tests: String = "test"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setPage(page: currentPage)
        

        
        
    }
    
    func setPage(page: pages!) {
        
        switch page {
        case .mainPage?:
            centerPageController = UIStoryboard.mainPage()
        case .kiesGebiedPage?:
            centerPageController = UIStoryboard.kiesGebiedPage()
        case .lijstMonumentenPage?:
            centerPageController = UIStoryboard.lijstMonumentenPage()
        case .specifiekMonumentPage?:
            centerPageController = UIStoryboard.specifiekMonumentPage()
        case .some(.locatieMonumentenPage):
            centerPageController = UIStoryboard.locatieMonumentenPage()
           
            
        case .geschiedenisPage?:
            centerPageController = UIStoryboard.geschiedenisPage()
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
        switch currentPage{
        case .lijstMonumentenPage?:
            changePage(page: .kiesGebiedPage)
        case .specifiekMonumentPage?:
            changePage(page: .lijstMonumentenPage)
        case .mainPage?:
            changePage(page: .mainPage)
        case .kiesGebiedPage?:
            changePage(page: .mainPage)
        case .locatieMonumentenPage?:
            if(specificLocation){
                changePage(page: .specifiekMonumentPage)
            } else{
                changePage(page: .mainPage)
            }
        case .geschiedenisPage?:
            changePage(page: .mainPage)
        case .none:
            break

        }
    }
    
    func  configureNavigationBar() {
        var uiRightBarButtonItems: [UIBarButtonItem] = []
        if(currentPage != .mainPage){
            let backButton = UIButton(type: UIButtonType.custom)
            backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
            backButton.setImage(UIImage(named: "BackButton"), for: UIControlState())
            let menuBarButtonItem = UIBarButtonItem(customView: backButton)
            let currWidth = menuBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 35)
            currWidth?.isActive = true
            let currHeight = menuBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 35)
            currHeight?.isActive = true
            
            centerPageController.navigationItem.leftBarButtonItem = menuBarButtonItem
        }

        let hamburgerMenu = UIButton(type: UIButtonType.custom)
        
        hamburgerMenu.addTarget(self, action: #selector(HamburgerMenuClicked(_:)), for: .touchUpInside)
        hamburgerMenu.setImage(UIImage(named: "HamburgerMenu"), for: UIControlState())
        
        let menuBarButtonItem = UIBarButtonItem(customView: hamburgerMenu)
        menuBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 36).isActive = true
        menuBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        uiRightBarButtonItems.append(menuBarButtonItem)
        
        if(currentPage == .specifiekMonumentPage){
            let locationButton = UIButton(type: UIButtonType.custom)
            locationButton.frame = CGRect(x: 0, y:0, width:40, height:40)
            locationButton.addTarget(self, action: #selector(locationButtonPressed), for: .touchUpInside)
            locationButton.setImage(UIImage(named: "locationButton"), for: UIControlState())
            let menuBarButtonItem = UIBarButtonItem(customView: locationButton)
            
            menuBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
            menuBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            uiRightBarButtonItems.append(menuBarButtonItem)
        }
        
        let logo = UIImage(named: "NavBarLogo")
        let imageView = UIImageView(image:logo)
        imageView.widthAnchor.constraint(equalToConstant: 120.7).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        centerPageController.navigationItem.rightBarButtonItems = uiRightBarButtonItems
        centerPageController.navigationItem.titleView = imageView
        
        
    }
    
    @IBAction func HamburgerMenuClicked(_ sender: Any) {
        guard let sideMenuController = UIStoryboard.sideMenuController()
            else {return}
        sideMenuController.modalPresentationStyle = .overCurrentContext
        sideMenuController.transitioningDelegate = self
        sideMenuController.containerDelegate = self
        transition.containerControllerDelegate = self

        present(sideMenuController, animated: true)
        
    }
    
    @IBAction func locationButtonPressed(_ sender: Any){
        
        specificLocation = true
        changePage(page: .locatieMonumentenPage)
        //locatieMonumentenPageDelegate.goToSpecificAnnotation(latitude: latitude, longitude: longitude)
        
//        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
//        let regionDistance:CLLocationDistance = 10000
//        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
//        let options = [
//            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
//        ]
//
//        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
//        let mapItem = MKMapItem(placemark: placemark)
//        mapItem.name = monumenten[monumentNummer].title
//
//        mapItem.openInMaps(launchOptions: options)
        
        
        
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




