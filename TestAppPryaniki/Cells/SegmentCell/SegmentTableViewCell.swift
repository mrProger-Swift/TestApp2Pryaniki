//
//  SegmentTableViewCell.swift
//  TestAppPryaniki
//
//  Created by User on 12.03.2021.
//

import UIKit
protocol segmentedControllDelegate{
    func segmentChosen ( _ selector: UISegmentedControl, label: UILabel)
}

class SegmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentLabel: UILabel!
    
    @IBAction func segmentedControl(_ sender: Any) {
        delegate.segmentChosen(segmentedControl, label: segmentLabel)
    }
    // MARK: - Cell properties
    var delegate: segmentedControllDelegate!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    // MARK: - Cell configure
    func cellConfigure(data: Data) {
        if let option = data.variants {
            for variant in option {
                segmentedControl.setTitle(String(variant.id), forSegmentAt: variant.id - 1)}
            if let id = data.selectedId {
                segmentedControl.selectedSegmentIndex = id - 1
                segmentLabel.text = option[id - 1].text
            }
        }
    }
}
