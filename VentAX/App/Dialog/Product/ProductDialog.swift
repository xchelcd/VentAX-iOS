//
//  ProductDialog.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 29/04/21.
//

import UIKit

class ProductDialog: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextFild: UITextField!
    @IBOutlet weak var idTextField: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var buttonView: UIView!
    
    //MARK: - Actions
    @IBOutlet weak var editOutlet: UIButton!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var deleteOutlet: UIButton!
    
    //MARK: - Variables
    var isEdit:Bool = false
    var image:UIImage?
    var product:Product?
    var design:Design?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _ = design, let _ = product else { return }
        setupView()
        setupData()
    }
    
    //MARK: - Actions
    @IBAction func deleteProductButton(_ sender: Any) {
        
    }
    @IBAction func addProductButton(_ sender: Any) {
        
    }
    @IBAction func editProductButton(_ sender: Any) {
        
    }
    @IBAction func dismissButton(_ sender: Any) {
        //self.presentedViewController!.dismiss(animated: true, completion: nil)
        
    }
}

extension ProductDialog{
    
    private func setupData(){
        guard let product = self.product else { return }
        nameTextField.text = product.name
        priceTextFild.text = price(price: product.price/100)
        idTextField.text = "ID: \(product.id)"
        descriptionTextField.text = product.description
        detailsTextField.text = product.details
    }
    
    private func hideButtons(){
        addOutlet.isHidden = isEdit
        editOutlet.isHidden = !isEdit
        deleteOutlet.isHidden = !isEdit
    }
    
    private func setupView(){
        hideButtons()
        self.hideKeyboard()
        mainView.backgroundColor = UIColor().hexToColor(hex: design!.cardBackground)
        //productImageView
        editOutlet.designButton2()
        addOutlet.designButton2()
        deleteOutlet.designButton3()
        productImageView.designImage1()
        
        
        if isEdit{
            productImageView.image = image
        }
        
        let gestureImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        productImageView.addGestureRecognizer(gestureImage)
    }
    @objc private func tapImage(){
        print("imageTapped")
    }
    
    private func price(price:Double) -> String {
        return "$\(price)MX"
    }
}
