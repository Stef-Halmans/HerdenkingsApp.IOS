import Foundation
public class LoadData  {
    public static func LoadMonumenten(fileName: String, fileType: String) -> [Monument]{
        
        var monumenten: [Monument]

        do{
            
            let path = Bundle.main.path(forResource: fileName, ofType: fileType)
            let url = URL(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            monumenten = try decoder.decode([Monument].self, from: data)
            
            return monumenten
        }
        catch{
            print("error:\(error)")
            
            monumenten = []
            
            return monumenten
        }
    
    }
        
}
