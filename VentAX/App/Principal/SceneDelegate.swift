//
//  SceneDelegate.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import UIKit
import LGSideMenuController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    //let initialViewController = [LoginViewController(), HomeViewController()]
    
    private var loginViewModel: LoginViewModel!
    private var loginModel:LoginModel!
    
    var sideMenuController:LGSideMenuController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        initView(windowScene: scene)
    }
    
    private func initView(windowScene:UIWindowScene){
        window = UIWindow(windowScene: windowScene)
        if let data = (UserDefaults.standard.data(forKey: Constants.IS_LOGGED_KEY)) {
            do{
                let user:User = try JSONDecoder().decode(User.self, from: data)
                checkCredentials(user:user)
            } catch let error{
                print(error)
                defaultViewController(viewController: LoginViewController())
            }
        }else{
            defaultViewController(viewController: LoginViewController())
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate{
    func checkCredentials(user:User) {
        loginViewModel = LoginViewModel(id:user.id, phone: "\(user.phone)", password: "", token: "", isLogged:true)
        loginViewModel.bindData = { (model) in
            DispatchQueue.main.async{
                self.loginModel = model
                self.goToMenu(model:self.loginModel)
            }
        }
        loginViewModel.dataCorrupted = {
            DispatchQueue.main.async{
                self.defaultViewController(viewController: LoginViewController())
            }
        }
        /*loginViewModel.finished = { (code) in
            //0 -> ok
            //-1 -> empty data
            //1 -> error request
            DispatchQueue.main.async{
                self.defaultViewController(viewController: LoginViewController())
            }
        }*/
    }
    @objc func sideButton(){
        print("ssideButton")
        sideMenuController.showLeftView(animated: true, completion: nil)
        
    }
    
    private func goToMenu(model:LoginModel?){
        guard let model = loginModel/*model*/ else{ return }
        let rootViewController = HomeViewController()
        rootViewController.loginModel = model
        Util.myInstance = rootViewController
        let leftViewController = NavigationDrawerViewController()
        leftViewController.loginModel = model
        
        let main = UINavigationController(rootViewController: rootViewController)
        
        let buttonLeft = UIBarButtonItem(image:UIImage(systemName: "sidebar.left"), style: .done, target: self, action: #selector(sideButton))
        //rootViewController.navigationItem.leftBarButtonItem = buttonLeft
        main.title = "Home"
        main.navigationItem.leftBarButtonItem = buttonLeft
        main.navigationBar.isHidden = true
        
        sideMenuController = LGSideMenuController(rootViewController: /*rootViewController*/ main , leftViewController: leftViewController)
        sideMenuController.leftViewWidth = 230
        
        sideMenuController.leftViewBackgroundColor = UIColor(named: Colors.blueVentax)!
        sideMenuController.leftViewPresentationStyle = .scaleFromBig
        sideMenuController.modalTransitionStyle = .crossDissolve
        sideMenuController.modalPresentationStyle = .fullScreen
        defaultViewController(viewController: sideMenuController)
    }
    
    private func defaultViewController(viewController:UIViewController){
        //let viewController = initialViewController[active]
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
