//
//  GalleryTableViewCell.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var lazyImageView: LazyImageView!
    
    @IBOutlet weak var animalNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
