//
//  CellNavigationTableViewCell.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 09/04/21.
//

import UIKit

class CellNavigationTableViewCell: UITableViewCell {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
