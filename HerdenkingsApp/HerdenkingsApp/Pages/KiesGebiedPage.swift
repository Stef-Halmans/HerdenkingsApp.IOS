//
//  RegioPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/17/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class KiesGebiedPage: PageController {
    
    
    @IBOutlet weak var roermondImage: UIImageView!
    @IBOutlet weak var hertenImage: UIImageView!
    @IBOutlet weak var swalmenImage: UIImageView!
    @IBOutlet weak var maasnielImage: UIImageView!
    @IBOutlet weak var asenrayImage: UIImageView!
    
    var images: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeGestureRecognizers()
    }
    
    func initializeGestureRecognizers(){
        images = [roermondImage,hertenImage,swalmenImage,maasnielImage,asenrayImage]
        
        for image in images{
            addGestureRecognizer(imageView: image)
        }
        
    }
    
    func addGestureRecognizer(imageView: UIImageView){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(gebiedGekozen(_:)))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    @IBAction func AlleMonumenten(_ sender: Any) {
        currentGebied = .alleGebieden
        containerDelegate.changePage(page: .lijstMonumentenPage) 
    }
    
    
    @IBAction func gebiedGekozen(_ sender: UIGestureRecognizer){
        let gekozenGebied = gebieden(rawValue: sender.view?.restorationIdentifier as! String)
        currentGebied = gekozenGebied
        containerDelegate.changePage(page: .lijstMonumentenPage)
    }
    
    
    
}
