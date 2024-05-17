//
//  ImageDownloader.swift
//  Drinks
//
//  Created by M Usman on 16/05/2024.
//

import Foundation

import UIKit
import Combine
class ImageDownloader {
    static let shared = ImageDownloader()
    private let cache = NSCache<NSString, UIImage>()
    
    
    
    func getImage(fromURLString urlString: String) -> AnyPublisher<UIImage?, Never> {
        let subject = PassthroughSubject<UIImage?, Never>()
        
        // Check if the image is already cached
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            subject.send(cachedImage)
        }
        
        // Download the image
        guard let url = URL(string: urlString) else {
            subject.send(nil)
            return subject.eraseToAnyPublisher()
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .sink(receiveValue: { image in
                if let image = image {
                    // Cache the downloaded image
                    self.cache.setObject(image, forKey: urlString as NSString)
                }
                subject.send(image)
            })
            .store(in: &subscriptions)
        
        return subject.eraseToAnyPublisher()
    }
    
    private var subscriptions = Set<AnyCancellable>()
}
