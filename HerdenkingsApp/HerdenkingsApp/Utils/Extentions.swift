//
//  Extentions.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/19/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

extension ContainerController : ContainerControllerDelegate{
    
    func changePage(page: pages) {
        animateSideMenu(expand: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.075){
            previousPage = currentPage
            currentPage = page
            
            let containerController = ContainerController()
            self.window!.rootViewController = containerController
            self.window!.makeKeyAndVisible()
            containerController.window = self.window
            
        }
    }
}

extension UIStoryboard{
    static func mainStoryboard() -> UIStoryboard{return UIStoryboard(name: "Main", bundle: Bundle.main)}
    
    static func sideMenuController() -> SideMenuController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "SideMenuController") as? SideMenuController
    }
    
    static func mainPage() -> MainPage? {
        return mainStoryboard().instantiateViewController(withIdentifier: "MainPage") as? MainPage
    }
    
    static func alleGebiedenPage() -> AlleGebiedenPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"AlleGebiedenPage") as? AlleGebiedenPage
    }
    
    static func specificGebiedPage() -> SpecificGebiedPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"SpecificGebiedPage") as? SpecificGebiedPage
    }
    
    static func monumentenPage() -> MonumentenPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"MonumentenPage") as? MonumentenPage
    }
    
    static func GeschiedenisPage() -> GeschiedenisPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"GeschiedenisPage") as? GeschiedenisPage
    }
    
}
    
    
    

