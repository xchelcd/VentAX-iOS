//
//  LoginViewModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import Foundation

class LoginViewModel: NSObject {
    
    private var conn: LoginService!
    private (set) var loginModel: LoginModel!{
        didSet {
            self.bindData(loginModel)
        }
    }
    private (set) var error: String!{
        didSet{
            self.dataCorrupted()
        }
    }
    private (set) var finish: Int!{
        didSet{
            self.finished(finish)
        }
    }
    
    var bindData: (_ model:LoginModel) -> () = {_ in}
    var dataCorrupted: () -> () = {}
    var finished: (_ end:Int) -> () = {_ in }
    
    var id: Int?
    var phone: String?
    var password: String?
    var token: String?
    var logged:Bool?
    
    override init(){
        super.init()
        setupParams()
    }
    
    init(id:Int, phone: String, password: String?, token: String?, isLogged logged:Bool) {
        super.init()
        self.id = id
        self.phone = phone
        self.password = password
        self.token = token
        self.logged = logged
        self.setupParams()
    }
    
    func checkCredentials(_ id: Int, _ phone: String, _ password: String, _ token: String, _ logged:Bool){
        conn.checkCredentials(id, phone, password, token, logged) { (loginModel) in
            self.loginModel = loginModel
        } onError: { (error) in
            self.error = "Usuario o contraseña incorrectos"
        } onFinished: { (code) in
            self.finish = code
        }
    }
    
    private func setupParams(){
        conn = LoginService()
        if let id = self.id, let phone = self.phone, let password = self.password, let token = self.token, let logged = self.logged {
            checkCredentials(id, phone, password, token, logged)
        }else{
            self.finish = -1
        }
    }
}
