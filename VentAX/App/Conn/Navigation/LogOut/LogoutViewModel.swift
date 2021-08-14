//
//  LogoutViewModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 23/04/21.
//

import Foundation
import UIKit

class LogoutViewModel:NSObject{
    private var conn: LogoutService!
    private let loadingDialog = LoadingDialog()
    var dialog_: ReloadDialogDelegate!
    
    private (set) var isLogged:Bool!{
        didSet{
            DispatchQueue.main.async {
                if self.isLogged{
                    self.loadingDialog.dismiss()
                }else{
                    self.loadingDialog.showNewMessage(message: "Ocurrió un error")
                }
                
            }
            self.onFinished(isLogged)
        }
    }
    
    var onFinished:(_ end:Bool) -> () = {_ in }
    
    override init(){
        super.init()
    }
    
    private var userId:Int!
    private var token:String!
    
    init(userId:Int, token:String){
        super.init()
        loadingDialog.showLoadingDialog(title: "Saliendo...")
        dialog_ = loadingDialog
        doRequest(userId, token)
    }
    
    private func doRequest(_ userId:Int, _ token:String){
        conn = LogoutService()
        conn.LogOutAccount(userId: userId, token: token) { (isLogged) in
            self.isLogged = isLogged
        }
    }
}
