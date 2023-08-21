import SwiftUI

extension Bundle{
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("ERROR: Failed To locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ERROR: Failed To locate \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("ERROR: Failed To decode \(file) from bundle.")
        }
        
        return loaded
    }
}
