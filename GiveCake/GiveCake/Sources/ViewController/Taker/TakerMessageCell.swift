//
//  TakerMessageCell.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class TakerMessageCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var emoticonLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 14
    }
    
}
