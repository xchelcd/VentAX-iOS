//
//  CompanyViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 09/04/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var affiliateLabel: UILabel!
    @IBOutlet weak var dateAffiliateLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    //MARK: - Variables
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inits()
        setupDesign()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func sideMenuButton(_ sender: Any) {
        self.sideMenuController?.showLeftView(animated: true, completion: nil)
    }
    
}

extension ProfileViewController{
    private func inits(){
        guard let user = user else{
            //MARK: - go to homeViewController
            return
        }
        fullNameLabel.text = "\(user.name) \(user.lastName)"
        emailLabel.text = "\(user.email ?? defaultMesage.noEspecificado.rawValue)"
        phoneLabel.text = "\(user.ext) \(user.phone)"
        ageLabel.text = defaultMesage.noEspecificado.rawValue
        genderLabel.text = defaultMesage.noEspecificado.rawValue
        affiliateLabel.text = user.affiliate == 1 ? defaultMesage.affiliate.rawValue : defaultMesage.noAffiliate.rawValue
        dateAffiliateLabel.text = user.affiliate == 1 ? user.startDate : defaultMesage.empty.rawValue
    }
    private func setupDesign(){
        mainView.designBorder()
    }
}
