//
//  URLSettings.swift
//  Drinks
//
//  Created by M Usman on 16/05/2024.
//

import Foundation

class URLSettings {
    
    public static let domain:String = "api.nytimes.com"
    public static let PROTOCOL:String = "https"
    public static let baseURL:String = "\(PROTOCOL)://\(domain)/svc/"
    
    public static func popularNewsUrl(period : Int = 7) -> String{
        "\(baseURL)mostpopular/v2/mostviewed/all-sections/\(period).json?api-key=6ynxQYLWbjUxQp2S3uE2jSEqWvmoAWBZ"
    }
}
