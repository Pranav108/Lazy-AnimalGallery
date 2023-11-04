//
//  LazyImageView.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import UIKit

class LazyImageView : UIImageView {

    func loadImage(fromURL url : URL, with placeHolderImage : String){
        
        self.image = UIImage(named: placeHolderImage)
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
