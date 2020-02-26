//
//  MapsPage.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 2/4/20.
//  Copyright © 2020 Stef Halmans. All rights reserved.
//

import UIKit
import MapKit

class LocatieMonumentenPage: PageController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
              
        createAnnotations()
        
        print(specificLocation)
        
        if(specificLocation){
            setupMaps(latitude: monumentenUitGebied[monumentNummer].latitude, longitude: monumentenUitGebied[monumentNummer].longitude, offset: 0.005)
            let mapPoint = MKPointAnnotation()
            mapPoint.title = monumentenUitGebied[monumentNummer].title
            mapPoint.coordinate = CLLocationCoordinate2D(latitude: monumentenUitGebied[monumentNummer].latitude, longitude: monumentenUitGebied[monumentNummer].longitude)
            mapView.addAnnotation(mapPoint)

            mapView.selectAnnotation(mapPoint, animated: true)
            
        }
        else if(!specificLocation){
          //  setupMaps(latitude: 51.1984982, longitude: 6.0169195, offset: 0.15)
        }

    }
    
    func createAnnotations(){
        for monument in monumenten{
            if(specificLocation){
                if(monument.title != monumentenUitGebied[monumentNummer].title){
                    let mapPoint = MKPointAnnotation()
                    mapPoint.title = monument.title
                    mapPoint.coordinate = CLLocationCoordinate2D(latitude: monument.latitude, longitude: monument.longitude)
                    
                    mapView.addAnnotation(mapPoint)
                }
            }
            else{
                let mapPoint = MKPointAnnotation()
                mapPoint.title = monument.title
                mapPoint.coordinate = CLLocationCoordinate2D(latitude: monument.latitude, longitude: monument.longitude)
                    
                mapView.addAnnotation(mapPoint)
            }
            mapView.showAnnotations(mapView.annotations, animated: true)
           
            

        }
    }
    
    func setupMaps(latitude: CLLocationDegrees, longitude: CLLocationDegrees, offset: Double){
        let centerLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let regionSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: offset, longitudeDelta: offset)
        let region = MKCoordinateRegion.init(center: centerLocation, span: regionSpan)
        mapView.setRegion(region, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
            view.canShowCallout = true
        } else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
      
        
        return view
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        setupMaps(latitude: (view.annotation?.coordinate.latitude)! , longitude: view.annotation!.coordinate.longitude, offset: 0.0015)
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let location = view.annotation else{
            return
        }
        
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        
        let placemark = MKPlacemark(coordinate: location.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = location.title!
        mapItem.openInMaps(launchOptions: launchOptions)
    }


}
extension LocatieMonumentenPage  {
//    func goToSpecificAnnotation(latitude: CLLocationDegrees, longitude:CLLocationDegrees) {
//        setupMaps(latitude: latitude, longitude: longitude)
//    }
//
//    func createAllAnnotations(){
//        setupMaps(latitude: 51.19027778, longitude: 6.00361111)
//    }
    
    

    
}
