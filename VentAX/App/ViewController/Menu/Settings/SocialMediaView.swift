//
//  SocialMediaView.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 11/04/21.
//

import UIKit

class SocialMediaView: UIView {
    
    //MARK: - Const
    let uncheck = "square.dashed"
    let check = "checkmark.square"
    let checkFilled = "checkmark.square.fill"
    
    //MARK: - IBOutlets
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var facebookTextField: UITextField!
    @IBOutlet weak var instagramTextField: UITextField!
    @IBOutlet weak var twitterTextField: UITextField!
    @IBOutlet weak var webTextField: UITextField!
    
    //MARK: - IBActions
    @IBOutlet weak var facebookOutlet: UIButton!
    @IBOutlet weak var instagramOutlet: UIButton!
    @IBOutlet weak var twitterOutlet: UIButton!
    @IBOutlet weak var webOutlet: UIButton!
    
    //MARK: - Variables
    var socialMediaList:[SocialMedia]?
    var checkBoxList:[UIButton] = []
    var textFieldList:[UITextField] = []
    let fb = 0
    let insta = 1
    let twi = 2
    let web = 3

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        Bundle.main.loadNibNamed("SocialMediaView", owner: self, options: nil)
        parentView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 5)
        self.addSubview(parentView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    //MARK: - IBActions
    @IBAction func infoButton(_ sender: Any) {
        
    }
    @IBAction func facebookButton(_ sender: UIButton) {
        buttonSelected(isSelected: sender.isSelected, button: sender, textField:facebookTextField, position:fb)
    }
    @IBAction func instagramButton(_ sender: UIButton) {
        buttonSelected(isSelected: sender.isSelected, button: sender, textField:instagramTextField, position:insta)
    }
    @IBAction func twitterButton(_ sender: UIButton) {
        buttonSelected(isSelected: sender.isSelected, button: sender, textField:twitterTextField, position:twi)
    }
    @IBAction func webButton(_ sender: UIButton) {
        buttonSelected(isSelected: sender.isSelected, button: sender, textField:webTextField, position:web)
    }
}


extension SocialMediaView{
    private func setupViews(){
        fillViewList()
        fillSocialMedia()
    }
    
    private func fillViewList(){
        checkBoxList = [facebookOutlet, instagramOutlet, twitterOutlet, webOutlet]
        textFieldList = [facebookTextField, instagramTextField, twitterTextField, webTextField]
    }
    
    private func fillSocialMedia(){
        setDefaultsValues()
        guard let socialMediaList = self.socialMediaList else { return }
        for sm in socialMediaList{
            let code = sm.code
            switch sm.socialMediaId {
            case 0:
                setSocialMedia(button: facebookOutlet, textField: facebookTextField, url: code)
            case 1:
                setSocialMedia(button: instagramOutlet, textField: instagramTextField, url: code)
            case 2:
                setSocialMedia(button: twitterOutlet, textField: twitterTextField, url: code)
            case 3:
                setSocialMedia(button: webOutlet, textField: webTextField, url: code)
            default:
                print("")
            }
        }
        
    }
    
    private func setSocialMedia(button: UIButton, textField: UITextField, url:String){
        button.isSelected = true
        button.setImage(UIImage(systemName: checkFilled), for: .normal)
        textField.text = url
        textField.isEnabled = true
    }
    
    private func setDefaultsValues(){
        facebookTextField.isEnabled = false
        facebookTextField.text = ""
        facebookOutlet.isSelected = false
        
        instagramTextField.isEnabled = false
        instagramTextField.text = ""
        instagramOutlet.isSelected = false
        
        twitterTextField.isEnabled = false
        twitterTextField.text = ""
        twitterOutlet.isSelected = false
        
        webTextField.isEnabled = false
        webTextField.text = ""
        webOutlet.isSelected = false
        
    }
}

extension SocialMediaView{
    private func buttonSelected(isSelected checked:Bool, button:UIButton, textField:UITextField, position:Int){
        button.setImage(UIImage(systemName: checked ? uncheck : checkFilled), for: .normal)
        textField.isEnabled = !checked
        checkBoxList[position].isSelected = !checked
        if checked{
            button.isSelected = false
            textField.text = ""
        }else{
            button.isSelected = true
        }
    }
}
