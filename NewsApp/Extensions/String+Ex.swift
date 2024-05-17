//
//  String+Ex.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import Foundation

extension String {
    func timeAgo() -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        let now = Date()
        let timeInterval = now.timeIntervalSince(date)
        
        
        let minute: TimeInterval = 60
        let hour: TimeInterval = minute * 60
        let day: TimeInterval = hour * 24
        
        if timeInterval < minute {
            return "just now"
        } else if timeInterval < hour {
            let minutes = Int(timeInterval / minute)
            return "\(minutes) min ago"
        } else if timeInterval < day {
            let hours = Int(timeInterval / hour)
            return "\(hours) hour\(hours > 1 ? "s" : "") ago"
        } else {
            let days = Int(timeInterval / day)
            return "\(days) day\(days > 1 ? "s" : "") ago"
        }
    }
}
