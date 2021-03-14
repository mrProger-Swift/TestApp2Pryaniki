//
//  PictureTableViewCell.swift
//  TestAppPryaniki
//
//  Created by User on 12.03.2021.
//
import UIKit
import SDWebImage

class PictureTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureLabel: UILabel!
    
    // MARK: - Cell configure
    func cellConfigure(data: Data) {
        if let url = data.url {
            let imageUrl = URL(string: url)
            pictureImageView.sd_setImage(with: imageUrl, completed: nil)
        }
        pictureLabel.text = data.text
    }
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
