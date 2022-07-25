//
//  TakerMessageCellVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var tableCell: UIView!
    @IBOutlet weak var emoticonLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableCell.layer.cornerRadius = 14
        
    }
}
