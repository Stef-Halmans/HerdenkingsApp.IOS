//
//  ViewController.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/16/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class MainPage : PageController {
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.scrollRangeToVisible(NSMakeRange(0, 0))
    }

    
    @IBAction func GeschiedenisButtonPressed(_ sender: Any) {
        containerDelegate.changePage(page: .geschiedenisPage)
    }
    
    @IBAction func MonumentenPageButtonPressed(_ sender: Any) {
        containerDelegate.changePage(page: .kiesGebiedPage)
    }
}

