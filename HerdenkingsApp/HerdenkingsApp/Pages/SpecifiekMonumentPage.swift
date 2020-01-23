//
//  MonumentenPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/17/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class SpecifiekMonumentPage: PageController {


    
    @IBOutlet weak var monumentPicture: UIImageView!
    @IBOutlet weak var monumentName: UILabel!
    @IBOutlet weak var monumentDescription: UITextView!
    @IBOutlet weak var gebiedName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monumentNummer = 0

        monumentenUitGebied = monumenten.sort(gebied: currentGebied)
        gebiedName.text = currentGebied.rawValue
        
        initializeMonument()

    }

    func initializeMonument(){
        
        monumentPicture.image = UIImage(named: monumentenUitGebied[monumentNummer].imageFilename)
        monumentName.text = monumentenUitGebied[monumentNummer].title
        monumentDescription.text = monumentenUitGebied[monumentNummer].description 
        
    }
    
    @IBAction func nextMonument(_ sender: Any) {
        if(monumentNummer == monumentenUitGebied.count - 1){
            monumentNummer = 0
        }
        else if(monumentNummer < monumentenUitGebied.count - 1){
            monumentNummer += 1
        }
        initializeMonument()
    }

    
    @IBAction func previousMonument(_ sender: Any){
        if(monumentNummer > 0){
            monumentNummer -= 1
        }
        else if (monumentNummer == 0){
            monumentNummer = monumentenUitGebied.count - 1
        }
        initializeMonument()
    }

    


}
