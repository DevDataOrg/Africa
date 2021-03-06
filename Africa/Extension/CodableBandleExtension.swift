//
//  CodableBandleExtension.swift
//  Africa
//
//  Created by Artyom Romanchuk on 22.04.2021.
//

import Foundation


extension Bundle {
    func decode<T: Codable> (_ file: String) -> T { //add Generics <T: Codable>:  func decode<T: Codable> (_ file: String) -> [CoverImage]
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        
        //2. Create a property for the data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else { // guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        //5. Return the redy-to-use data
        return loaded
    }
}
