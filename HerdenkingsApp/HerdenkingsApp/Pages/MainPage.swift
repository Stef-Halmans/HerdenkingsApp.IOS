//
//  ViewController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/16/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class MainPage : PageController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIGestureRecognizer(target: self, action: #selector(containerButtonDelegate!.HideDetailPage(_:)))
        self.view.addGestureRecognizer(gesture)
        
        
    }
    @IBAction func GeschiedenisButton(_ sender: UIButton, forEvent event: UIEvent) {
        containerDelegate?.changePage(page: pages.geschiedenisPage)
    }
    
    @IBAction func MonumentenButton(_ sender: UIButton) {
        containerDelegate?.changePage(page: pages.alleGebiedenPage)
    }
}

