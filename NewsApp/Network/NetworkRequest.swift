//
//  NetworkRequest.swift
//  Drinks
//
//  Created by M Usman on 16/05/2024.
//

import Foundation
import Combine
//import SwiftyJSON

class NetworkRequest <Req:Encodable,Res:Codable> : NSObject{
    var method:HTTPMehtod = .get
    var url:String?
    var requestModel:Req!
    var bindings = Set<AnyCancellable>()
    
    
    init(method:HTTPMehtod,url:String,requestModel:Req) {
        self.method=method
        self.url=url
        self.requestModel=requestModel
    }
    init(method:HTTPMehtod,url:String) {
        self.method=method
        self.url=url
    }
    func fetchData() -> AnyPublisher<Res?, NetworkError> {
        return Future { promise in
            guard let url = URL(string: self.url!) else{
            promise(.failure(NetworkError.invalidURL))
                return
        }
            var request = URLRequest(url: url)
            request.httpMethod=self.method.rawValue
            if self.requestModel != nil , !(self.requestModel is String) {
                request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
                request.httpBody = self.requestModel.convertToJsonData
            }
            URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            promise(.failure(.requestFailed(error)))
                        }
                        guard let data = data else {
                            promise(.failure(.invalidResponse))
                            return
                        }
                        
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Res.self, from: data)
                            promise(.success(decodedData))
                        } catch {
                            promise(.failure(.decodingFailed(error)))
                        }
                    }.resume()
        }.eraseToAnyPublisher()
    }
}
