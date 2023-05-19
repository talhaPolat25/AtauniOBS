//
//  OgretmenNotTableViewCell.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//

import UIKit

class OgretmenNotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblVize: UILabel!
    
    @IBOutlet weak var lblFinal: UILabel!
    @IBOutlet weak var lblOgrenciAd: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnNotGuncelleClicked(_ sender: UIButton) {
    }
    
}
