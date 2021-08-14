//
//  HomeViewModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 17/04/21.
//

import Foundation

class HomeViewModel: NSObject {
    
    private var conn: HomeService!
    private let loadinDialog = LoadingDialog()
    var dialog_: ReloadDialogDelegate!
    
    private (set) var entreprenuerModel:EntrepreneurModel!{
        didSet{
            self.bindData(entreprenuerModel)
        }
    }
    private (set) var error: String!{
        didSet{
            DispatchQueue.main.async{
                self.dialog_!.showNewMessage(message:"Error en el servidor")
            }
            self.dataCorrupted()
        }
    }
    private (set) var finish: Int!{
        didSet{
            DispatchQueue.main.async {
                self.loadinDialog.dismiss()
            }
            self.finished(finish)
        }
    }
    
    var bindData:(_ model:EntrepreneurModel) -> () = {_ in}
    var dataCorrupted: () -> () = {}
    var finished: (_ end:Int) -> () = {_ in }
    
    override init() {
        super.init()
    }
    
    init(companyId:Int){
        super.init()
        loadinDialog.showLoadingDialog(title: "Cargando...")
        dialog_ = loadinDialog
        self.setupParams(companyId)
    }
    
    private func setupParams(_ companyId:Int){
        conn = HomeService()
        conn.getCompanyEntrepreneurModel(companyId) { (model) in
            self.entreprenuerModel = model
        } onError: { (error) in
            self.error = "Error del servidor"
        } onFinished: { (code) in
            self.finish = code
        }

    }
}
