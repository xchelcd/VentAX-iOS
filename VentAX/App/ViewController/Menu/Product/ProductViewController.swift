//
//  ProductViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 15/04/21.
//

import UIKit

class ProductViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var mainView: UIView!
    
    //MARK: - Variables
    var design:Design?
    var productList:[Product]?
    var company:Company?
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
        
        setupViews()
        setupTable()
    }

    //MARK: - IBOutlets
    @IBAction func infoButton(_ sender: Any) {
        
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
        sideMenuController?.showLeftView(animated: true, completion: nil)
    }
    

}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CellProductTableViewCell
        let item = productList![indexPath.row]
        
        cell.titleLabel.text = item.name
        cell.priceLabel.text = "\(item.price)"
        cell.descriptionLabel.text = item.description
        cell.mainView.backgroundColor = UIColor().hexToColor(hex:design!.cardBackground)
        cell.stateProductOutlet.isHidden = false
        cell.mainView.layer.cornerRadius = 10
        cell.selectedBackgroundView = viewSelected
        cell.layer.cornerRadius = 20
        
        guard let company = self.company else { return cell}
        let imagePath = "\(Constants.MAIN_URL)IMAGES/\(company.id)_\(company.name)/\(item.id)_\(item.name.replacingOccurrences(of: " ", with: "_")).jpg"
        cell.productImageView.imageFromServer(url: imagePath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = productList![indexPath.row]
        let image = (tableView.cellForRow(at: indexPath) as! CellProductTableViewCell).productImageView.image

        let viewController = ProductDialog()
        viewController.design = design
        viewController.product = item
        viewController.modalPresentationStyle = .popover
        viewController.image = image
        viewController.isEdit = true
        
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        175.0
    }
}


extension ProductViewController{
    private func setupViews(){
        self.hideKeyboard()
        mainView.designBorder()
        
        guard let productList = productList else{
            //MARK: - Back to menu
            return
        }
    }
    
    private func setupTable(){
        let nib = UINib(nibName: cellName, bundle: nil)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(nib, forCellReuseIdentifier: cellName)
    }
}
