//
//  NewsRest.swift
//  NewsApp
//
//  Created by M Usman on 16/05/2024.
//

import Foundation

class NewsRest {
        static func getPopularNews(period:Int = 1)->NetworkRequest<String,NewsResponseModel>{
            let httpModel = NetworkRequest<String,NewsResponseModel>(
                method: .get,
                url: URLSettings.popularNewsUrl(period: period)
            )
            return httpModel
        }
}
