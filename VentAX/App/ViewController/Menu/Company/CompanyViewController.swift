//
//  ProfileViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 10/04/21.
//

import UIKit

class CompanyViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var nameCompanyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var typeAccountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - ActionsOutlet
    @IBOutlet weak var upgradeOutlet: UIButton!
    @IBOutlet weak var statisticsOutlet: UIButton!
    @IBOutlet weak var suspendOutlet: UIButton!
    
    //MARK: - Variables
    var company:Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        inits()
        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func sideMenuButton(_ sender: Any) {
        print("sideMenu")
        self.sideMenuController?.showLeftView(animated: true, completion: nil)
    }
    @IBAction func upgradeAccountButton(_ sender: Any) {
    }
    @IBAction func showStatisticsButton(_ sender: Any) {
    }
    @IBAction func suspendCompanyButton(_ sender: Any) {
    }
    @IBAction func infoButton(_ sender: Any) {
    }
    @objc
    func changeCompanyImage(_ sender: Any){
        print(company?.name)
    }
}

extension CompanyViewController{
    private func setupView(){
        companyImageView.designImage1()
        upgradeOutlet.designButton1()
        statisticsOutlet.designButton1()
        suspendOutlet.designButton1()
        mainView.designBorder()
    }
    private func inits(){
        guard let company = self.company else {
            
            return
        }
        let imagePath = "\(Constants.MAIN_URL)IMAGES/\(company.id)_\(company.name.uppercased())/\(company.name.uppercased()).jpg"
        companyImageView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(changeCompanyImage(_:))))
        companyImageView.imageFromServer(url: imagePath)
        nameCompanyLabel.text = company.name
        descriptionLabel.text = company.description
        categoryLabel.text = Util.getCategory(categoryId: company.category)
        typeAccountLabel.text = Util.getAccount(accountType: company.priority)
        addressLabel.text = company.address ?? defaultMesage.noEspecificado.rawValue
        titleLabel.text = company.name
        setStateCompany(state: company.active)
    }
    
    private func setStateCompany(state:Int){
        stateLabel.text = state == 1 ? defaultMesage.active.rawValue : defaultMesage.desactive.rawValue
        suspendOutlet.setTitle(state == 1 ? defaultMesage.suspendCompany.rawValue : defaultMesage.activeCompany.rawValue , for: .normal)
    }
}
