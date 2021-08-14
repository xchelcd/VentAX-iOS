//
//  CellHomeViewTableViewCell.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 09/04/21.
//

import UIKit

class CellHomeViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var titleCompanyLabel: UILabel!
    @IBOutlet weak var favOutlet: UIButton!

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        companyImageView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favButton(_ sender: Any) {
        
    }
    
}
