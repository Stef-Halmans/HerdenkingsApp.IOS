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


extension UIStoryboard{
    static func mainStoryboard() -> UIStoryboard{return UIStoryboard(name: "Main", bundle: Bundle.main)}
    
    static func sideMenuController() -> SideMenuController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "SideMenuTableView") as? SideMenuController
    }
    
    static func mainPage() -> MainPage? {
        return mainStoryboard().instantiateViewController(withIdentifier: "MainPage") as? MainPage
    }
    
    static func kiesGebiedPage() -> KiesGebiedPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"KiesGebiedPage") as? KiesGebiedPage
    }
    
    static func lijstMonumentenPage() -> LijstMonumentenPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"LijstMonumentenPage") as? LijstMonumentenPage
    }
    
    static func specifiekMonumentPage() -> SpecifiekMonumentPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"SpecifiekMonumentPage") as? SpecifiekMonumentPage
    }
    
    static func locatieMonumentenPage() -> LocatieMonumentenPage? {
        return mainStoryboard().instantiateViewController(withIdentifier: "LocatieMonumentenPage") as? LocatieMonumentenPage
    }
    
    static func geschiedenisPage() -> GeschiedenisPage? {
        return mainStoryboard().instantiateViewController(withIdentifier:"GeschiedenisPage") as? GeschiedenisPage
    }
    
}

extension Array where Iterator.Element == Monument {
    func sort(gebied: gebieden) -> [Monument] {
        var monumenten: [Monument] = []
        for monument in self {
            if case gebied = gebieden.alleGebieden {
                monumenten.append(monument)
            }
            if case monument.regio = gebied{
                monumenten.append(monument)
            }
        }
        return monumenten
    }
}





