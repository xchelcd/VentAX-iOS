//
//  EntrepreneurViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 17/04/21.
//

import UIKit

class EntrepreneurViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var entrepreneurModel:EntrepreneurModel?
    var user:User?
    var productList:[Product]?
    
    let cellName = "CellProductTableViewCell"
    var viewSelected:UIView {
        get{
            let view = UIView()
            view.backgroundColor = UIColor(named: "fucsiaVentax")?.withAlphaComponent(CGFloat(0.0))
            return view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = entrepreneurModel else { return }
        setupView(entrepreneurModel: model)
        setupTable()
    }


}


extension EntrepreneurViewController{
    private func setupView(entrepreneurModel:EntrepreneurModel){
        title = "Bienvenido a \(entrepreneurModel.company.name)"
        mainView.backgroundColor = UIColor().hexToColor(hex: entrepreneurModel.design.mainBackground)
        
        productList = entrepreneurModel.productList
        
    }
    
    private func setupTable(){
        let nib = UINib(nibName: cellName, bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: cellName)
    }
}

extension EntrepreneurViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entrepreneurModel!.productList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CellProductTableViewCell
        let item = productList![indexPath.row]
        
        cell.titleLabel.text = item.name
        cell.priceLabel.text = "\(item.price)"
        cell.descriptionLabel.text = item.description
        cell.mainView.backgroundColor = UIColor().hexToColor(hex:(entrepreneurModel?.design.cardBackground)!)
        cell.stateProductOutlet.isHidden = true
        cell.mainView.layer.cornerRadius = 10
        cell.selectedBackgroundView = viewSelected
        cell.layer.cornerRadius = 20
        
        guard let company = entrepreneurModel?.company else { return cell}
        let imagePath = "\(Constants.MAIN_URL)IMAGES/\(company.id)_\(company.name)/\(item.id)_\(item.name.replacingOccurrences(of: " ", with: "_")).jpg"
        cell.productImageView.imageFromServer(url: imagePath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = productList![indexPath.row]
        print(item.name)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        175.0
    }
}
