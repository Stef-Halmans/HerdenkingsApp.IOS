//
//  MonumentenPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/17/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class SpecifiekMonumentPage: PageController {

    @IBOutlet weak var monumentInformationView: UIView!
    @IBOutlet weak var leadingMonument: NSLayoutConstraint!
    @IBOutlet weak var trailingMonument: NSLayoutConstraint!
    
    @IBOutlet weak var monumentPicture: UIImageView!
    @IBOutlet weak var monumentName: UILabel!
    @IBOutlet weak var monumentDescription: UITextView!

    
    @IBOutlet weak var newMonumentInformationView: UIView!
    @IBOutlet weak var leadingNewMonument: NSLayoutConstraint!
    @IBOutlet weak var trailingNewMonument: NSLayoutConstraint!
    
    @IBOutlet weak var newMonumentPicture: UIImageView!
    @IBOutlet weak var newMonumentName: UILabel!
    @IBOutlet weak var newMonumentDescription: UITextView!
    
    
    @IBOutlet weak var gebiedName: UILabel!
    
    
    private var firstView: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializePage()
        
        initializeMonument(firstMonument: true)

    }
    
    fileprivate func initializePage() {

        
        leadingNewMonument.constant = self.view.bounds.width
        trailingNewMonument.constant = self.view.bounds.width

        monumentenUitGebied = monumenten.sort(gebied: currentGebied)

        if(currentGebied == .alleGebieden){
            gebiedName.text = "Alle monumenten"
        }
        else{
            gebiedName.text = Functions.enumToString(gebied: currentGebied)
        }
        monumentDescription.isScrollEnabled = true
        monumentDescription.isUserInteractionEnabled = true
        monumentDescription.scrollRangeToVisible(NSMakeRange(0, 0))
}
    

    func initializeMonument(firstMonument: Bool){
        if(firstMonument){
            monumentPicture.image = UIImage(named:
                monumentenUitGebied[monumentNummer].imageFilename)
            monumentName.text = monumentenUitGebied[monumentNummer].title
            monumentDescription.isScrollEnabled = false
            monumentDescription.text = monumentenUitGebied[monumentNummer].description
            monumentDescription.isScrollEnabled = true
            monumentDescription.scrollRangeToVisible(NSMakeRange(0, 0))
                    monumentName.adjustsFontSizeToFitWidth = true

        }
        else{
            newMonumentPicture.image = UIImage(named:
                monumentenUitGebied[monumentNummer].imageFilename)
            newMonumentName.text = monumentenUitGebied[monumentNummer].title
            newMonumentDescription.isScrollEnabled = false
            newMonumentDescription.text = monumentenUitGebied[monumentNummer].description
            newMonumentDescription.isScrollEnabled = true
            newMonumentDescription.scrollRangeToVisible(NSMakeRange(0, 0))
                    newMonumentName.adjustsFontSizeToFitWidth = true
        }


        
        
        
    }
    
    @IBAction func nextMonument(_ sender: Any) {
        if(monumentNummer == monumentenUitGebied.count - 1){
            monumentNummer = 0
        }
        else if(monumentNummer < monumentenUitGebied.count - 1){
            monumentNummer += 1
        }
        leadingNewMonument.constant = self.view.bounds.width
        trailingNewMonument.constant = self.view.bounds.width
        self.view.superview?.layoutIfNeeded()
        initializeMonument(firstMonument: false)
        changeMonumentAnimation(next: true)
        
    }

    
    @IBAction func previousMonument(_ sender: Any){
        if(monumentNummer > 0){
            monumentNummer -= 1
        }
        else if (monumentNummer == 0){
            monumentNummer = monumentenUitGebied.count - 1
        }
        leadingNewMonument.constant = -self.view.bounds.width
        trailingNewMonument.constant = -self.view.bounds.width
        self.view.superview?.layoutIfNeeded()
        initializeMonument(firstMonument: false)
        changeMonumentAnimation(next: false)
    }
    
    func changeMonumentAnimation(next: Bool){
        
        self.leadingNewMonument.constant = 0
        self.trailingNewMonument.constant = 0
        self.leadingMonument.constant = (next) ? -self.view.bounds.width : self.view.bounds.width
        self.trailingMonument.constant =  (next) ? self.view.bounds.width : -self.view.bounds.width
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.superview?.layoutIfNeeded()
            self.monumentInformationView.alpha = 1
            
            
            
            
        }){ _ in
            self.initializeMonument(firstMonument: true)
            self.leadingMonument.constant = 0
            self.trailingMonument.constant = 0
            self.leadingNewMonument.constant = self.view.bounds.width
            self.trailingNewMonument.constant = self.view.bounds.width
        }
    }

    


}
