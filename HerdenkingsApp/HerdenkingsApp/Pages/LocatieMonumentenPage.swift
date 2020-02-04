//
//  MapsPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 2/4/20.
//  Copyright © 2020 Stef Halmans. All rights reserved.
//

import UIKit
import MapKit

class LocatieMonumentenPage: PageController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAnnotations()
        setupMaps()
        // Do any additional setup after loading the view.
    }
    
    func createAnnotations(){
        for monument in monumenten{
            let mapPoint = MKPointAnnotation()
            mapPoint.title = monument.title
            mapPoint.coordinate = CLLocationCoordinate2D(latitude: monument.latitude, longitude: monument.longitude)
            mapView.addAnnotation(mapPoint)
        }
    }
    
    func setupMaps(){
        let centerLocation = CLLocationCoordinate2D(latitude: 51.19027778, longitude: 6.00361111)
        let regionSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
        let region = MKCoordinateRegion.init(center: centerLocation, span: regionSpan)
        mapView.setRegion(region, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
