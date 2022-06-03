//
//  TableViewCell.swift
//  Baemin
//
//  Created by 강창혁 on 2022/05/31.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var tableVImage: UIImageView!
    @IBOutlet weak var tableVName: UILabel!
    @IBOutlet weak var tableVScore: UILabel!
    @IBOutlet weak var tableVMinimumOrderPrice: UILabel!
    @IBOutlet weak var tableVDeliveryTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
