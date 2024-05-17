//
//  CacheManager.swift
//  NewsApp
//
//  Created by M Usman on 16/05/2024.
//

import Foundation




class CacheManager {
    static var shared = CacheManager()
    private init(){}
    private let cache = NSCache<NSString, NSData>()
    private let userDefault = UserDefaults.standard
    
    func saveNews(newsData:[News]){
        userDefault.save(newsData, forKey: "news")
    }
    func getNews()->[News]{
        userDefault.load(forKey: "news", as: [News].self) ?? [News]()
    }
   
}

