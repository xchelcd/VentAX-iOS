//
//  LoginViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import UIKit
import LGSideMenuController

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var phoneTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    // MARK: - IBActions
    @IBOutlet weak var loginOutlet: UIButton!
    
    // MARK: - Variables
    private let homeViewController = HomeViewController()
    private var loginViewModel: LoginViewModel!
    private var loginModel:LoginModel?
    
    let loadinDialog = LoadingDialog()
    
    var dialog_: ReloadDialogDelegate!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inits()
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let phone = phoneTextField.text, let password = passwordTextField.text else { return }
        
        loadinDialog.showLoadingDialog(title: "Conectando...")
        
        loginViewModel = LoginViewModel(id:-1, phone: phone, password: password, token: self.getTokenValue(), isLogged:false)
        loginViewModel.bindData = { (model) in
            self.loginModel = model
            self.requestSuccess()
        }
        loginViewModel.dataCorrupted = {
            self.requestError()
        }
        loginViewModel.finished = { (code) in
            //0 -> ok
            //-1 -> empty data
            //1 -> error request
            switch code {
            case 0:
                self.requestCompleted()
            case -1:
                self.emptyFields()
            default:
                self.requestError()
            }
        }
        /*
        homeViewController.modalTransitionStyle = .flipHorizontal
        //homeViewController.modalTransitionStyle = .partialCurl
        homeViewController.modalPresentationStyle = .fullScreen
        //homeViewController.loginModel = loginModel
        self.present(homeViewController, animated: true, completion: nil)
        AppDelegate().window?.rootViewController = homeViewController
 */
    }
    
    @IBAction func registerButton(_ sender: Any) {
        //show registerDailog
    }
}

// MATK: - functions rsponse
extension LoginViewController {
    
    private func requestCompleted(){
        //hide loadingDialog automatically
        DispatchQueue.main.async {
            self.loadinDialog.dismiss()
        }
    }
    private func requestError(){
        //show error dialog
        DispatchQueue.main.async{
            self.dialog_!.showNewMessage(message:"Error de conexión")
        }
        
    }
    private func requestSuccess(){
        //change viewController
        DispatchQueue.main.async{
            self.goToMenu()
        }
        
    }
    private func emptyFields(){
        //show dialog telling us
        DispatchQueue.main.async{
            self.dialog_?.showNewMessage(message:"Campos vacíos")
        }
        //hide loadingDialog manually
    }
    
    private func goToMenu(){
        guard let model = loginModel else{ return }
        let rootViewController = HomeViewController()
        rootViewController.loginModel = model
        let leftViewController = NavigationDrawerViewController()
        leftViewController.loginModel = model
        
        let sideMenuController = LGSideMenuController(rootViewController: rootViewController, leftViewController: leftViewController, rightViewController: NavigationDrawerViewController())
        sideMenuController.leftViewWidth = 230
        sideMenuController.leftViewBackgroundColor = UIColor(named: "blueVentax")!
        sideMenuController.leftViewPresentationStyle = .scaleFromBig
        sideMenuController.modalTransitionStyle = .crossDissolve
        sideMenuController.modalPresentationStyle = .fullScreen
        self.present(sideMenuController, animated: true, completion: nil)
        AppDelegate().window?.rootViewController = homeViewController
        //MARK: - todo -> save user defaults
        let data = try? JSONEncoder().encode(model.user)
        UserDefaults.standard.set(data, forKey: Constants.IS_LOGGED_KEY)
    }
}

// MARK: - Settings
extension LoginViewController{
    private func inits(){
        self.hideKeyboard()
        loginOutlet.designLogin()
        phoneTextField.designIsSelected(selected: false)
        passwordTextField.designIsSelected(selected: false)
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        
        dialog_ = loadinDialog
    }
}

//MARK: - Protocols
extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.designIsSelected(selected: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.designIsSelected(selected: false)
    }
}

protocol ReloadDialogDelegate{
    func showNewMessage(message:String)
}


