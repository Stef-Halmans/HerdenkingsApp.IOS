//
//  HamburgerMenuController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/18/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class SideMenuController: PageController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func ChangePage(_ sender: Any) {
        containerDelegate?.changePage(page: pages.alleGebiedenPage)
        print("button")
    }
    
}
