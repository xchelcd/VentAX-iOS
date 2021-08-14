//
//  IDAXViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 11/04/21.
//

import UIKit

class IDAXViewController: UIViewController {

    @IBOutlet weak var opinioTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        setupDesign()
    }
    @IBAction func sideMenuButton(_ sender: Any) {
        sideMenuController?.showLeftView(animated: true, completion: nil)
    }
    @IBAction func sendButton(_ sender: Any) {
        if opinioTextField.text != "" {
            guard let user = user else { return }
            let viewModel = IDAXViewModel(userId: user.id, suggestion: opinioTextField.text!)
            viewModel.onSentDataSuccess = { (isFinished) in
                if isFinished {
                    DispatchQueue.main.async {
                        self.opinioTextField.text = ""
                    }
                }
            }
        }
    }
    
}

extension IDAXViewController{
    private func setupDesign(){
        mainView.designBorder()
    }
}
