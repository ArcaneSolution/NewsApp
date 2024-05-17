//
//  UserDefault+Ex.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import Foundation


extension UserDefaults {
    func save<T: Codable>(_ object: T, forKey key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            self.set(data, forKey: key)
        } catch {
            print("Error encoding object: \(error.localizedDescription)")
        }
    }

    func load<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        guard let data = self.data(forKey: key) else {
            return nil
        }
        
        do {
            let object = try JSONDecoder().decode(type, from: data)
            return object
        } catch {
            print("Error decoding object: \(error.localizedDescription)")
            return nil
        }
    }
}
