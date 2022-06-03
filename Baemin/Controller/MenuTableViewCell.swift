//
//  MenuTableViewCell.swift
//  Baemin
//
//  Created by 강창혁 on 2022/06/03.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menudescription: UILabel!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
