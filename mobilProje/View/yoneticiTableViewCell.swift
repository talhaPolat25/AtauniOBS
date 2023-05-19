//
//  yoneticiTableViewCell.swift
//  mobilProje
//
//  Created by talha polat on 22.12.2022.
//

import UIKit

class yoneticiTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblUnvan: UILabel!
    @IBOutlet weak var imgOnay: UIImageView!
    
    @IBOutlet weak var lblAd: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
