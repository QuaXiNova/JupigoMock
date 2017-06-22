//
//  TabThreeTableViewCell.swift
//  Mock
//
//  Created by Michelle NW on 6/21/17.
//
//

import UIKit

class TabThreeTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var stackHeight: NSLayoutConstraint!
    
    var isExpanded: Bool = false
    {
        didSet
        {
            if !isExpanded {
                self.stackHeight.constant = 0.0
            } else {
                self.stackHeight.constant = 20.5
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
