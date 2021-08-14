//
//  CompanyBottomSheet.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 16/04/21.
//

import UIKit

class CompanyBottomSheet: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var companyImgeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var socialMediaView: UIStackView!
    @IBOutlet weak var goOutlet: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    //MARK: - Variables
    var entrepreneurModel:EntrepreneurModel?
    var company:Company!
    var design:Design!
    var scheduleList:[Schedule]?
    var productList:[Product]?
    var socialMediaList:[SocialMedia]?
    var user:User!
    
    //MKAR: - Extra
    var aux:GoToCompanyDelegate!
    var vc:HomeViewController?
    
    
    //MARK: - BottomSheet
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
        
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    //IBActions
    @IBAction func goButton(_ sender: Any) {
        //MARK: - go to new viewController
        goToCompany(company: company)
    }
    @IBAction func schedulesButton(_ sender: Any) {
        //MARK: - openDialog from schedule
        print("schedule")
        guard let scheduleList = scheduleList else { return }
        print(scheduleList)
    }
}

extension CompanyBottomSheet{
    
    private func setupView(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        companyImgeView.layer.cornerRadius = 25
        goOutlet.layer.cornerRadius = 15
        socialMediaView.layer.cornerRadius = 15
        mainView.layer.cornerRadius = 25
        
    }
    private func setupData(){
        guard let model = entrepreneurModel else { return }
        company = model.company
        design = model.design
        let imagePath = "\(Constants.MAIN_URL)IMAGES/\(company.id)_\(company.name.uppercased())/\(company.name.uppercased()).jpg"
        
        goOutlet.backgroundColor? = UIColor().hexToColor(hex: design.cardBackground, alpha: 0.7)
        socialMediaView.backgroundColor? = UIColor().hexToColor(hex: design.cardBackground, alpha: 0.7)
        companyImgeView.imageFromServer(url: imagePath)
        
        nameLabel.text = company.name
        nameLabel.textColor = UIColor().hexToColor(hex: design.titleColor)
        descriptionLabel.text = company.description
        descriptionLabel.textColor = UIColor().hexToColor(hex: design.textColor)
        
        mainView.backgroundColor = UIColor().hexToColor(hex: design.cardBackground)
        //MARK: - fill socialMedia
        fillSocialMedia(socialMediaList: model.socialMediaList!)
    }
    
    private func showSchedules(scheduleList:[Schedule]){
        
    }
    
    private func fillSocialMedia(socialMediaList:[SocialMedia]){
        print(socialMediaList)
        for sm in socialMediaList{
            let button = XButton()
    
            let name = Util.getSocialMedia(socialMediaId: sm.socialMediaId)
            
            button.setImage(UIImage(named:name), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.socialMediaCode = sm.code
            button.socialMediaId = sm.socialMediaId
            button.addTarget(self, action: #selector(goToSocialMedia), for: .touchUpInside)
            
            socialMediaView.addArrangedSubview(button)
        }
    }
    
    @objc func goToSocialMedia(_ sender: XButton){
        Util.goToSocialMedia(socialMediaId: sender.socialMediaId!, code: sender.socialMediaCode!)
    }
    
    private func goToCompany(company:Company){
        //MARK: - Show new viewController
        print("Pressed")
        aux = vc!
        aux.goToCompany()
        /*
        let v = UIViewController()
        v.view.backgroundColor = .red
        //v.navigationController?.navigationBar.isHidden = false
        print(navigationController?.viewControllers.count ?? "Default")
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(v, animated: true)
        b = true
        */
    }
}

protocol GoToCompanyDelegate{
    //func goToCompany(entrepreneurModel:EntrepreneurModel, user:User)
    func goToCompany()
}
