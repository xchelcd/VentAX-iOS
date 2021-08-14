//
//  SettingsViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 11/04/21.
//

import UIKit
import PDColorPicker

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var secondaryView: UIView!
    
    //MARK: -IBOActions
    @IBOutlet weak var saveAllOutlet: UIButton!
    
    //MARK: - Variables
    var entrepreneurModel:EntrepreneurModel?
    var frame:CGRect?
    //MARK: - Views
    var designView:DesignView?
    var scheduleView:ScheduleView?
    var socialMediaView:SocialMediaView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Actions
    @IBAction func sideMenuButton(_ sender: Any) {
        sideMenuController?.showLeftView(animated: true, completion: nil)
        //removeOptions()
    }
    
    
    @IBAction func designButton(_ sender: Any) {
        //removeOtions()
        guard let view = designView else {
            designView = DesignView(frame: secondaryView.frame)
            guard let design = entrepreneurModel?.design else{ return }
            designView!.design = design
            designView?.designProtocol = self
            //designView!.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
            secondaryView.addSubview(designView!)
            return
        }
        secondaryView.bringSubviewToFront(view)
        /*designView = DesignView(frame: secondaryView.frame)
        guard let design = entrepreneurModel?.design else{ return }
        designView!.design = design
        //designView!.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        secondaryView.addSubview(designView!)*/
        
    }
    @IBAction func socialMediaButton(_ sender: Any) {
        //removeOtions()
        guard let view = socialMediaView else {
            socialMediaView = SocialMediaView(frame: secondaryView.frame)
            guard let socialMedia = entrepreneurModel?.socialMediaList else { return }
            socialMediaView!.socialMediaList = socialMedia
            secondaryView.addSubview(socialMediaView!)
            return
        }
        secondaryView.bringSubviewToFront(view)
    }
    @IBAction func scheduleButton(_ sender: Any) {
        //removeOtions()
        guard let view = scheduleView else{
            scheduleView = ScheduleView(frame: secondaryView.frame)
            guard let schedule = entrepreneurModel?.scheduleList else { return }
            scheduleView!.scheduleList = schedule
            secondaryView.addSubview(scheduleView!)
            return
        }
        secondaryView.bringSubviewToFront(view)
    }
    
    @IBAction func saveAllButton(_ sender: Any) {
        
    }
    
}

extension SettingsViewController{
    private func setupView(){
        mainView.designBorder()
        secondaryView.designBorder()
        saveAllOutlet.designButton1()
        hideKeyboard()
    }
    
    private func removeOptions(){
        designView?.removeFromSuperview()
        scheduleView?.removeFromSuperview()
        socialMediaView?.removeFromSuperview()
    }
}


extension SettingsViewController: Dimmable{
    func presentColorPicker(button: UIButton) {
        let colorPicker = PDColorPickerViewController(initialColor: button.tintColor, tintColor: .systemBlue) { (newColor) in
            self.undim()
            guard let color = newColor else{
                //MARK: - button.setColorImage = .black
                //button.tintColor = .black
                return
            }
            button.tintColor = color.uiColor
            
        }
        dim()
        present(colorPicker, animated: true, completion: nil)
        
    }
}

extension SettingsViewController: DesignProtocol, ScheduleProtocol{
    func openColorPicker(button:UIButton) {
        presentColorPicker(button: button)
    }
    
    func openSchedulePicker() {
        
    }
    
    
}
