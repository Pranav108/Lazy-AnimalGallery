//
//  LazyImageView.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import UIKit

class LazyImageView : UIImageView {

    private let imageCache = NSCache<AnyObject,UIImage>()
//    var switchState = true;
    
    func loadImage(fromURL url : URL, with placeHolderImage : String, for switchState : Bool){
        
        self.image = UIImage(named: placeHolderImage)
        if switchState, let cachedImage = self.imageCache.object(forKey: url as AnyObject){
            print("image loaded from cache : \(url.absoluteString)")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData){
                    
                    if switchState {
                        self.imageCache.setObject(image, forKey: url as AnyObject )
                    }
                    
                    print("image loaded from API call")
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
