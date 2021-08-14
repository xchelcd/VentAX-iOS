//
//  HomeViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import UIKit
import LGSideMenuController

class HomeViewController: UIViewController {
    static let homeInstance = HomeViewController()
    
    //MARK: - Constants
    private let cellFavName = "CellFavHomeViewTableViewCell"
    private let cellMainName = "CellHomeViewTableViewCell"
    private let hearth = "heart"
    private let hearthFill = "heart.fil"
    private var imagePath = ""
    
    //MARK: - OutLets
    @IBOutlet weak var favCompaniesTableView: UITableView!
    @IBOutlet weak var mainTableView: UITableView!
    
    //MARK: - Variables
    var loginModel:LoginModel?
    var user:User!
    var companyList:[Company]?
    var entrepreneursModel: EntrepreneurModel?
    var entrepreneursCompanyModel:EntrepreneurModel?
    var viewSelected:UIView {
        get{
            let view = UIView()
            view.backgroundColor = UIColor(named: "fucsiaVentax")?.withAlphaComponent(CGFloat(0.0))
            return view
        }
    }
    
    //MARK: - Aux
    var slideVC:CompanyBottomSheet!
    var b = false

    override func viewDidLoad() {
        super.viewDidLoad()
        inits()
        setData()
        setupTable()
        title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //MARK: - comment
        
        if b{
            navigationController?.navigationBar.isHidden = true
        }
    }
    
    //MARK: - Actions
    @IBAction func showMenuButton(_ sender: Any) {
        self.sideMenuController?.showLeftView()
    }
    @IBAction func openFilterButton(_ sender: Any) {
        //MARK: - comment
        //MARK: - si cambio de root y regreso a Home() no va de nuevo a la vista secundaria
        
    }
    
}

//MARK: - MainTableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        companyList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellMainName, for: indexPath) as! CellHomeViewTableViewCell
        let item = companyList![indexPath.row]
        imagePath = "\(Constants.MAIN_URL)IMAGES/\(item.id)_\(item.name.uppercased())/\(item.name.uppercased()).jpg"
        cell.titleCompanyLabel.text = item.name
        cell.favOutlet.setImage(UIImage(systemName: hearth), for: .normal)
        cell.companyImageView?.imageFromServer(url: imagePath)
        cell.selectedBackgroundView = viewSelected
        cell.layer.cornerRadius = 25
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = tableView.cellForRow(at: indexPath)
        let item = companyList![indexPath.row]
        print(item.name)
        request(companyId:item.id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        175.0
    }
}

//MARK: - setup data
extension HomeViewController{
    private func inits(){
        self.hideKeyboard()
    }
    
    private func setData(){
        guard let model = loginModel else { return }
        self.user = model.user
        if let companies = model.companyList{
            companyList = companies
        }
        if let entrepreneur = model.entrepreneurModel{
            entrepreneursModel = entrepreneur
        }
    }
}


//MARK: - setup tables
extension HomeViewController{
    private func setupTable(){
        let nibMain = UINib(nibName: cellMainName, bundle: nil)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(nibMain, forCellReuseIdentifier: cellMainName)
        
        /*
        let nibFav = UINib(nibName: cellFavName, bundle: nil)
        favCompaniesTableView.delegate = self
        favCompaniesTableView.dataSource = self
        favCompaniesTableView.register(nibFav, forCellReuseIdentifier: cellFavName)
        */
    }
    
    private func request(companyId:Int){
        let viewModel = HomeViewModel(companyId: companyId)
        viewModel.bindData = { (model) in
            //print(model)
            DispatchQueue.main.async {
                self.entrepreneursCompanyModel = model
                self.showMiracle(entrepreneurModel:model)
            }
        }
        viewModel.dataCorrupted = {
            print("error")
        }
        viewModel.finished = { (code) in
            print("finish")
            //0 -> ok
            //-1 -> empty data
            //1 -> error request
            /*switch code {
            case 0:
                self.requestCompleted()
            case -1:
                self.emptyFields()
            default:
                self.requestError()
            }*/
        }
        //showMiracle()
    }
}

extension HomeViewController{
    
    func showMiracle(entrepreneurModel: EntrepreneurModel) {
        //MARK: - send just entrepreneurModel
        /*slideVC.company = entrepreneurModel.company
        slideVC.design = entrepreneurModel.design
        slideVC.scheduleList = entrepreneurModel.scheduleList
        slideVC.productList = entrepreneurModel.productList
        slideVC.socialMediaList = entrepreneurModel.socialMediaList*/
        slideVC = CompanyBottomSheet()
        slideVC.entrepreneurModel = entrepreneurModel
        slideVC.user = user
        slideVC.vc = self
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    internal func goToCompany_(){
        slideVC.dismiss(animated: true) {
            let viewController = EntrepreneurViewController()
            viewController.entrepreneurModel = self.entrepreneursCompanyModel
            viewController.user = self.user
            
            //guard let nav = Util.myInstance else { return }
            
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(viewController, animated: true)
            //self.navigationController?.navigationBar.isHidden = false
            //self.navigationController?.pushViewController(viewController, animated: true)
            self.b = true
            
            /*let v = UIViewController()
            v.view.backgroundColor = .red
            //v.navigationController?.navigationBar.isHidden = false
            print(self.navigationController?.viewControllers.count ?? "Default")
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(v, animated: true)
            self.b = true*/
        }
        
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}


extension HomeViewController: GoToCompanyDelegate{
    func goToCompany() {
        goToCompany_()
    }
}
