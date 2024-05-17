//
//  NewsTableCell.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import UIKit

class NewsTableCell: UITableViewCell {

   
    // MARK: - IBOutlets
    @IBOutlet weak var thumbnailImg:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var dateLbl:UILabel!
    @IBOutlet weak var bgViewofTitleAndDate:UIView!
    
    
    // MARK: - Variables and Constant
    
    
    //MARK: - UICell Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgViewofTitleAndDate.setViewCard(0)
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        removeSkeletonEffect()
    }
    // MARK: - IBActions
    
    
    // MARK: - Helper Methods
    
    
    // MARK: - #Selectors
    
    
    // MARK: - User Methods
    func setData(news:News){
        self.titleLbl.text = news.title ?? ""
        self.dateLbl.text = news.updated?.timeAgo()
        if let thumbnailURL = news.media?.first(where: {$0.type == .image})?.mediaMetadata?.first(where: {$0.format == .standardThumbnail})?.url {
            thumbnailImg.setImage(fromURLString: thumbnailURL)
        }
    }
    
    func addShimmerEffect(){
        thumbnailImg.startSkeleton()
        titleLbl.startSkeleton()
        dateLbl.startSkeleton()
    }
    func removeSkeletonEffect(){
        thumbnailImg.stopSkeleton()
        titleLbl.stopSkeleton()
        dateLbl.stopSkeleton()
    }
    
    
}
