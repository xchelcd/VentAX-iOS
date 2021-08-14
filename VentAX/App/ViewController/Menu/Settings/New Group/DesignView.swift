//
//  DesignView.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 11/04/21.
//

import UIKit
import PDColorPicker

class DesignView: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //MARK: - IBActions
    @IBOutlet weak var backgroundMainOutlet: UIButton!
    @IBOutlet weak var backgroundProductOutlet: UIButton!
    @IBOutlet weak var backgroundDetailsOutlet: UIButton!
    @IBOutlet weak var colorTitleOutlet: UIButton!
    @IBOutlet weak var colorLetterOutlet: UIButton!
    
    //MARK: - Variables
    var design:Design?
    var designProtocol:DesignProtocol?

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        Bundle.main.loadNibNamed("DesignView", owner: self, options: nil)
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
    @IBAction func backgroundMainButton(_ sender: UIButton) {
        designProtocol?.openColorPicker(button: sender)
    }
    @IBAction func backgroundProductButton(_ sender: UIButton) {
        designProtocol?.openColorPicker(button: sender)
    }
    @IBAction func backgroundDetailsButton(_ sender: UIButton) {
        designProtocol?.openColorPicker(button: sender)
    }
    @IBAction func colorTitleButton(_ sender: UIButton) {
        designProtocol?.openColorPicker(button: sender)
    }
    @IBAction func colorLetterButton(_ sender: UIButton) {
        designProtocol?.openColorPicker(button: sender)
    }
    
}


extension DesignView{
    private func setupViews(){
        let white: String = "#FFFFFF"
        let auxWhite: String = "CDCDCD"
        guard let design = design else { return }
        backgroundMainOutlet.tintColor = UIColor().hexToColor(hex: design.mainBackground == white ? auxWhite : design.mainBackground)
        backgroundProductOutlet.tintColor = UIColor().hexToColor(hex: design.cardBackground == white ? auxWhite : design.cardBackground)
        backgroundDetailsOutlet.tintColor = UIColor().hexToColor(hex: design.dialogBackground == white ? auxWhite : design.dialogBackground)
        colorTitleOutlet.tintColor = UIColor().hexToColor(hex: design.titleColor == white ? auxWhite : design.titleColor)
        colorLetterOutlet.tintColor = UIColor().hexToColor(hex: design.textColor == white ? auxWhite : design.textColor)
    }
}
