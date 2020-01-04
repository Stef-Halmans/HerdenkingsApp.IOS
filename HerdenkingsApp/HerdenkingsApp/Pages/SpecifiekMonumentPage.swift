//
//  MonumentenPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/17/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class SpecifiekMonumentPage: PageController {

    var monumentenUitGebied: [Monument] = []
    var monumentNummer: Int = 0
    
    @IBOutlet weak var monumentPicture: UIImageView!
    @IBOutlet weak var monumentName: UILabel!
    @IBOutlet weak var monumentDescription: UITextView!
    @IBOutlet weak var gebiedName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monumentenUitGebied = monumenten.sort(gebied: currentGebied)
        gebiedName.text = currentGebied.rawValue
        
        initializeMonument()

    }

    func initializeMonument(){
        
        monumentName.text = monumentenUitGebied[monumentNummer].title
        monumentDescription.text = monumentenUitGebied[monumentNummer].description
        
    }
    
    @objc func nextMonument(_ sender: Any){
        monumentNummer += 1
        initializeMonument()
    }
    
    @objc func previousMonument(_ sender: Any){
        monumentNummer -= 1
    }

    


}
