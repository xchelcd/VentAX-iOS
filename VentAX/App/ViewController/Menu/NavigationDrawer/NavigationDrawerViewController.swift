//
//  NavigationDrawerViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 09/04/21.
//

import UIKit
import LGSideMenuController

class NavigationDrawerViewController: UIViewController {
    
    var loginModel:LoginModel?
    
    lazy var itemOptions: [ItemNavegationOption?] = [
        /*ItemNavegationOption(id: Constants.POS_MENU, icon: (UIImage(systemName: "homekit")?.withRenderingMode(.alwaysOriginal))!, title: "Menú"),
        ItemNavegationOption(id: Constants.POS_PROFILE, icon: (UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Mi perfil"),
        ItemNavegationOption(id: Constants.POS_CART, icon: (UIImage(systemName: "cart.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Carrito"),
        ItemNavegationOption(id: Constants.POS_COMPANY, icon: (UIImage(systemName: "building.2.crop.circle.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Mi empresa"),
        ItemNavegationOption(id: Constants.POS_ORDER, icon: (UIImage(systemName: "list.bullet.rectangle")?.withRenderingMode(.alwaysOriginal))!, title: "Pedidos"),
        ItemNavegationOption(id: Constants.POS_PRODUCT, icon: (UIImage(systemName: "plus.square.fill.on.square.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Productos"),
        ItemNavegationOption(id: Constants.POS_SETTINGS, icon: (UIImage(systemName: "wrench.and.screwdriver.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Configuración"),
        ItemNavegationOption(id: Constants.POS_FAQ, icon: (UIImage(systemName: "person.fill.questionmark")?.withRenderingMode(.alwaysOriginal))!, title: "FAQ"),
        ItemNavegationOption(id: Constants.POS_IDAX, icon: (UIImage(systemName: "homekit")?.withRenderingMode(.alwaysOriginal))!, title: "IDAX™"),
        ItemNavegationOption(id: Constants.POS_LOG_OUT, icon: (UIImage(systemName: "escape")?.withRenderingMode(.alwaysOriginal))!, title: "Cerrar Sesión")*/
    ]
    private let cellName = "CellNavigationTableViewCell"
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillMenuList()
        setupTable()
    }
}

extension NavigationDrawerViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CellNavigationTableViewCell
        
        guard let item = itemOptions[indexPath.row] else { return UITableViewCell()}
       
        cell.titleLabel.text = item.title
        cell.iconImageView.image = item.icon
        cell.iconImageView.image? = (cell.iconImageView.image?.withRenderingMode(.alwaysTemplate))!
        cell.iconImageView.tintColor = UIColor(named: "blueGrayVentax")
        cell.selectedBackgroundView = changeColorCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CellNavigationTableViewCell
        cell.titleLabel.textColor = UIColor.black
        cell.iconImageView.tintColor = UIColor(named: "fucsiaVentax")
        
        guard let item = itemOptions[indexPath.row] else { return }
        switch item.id {
        case Constants.POS_MENU: menu()
        case Constants.POS_PROFILE: profile()
        case Constants.POS_CART: cart()
        case Constants.POS_COMPANY: company()
        case Constants.POS_ORDER: order()
        case Constants.POS_PRODUCT: product()
        case Constants.POS_SETTINGS: setttings()
        case Constants.POS_FAQ: faq()
        case Constants.POS_IDAX: idax()
        case Constants.POS_LOG_OUT: logOut()
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CellNavigationTableViewCell
        cell.titleLabel.textColor = UIColor.white
        cell.iconImageView.tintColor = UIColor(named: Colors.blueGrayVentax)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.0)
    }
}

