//
//  Encodable+Ex.swift
//  Drinks
//
//  Created by M Usman on 16/05/2024.
//

import Foundation


extension Encodable {
    var convertToJsonData: Data? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try jsonEncoder.encode(self)
            return jsonData
        } catch {
            return nil
        }
    }
}
