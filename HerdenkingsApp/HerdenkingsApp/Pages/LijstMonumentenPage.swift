//
//  SpecificRegioPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/17/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class LijstMonumentenPage: PageController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var monumentenCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        monumentenUitGebied = monumenten.sort(gebied: currentGebied)
        
        super.viewDidLoad()
        
        let itemSize = (UIScreen.main.bounds.width - 30) / 2

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
    
        
        monumentenCollectionView.collectionViewLayout = layout        
        


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monumentenUitGebied.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monumentPicture", for: indexPath) as! MonumentImageCell
        
        cell.monumentImageView.image = UIImage(named: monumentenUitGebied[indexPath.row].imageFilename)
        cell.monumentNameLabel.text = monumentenUitGebied[indexPath.row].title
        
        cell.layer.borderColor = UIColor.lightGray.cgColor 
        cell.layer.borderWidth = 0.5
        
        return cell
        
    }


    


}