extension NavigationDrawerViewController{
    private func menu(){
        print("home")
        guard let viewController = Util.myInstance else { return }//HomeViewController()
        guard let model = loginModel else { return }
        viewController.loginModel = model
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        let main = UINavigationController(rootViewController: viewController)
        self.sideMenuController?.rootViewController? = main
        
    }
    private func profile(){
        print("profile")
        let viewController = ProfileViewController()
        guard let model = loginModel else { return }
        viewController.user = model.user
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        self.sideMenuController?.rootViewController? = viewController
    }
    private func cart(){
        print("cart")
    }
    private func company(){
        print("company")
        let viewController = CompanyViewController()
        guard let model = loginModel else { return }
        viewController.company = model.entrepreneurModel?.company
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        self.sideMenuController?.rootViewController? = viewController
    }
    private func order(){
        print("order")
    }
    private func product(){
        print("product")
        let viewController = ProductViewController()
        guard let model = loginModel else { return }
        viewController.design = model.entrepreneurModel?.design
        viewController.productList = model.entrepreneurModel?.productList
        viewController.company = model.entrepreneurModel?.company
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        self.sideMenuController?.rootViewController? = viewController
    }
    private func setttings(){
        print("setttings")
        let viewController = SettingsViewController()
        guard let model = loginModel else { return }
        viewController.entrepreneurModel = model.entrepreneurModel
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        self.sideMenuController?.rootViewController? = viewController
    }
    private func faq(){
        print("faq")
        let viewController = FAQViewController()
        guard let model = loginModel else { return }
        viewController.company = model.entrepreneurModel?.company
        viewController.faqList = model.entrepreneurModel?.faqList
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        self.sideMenuController?.rootViewController? = viewController
    }
    private func idax(){
        print("idax")
        let viewController = IDAXViewController()
        viewController.user = loginModel?.user
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        self.sideMenuController?.rootViewController? = viewController
    }
    
    private func logOut(){
        print("logOut")
        let viewModel = LogoutViewModel(userId: loginModel!.user.id, token: self.getTokenValue())
        viewModel.onFinished = { (onSuccess) in
            if onSuccess {
                //MARK: - cerrar sesión
                DispatchQueue.main.async {
                    let viewController = LoginViewController()
                    viewController.modalPresentationStyle = .fullScreen
                    self.show(viewController, sender: self)
                    //self.present(viewController, animated: true, completion: nil)
                    //MARK: - Delete token
                    //UserDefaults.standard.set(fcmToken, forKey: Constants.APNsToken)
                    UserDefaults.standard.removeObject(forKey: Constants.IS_LOGGED_KEY)
                }
            }
 
        }
    }
}


extension NavigationDrawerViewController{
    private func setupTable(){
        let nib = UINib(nibName: cellName, bundle: nil)
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.register(nib, forCellReuseIdentifier: cellName)
    }
    
    private func fillMenuList(){
        itemOptions = [
            ItemNavegationOption(id: Constants.POS_MENU, icon: (UIImage(systemName: "house")?.withRenderingMode(.alwaysOriginal))!, title: "Menú"),
            ItemNavegationOption(id: Constants.POS_PROFILE, icon: (UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Mi perfil"),
            ItemNavegationOption(id: Constants.POS_CART, icon: (UIImage(systemName: "cart.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Carrito"),
            ItemNavegationOption(id: Constants.POS_COMPANY, icon: (UIImage(systemName: "building.2.crop.circle.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Mi empresa"),
            ItemNavegationOption(id: Constants.POS_ORDER, icon: (UIImage(systemName: "list.bullet.rectangle")?.withRenderingMode(.alwaysOriginal))!, title: "Pedidos"),
            ItemNavegationOption(id: Constants.POS_PRODUCT, icon: (UIImage(systemName: "plus.square.fill.on.square.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Productos"),
            ItemNavegationOption(id: Constants.POS_SETTINGS, icon: (UIImage(systemName: "wrench.and.screwdriver.fill")?.withRenderingMode(.alwaysOriginal))!, title: "Configuración"),
            ItemNavegationOption(id: Constants.POS_FAQ, icon: (UIImage(systemName: "person.fill.questionmark")?.withRenderingMode(.alwaysOriginal))!, title: "FAQ"),
            
            //nil, nil,
            
            ItemNavegationOption(id: Constants.POS_IDAX, icon: (UIImage(named: "Ventax_logo")?.withRenderingMode(.alwaysOriginal))!, title: "IDAX™"),
            ItemNavegationOption(id: Constants.POS_LOG_OUT, icon: (UIImage(systemName: "escape")?.withRenderingMode(.alwaysOriginal))!, title: "Cerrar Sesión")
        ]
    }
}

extension NavigationDrawerViewController{
    private func changeColorCell() -> UIView{
        let view = UIView()
        view.backgroundColor = UIColor(named: "blueVentax")?.withAlphaComponent(CGFloat(0.0))
        return view
    }
}
