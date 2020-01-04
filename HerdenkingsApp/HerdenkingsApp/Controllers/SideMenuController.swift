//
//  HamburgerMenuController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/18/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class SideMenuController: UITableViewController{
    
    var containerDelegate: ContainerControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.item == 0){
            containerDelegate.changePage(page: .mainPage)
        }
        else if( indexPath.item == 1){
            containerDelegate.changePage(page: .kiesGebiedPage)
        }
        else if(indexPath.item == 2){
            currentGebied = .alleGebieden
            containerDelegate.changePage(page: .lijstMonumentenPage)
        }
        else if(indexPath.item == 3){
            containerDelegate.changePage(page: .geschiedenisPage)
        }
        else if(indexPath.item == 4){
            currentGebied = .roermond
            containerDelegate.changePage(page: .specifiekMonumentPage)
        }
        
    }
    
    
}
