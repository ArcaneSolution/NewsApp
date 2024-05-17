//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import Foundation
import Combine

class HomeViewModel {
    @Published var news = [News]()
    @Published var isLoading = false
    var bindings = Set<AnyCancellable>()
    
    func fetchPopularNews(){
        self.isLoading = true
        if !NetworkReachability.isInternetAvailable(){
            getDataFromCache()
            return
        }
        NewsRest.getPopularNews().fetchData()
            .sink { completion in
                if case .failure(let err) = completion {
                    self.isLoading = false
                    print(err)
                }
            } receiveValue: { response in
                if let data = response?.results {
                    self.news = data
                    self.isLoading = false
                    self.saveDataInCache()
                }
            }.store(in: &bindings)
    }
    
    func saveDataInCache(){
        CacheManager.shared.saveNews(newsData: self.news)
    }
    func getDataFromCache(){
        self.news = CacheManager.shared.getNews()
        self.isLoading=false
    }
}
