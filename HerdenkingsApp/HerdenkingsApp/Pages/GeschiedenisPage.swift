//
//  GeschiedenisPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/17/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class GeschiedenisPage: PageController {

    @IBOutlet weak var geschiedenisText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        geschiedenisText.isScrollEnabled = true
        geschiedenisText.isUserInteractionEnabled = true
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        geschiedenisText.scrollRangeToVisible(NSMakeRange(0, 0))
    }


}
