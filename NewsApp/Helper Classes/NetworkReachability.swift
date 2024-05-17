//
//  NetworkReachability.swift
//  NewsApp
//
//  Created by M Usman on 16/05/2024.
//

import Network

class NetworkReachability {
    static func isInternetAvailable() -> Bool {
        let monitor = NWPathMonitor()
        let semaphore = DispatchSemaphore(value: 0)
        var isConnected = false
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
            } else {
                isConnected = false
            }
            semaphore.signal()
        }
        
        monitor.start(queue: DispatchQueue.global(qos: .background))
        semaphore.wait()
        return isConnected
    }
}
