//
//  DetailVC.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var newsImg:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var dateLbl:UILabel!
    @IBOutlet weak var abstractLbl:UILabel!
    @IBOutlet weak var byLineLbl:UILabel!
    @IBOutlet weak var captionLbl:UILabel!
    
    
    // MARK: - Variables and Constant
    
    var viewModel = DetailViewModel()
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let news = viewModel.news {
            assignValuesToUI(news: news)
        }
    }
    
    
    // MARK: - IBActions
    
    
    // MARK: - Helper Methods
    
    
    // MARK: - #Selectors
    
    // MARK: - User Methods
    func assignValuesToUI(news:News){
        self.navigationItem.title = news.type?.rawValue ?? ""
        self.titleLbl.text = news.title ?? ""
        self.dateLbl.text = news.updated?.timeAgo()
        abstractLbl.text = news.abstract ?? ""
        byLineLbl.text = "By: \(news.byline ?? "")"
        captionLbl.text = news.media?.first(where: {$0.type == .image})?.caption ?? ""
        if let thumbnailURL = news.media?.first(where: {$0.type == .image})?.mediaMetadata?.first(where: {$0.format == .mediumThreeByTwo440})?.url {
            newsImg.setImage(fromURLString: thumbnailURL)
        }
    }

}
