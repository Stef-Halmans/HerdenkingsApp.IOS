//
//  ViewController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/16/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class MainPage : PageController {
    
    
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func GeschiedenisButtonPressed(_ sender: Any) {
        print("test")
        containerDelegate.changePage(page: .geschiedenisPage)
    }
    @IBAction func MonumentenPageButtonPressed(_ sender: Any) {
        containerDelegate.changePage(page: .alleGebiedenPage)
    }
}

