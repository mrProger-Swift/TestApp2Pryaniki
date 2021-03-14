//
//  HzTableViewCell.swift
//  TestAppPryaniki
//
//  Created by User on 12.03.2021.
//

import UIKit

class HzTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hzLabel: UILabel!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: - Cell configure
    func cellConfigure(data: Data) {
        hzLabel.text = data.text
    }
}
