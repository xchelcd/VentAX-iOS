//
//  CellProductTableViewCell.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 16/04/21.
//

import UIKit

class CellProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stateProductOutlet: UISwitch!
    
    //var myCompany:Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stateProductSwitch(_ sender: UISwitch) {
        print(sender.isOn)
    }
    
}
