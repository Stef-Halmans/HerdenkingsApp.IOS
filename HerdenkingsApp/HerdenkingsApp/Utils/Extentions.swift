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
        // animateSideMenu(expand: false)
        dismiss(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            previousPage = currentPage
            currentPage = page
            
            let containerController = ContainerController()
            self.window!.rootViewController = containerController
            self.window!.makeKeyAndVisible()
            containerController.window = self.window
            
        }
    }
    
    func HideDetailPage(){
        print("hideDetailPage")
         if(showingSideMenu){
              dismiss(animated: true)
          }
        
    }
    
    
}

extension ContainerController : ContainerButtonDelegate{
    var test: String {
        get{
            return tests
        }
        set(newValue){
            self.tests = newValue
        }
    }
    
    @objc func werkt(){
        print("werkt")
    }
    

    

    
}

extension UIStoryboard{
    static func mainStoryboard() -> UIStoryboard{return UIStoryboard(name: "Main", bundle: Bundle.main)}
    
    static func sideMenuController() -> SideMenuController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "SideMenuTableView") as? SideMenuController
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




