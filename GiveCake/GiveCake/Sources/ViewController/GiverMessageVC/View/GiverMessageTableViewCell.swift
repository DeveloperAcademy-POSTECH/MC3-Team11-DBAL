//
//  GiverMessageTableViewCell.swift
//  GiveCake
//
//  Created by KimJS on 2022/07/17.
//

import UIKit

class GiverMessageTableViewCell: UITableViewCell {

    @IBOutlet var lbTitleOfMessage: UILabel!
    @IBOutlet var lbBodyOfMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
