//
//  NetworkError.swift
//  Drinks
//
//  Created by M Usman on 16/05/2024.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(Error)
    case decodingFailed(Error)
}
