//
//  Monument.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 12/27/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import Foundation

//public struct Monumenten: Codable{
//    let monumenten: Array<Monument> = Array()
//}
//public struct Monument: Codable{
//    let title: String
//    let regio: String
//    let imageFilename: String
//    let description: String
//}
public class Monument : Codable{
    var title: String
    var regio: String
    var imageFilename: String
    var description: String
    var longitude: String
    var latitude: String
    
    init(title: String, regio: String, imageFilename: String, description: String, longitude: String, latitude: String) {
        self.title = title
        self.regio = regio
        self.imageFilename = imageFilename
        self.description = description
        self.longitude = longitude
        self.latitude = latitude
    }    
}


