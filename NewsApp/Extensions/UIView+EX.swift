//
//  UIView+EX.swift
//  Drinks
//
//  Created by M Usman on 16/05/2024.
//

import UIKit


extension UIView {
    
    private static var skeletonLayerKey = "skeletonLayer"
    func startSkeleton() {  
        if let _ = layer.value(forKey: UIView.skeletonLayerKey) as? CALayer {
            stopSkeleton()
        }
        
        let backgroundColor = UIColor(white: 0.9, alpha: 1)
        let bgLayer = CALayer()
        bgLayer.frame = bounds
        bgLayer.opacity = 1
        bgLayer.backgroundColor = UIColor.skeletonView.cgColor
        let skeletonLayer = CALayer()
        skeletonLayer.frame = bounds
        skeletonLayer.backgroundColor = backgroundColor.cgColor
        skeletonLayer.opacity = 0.5
        
        
        // Create animation
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 1
        animation.fromValue = -bounds.width
        animation.toValue = bounds.width
        animation.repeatCount = .infinity
        skeletonLayer.add(animation, forKey: "Skeleton")
        
        
        bgLayer.masksToBounds = true
        bgLayer.addSublayer(skeletonLayer)
        layer.addSublayer(bgLayer)
        layer.setValue(bgLayer, forKey: UIView.skeletonLayerKey)
    }
    
    func stopSkeleton() {
        // Remove the skeleton layer from the view
        if let skeletonLayer = layer.value(forKey: UIView.skeletonLayerKey) as? CALayer {
            skeletonLayer.removeFromSuperlayer()
            layer.setValue(nil, forKey: UIView.skeletonLayerKey)
        }
    }
    func setViewCard(_ cornerRadius: CGFloat = 10, _ shadowColor: CGColor = UIColor.shadow.cgColor , shadowWidth:CGFloat=2.0 , shadowHeight:CGFloat=5.0, borderColor: UIColor = .clear, borderSize: CGFloat = 0, shadowRadius: CGFloat = 2.0,offset: CGSize = CGSize(width: 0, height: 0)) {
        self.layer.masksToBounds = false
        self.layer.shadowColor =  shadowColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderSize
        self.layer.cornerRadius = cornerRadius
    }
}

