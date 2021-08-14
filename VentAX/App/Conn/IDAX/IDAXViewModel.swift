//
//  IDAXViewModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 23/04/21.
//

import Foundation
import UIKit

class IDAXViewModel: NSObject{
    
    private var conn: IDAXService!
    private var loadingDialog = LoadingDialog()
    var dialog: ReloadDialogDelegate!
    
    private (set) var isSuccessful:Bool!{
        didSet{
            DispatchQueue.main.async {
                self.onSentDataSuccess(self.isSuccessful)
                self.dialog.showNewMessage(message: "Enviado.")
            }
        }
    }
    
    var onSentDataSuccess: (_ isSuccess:Bool) -> () = {_ in}
    
    override init() {
        super.init()
    }
    
    init(userId:Int, suggestion:String) {
        super.init()
        dialog = loadingDialog
        doRequest(userId, suggestion)
    }
    
    
    private func doRequest(_ userId: Int, _ suggestion:String){
        loadingDialog.showLoadingDialog(title: "Enviando...")
        IDAXService().InsertSuggestion(userId, suggestion) { (finished) in
            self.isSuccessful = finished
        }
    }
}
