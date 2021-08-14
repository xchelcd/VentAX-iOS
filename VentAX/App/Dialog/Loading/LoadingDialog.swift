//
//  LoadingDialog.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 08/04/21.
//

import UIKit
import Foundation

class LoadingDialog: UIView {
    
    //static let instance = LoadingDialog()
    
    // MARK: - Outlets
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var topView:UIView!
    @IBOutlet weak var secondTopView: UIView!
    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var okButtonOutlet: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("LoadingDialog", owner: self, options: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func okButton(_ sender: Any) {
        //close loading dialog
        dismiss()
    }
    
    func showLoadingDialog(title:String){
        titleLabel.text = title
        UIApplication.shared.windows.first{$0.isKeyWindow}?.addSubview(parentView)
    }
    func dismiss(){
        parentView.removeFromSuperview()
    }
    
}

extension LoadingDialog{
    private func setupViews(){
        topView.layer.cornerRadius = 30
        topView.layer.borderWidth = 2
        topView.layer.borderColor = UIColor(named: "fucsiaVentax")?.cgColor
        secondTopView.layer.cornerRadius = 30
        secondTopView.layer.borderWidth = 2
        secondTopView.layer.borderColor = UIColor(named: "fucsiaVentax")?.cgColor
        
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 2
        mainView.layer.borderColor = UIColor(named: "fucsiaVentax")?.cgColor
        topView.sendSubviewToBack(mainView)
        
        let screen = UIScreen.main.bounds
        parentView.frame = CGRect(x: 0, y: 0, width: screen.width, height: screen.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension LoadingDialog: ReloadDialogDelegate{
    func showNewMessage(message: String) {
        
        //change title
        self.titleLabel.text = message
        //show button to close dialog
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.okButtonOutlet.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self
        }
        
    }
    
    
}
