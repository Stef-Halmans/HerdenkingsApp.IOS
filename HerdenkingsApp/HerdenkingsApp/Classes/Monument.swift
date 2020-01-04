
import Foundation


public class Monument : Codable{
    var title: String
    var regio: gebieden
    var imageFilename: String
    var description: String
    var longitude: Double
    var latitude: Double
    

    
    init(title: String, regio: gebieden, imageFilename: String, description: String, longitude: Double, latitude: Double) {
        self.title = title
        self.regio = regio
        self.imageFilename = imageFilename
        self.description = description
        self.longitude = longitude
        self.latitude = latitude
    }    
}


