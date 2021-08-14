//
//  FAQViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 17/04/21.
//

import UIKit

class FAQViewController: UIViewController {
    
    let checkMarchCircle = "checkmark.circle"
    let checkMarkSeal = "checkmark.seal"
    
    //MARK: - IBOutlets
    @IBOutlet weak var faqTableView: UITableView!
    @IBOutlet weak var questionMainView: UIStackView!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    //MARK: - IBActionOutlets
    @IBOutlet weak var deleteQuestionOutlet: UIButton!
    @IBOutlet weak var editQuestionOutlet: UIButton!
    @IBOutlet weak var saveAllOutlet: UIButton!
    
    //MARK: - Variables
    var faqList:[FAQ]?
    var faqAuxList:[FAQAux] = [FAQAux]()
    var company:Company?
    var indexPath_:IndexPath?
    var sections_:IndexSet?
    var viewSelected:UIView {
        get{
            let view = UIView()
            view.backgroundColor = .white
            return view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        guard let _ = self.faqList, let _ = self.company else{ return }
        setupTable()
        
    }

//MARK: - IBActions
    @IBAction func sideMenuButton(_ sender: Any) {
        sideMenuController?.showLeftView(animated: true, completion: nil)
    }
    @IBAction func deleteQuestionButton(_ sender: Any) {
        guard let sections_ = sections_, let indexPath_ = indexPath_ else { return }
        
    }
    @IBAction func editQuestionButton(_ sender: Any) {
        guard let sections_ = sections_, let indexPath_ = indexPath_ else { return }
        self.sections_ = nil
        
        guard var item = faqAuxList[safe: indexPath_.section] else{
            faqAuxList.append(FAQAux(faq: FAQ(question: questionTextField.text!, answer: answerTextField.text!), isOpen: true))
            //faqTableView.reloadSections(sections_, with: .automatic)
            faqTableView.reloadData()
            return
        }
        
        item.faq.question = questionTextField.text!
        item.faq.answer = answerTextField.text!
        
        /*faqAuxList[faqAuxList.count + 1].faq.question = questionTextField.text!
        faqAuxList[faqAuxList.count + 1].faq.answer = answerTextField.text!
        faqTableView.reloadData()*/
        faqTableView.reloadSections(sections_, with: .automatic)
        
    }
    @IBAction func clearButton(_ sender: Any) {
        questionTextField.text = ""
        answerTextField.text = ""
        editQuestionOutlet.setTitle("EDITAR Q", for: .normal)
        deleteQuestionOutlet.setTitle("ELIMINAR Q", for: .normal)
        
        guard let sections_ = sections_, let indexPath_ = indexPath_ else { return }
        
        faqTableView.deselectRow(at: indexPath_, animated: true)
        
        
        guard var item = faqAuxList[safe: indexPath_.section] else{
            return
        }
        
        item.isOpen = false
        faqTableView.reloadSections(sections_, with: .fade)
    }
    @IBAction func saveAllButton(_ sender: Any) {
        //MARK: - update data in server
    }
    
}

extension FAQViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let item = faqAuxList[safe: section] else{
            return 1
        }
        /*if faqAuxList[section].isOpen{
            return 2
        }
        return 1*/
        if item.isOpen{
            return 2
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Util.getFAQNumber(priority:company!.priority)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let item = faqAuxList[safe: indexPath.section] else{
            cell.textLabel?.text = "Pregunta \(indexPath.section + 1)"
            return cell
        }
        //let item = faqAuxList[indexPath.section]
        
        if indexPath.row == 0{
            cell.textLabel?.text = item.faq.question
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
            if indexPath.section < faqAuxList.count{
                cell.imageView?.image = UIImage(systemName: checkMarkSeal)
                cell.imageView?.tintColor = UIColor(named: Colors.proccessOrderVentax)
            }
        }else{
            cell.textLabel?.text = item.faq.answer
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: UIFont.labelFontSize)
            cell.textLabel?.numberOfLines = 0
        }
        
        if indexPath.row == 1{
            cell.selectedBackgroundView = viewSelected
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1{ return }
        let index = indexPath.section
        indexPath_ = indexPath
        let sections = IndexSet.init(integer: index)
        sections_ = sections
        
        guard let item = faqAuxList[safe: indexPath.section] else {
            setFaq(faq: FAQ(question: "Pregunta \(index + 1)", answer: "Respuesta \(index + 1)"), index: index + 1)
            return
        }
        setFaq(faq: item.faq, index: index + 1)
        //
        
        if faqAuxList[index].isOpen{
            faqAuxList[index].isOpen = false
            tableView.reloadSections(sections, with: .fade)
        }else{
            faqAuxList[index].isOpen = true
            tableView.reloadSections(sections, with: .automatic)
        }
        faqTableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
        /*setFaq(faq: faqAuxList[index].faq, index: index)
        
        indexPath_ = indexPath
        let sections = IndexSet.init(integer: indexPath.section)
        if faqAuxList[indexPath.section].isOpen{
            faqAuxList[indexPath.section].isOpen = false
            tableView.reloadSections(sections, with: .fade)
        }else{
            faqAuxList[indexPath.section].isOpen = true
            tableView.reloadSections(sections, with: .automatic)
        }
        faqTableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
         */
    }
}

extension FAQViewController{
    private func setupView(){
        questionMainView.designBorder()
        faqTableView.designBorder()
        saveAllOutlet.designButton1()
        self.hideKeyboard()
    }
    
    private func setupTable(){
        /*for i in 0...Util.getFAQNumber(priority:company!.priority) - 1{
            if i >= faqList!.count{
                faqAuxList.append(FAQAux(faq: FAQ(question: "Pregunta \(i + 1)", answer: "Respuesta \(i + 1)"), isOpen: false))
            }else{
                let faq = faqList![i]
                faqAuxList.append(FAQAux(faq: faq, isOpen: false))
            }
        }*/
        
        for faq in faqList!{
            faqAuxList.append(FAQAux(faq: faq, isOpen: false))
        }
        
        faqTableView.delegate = self
        faqTableView.dataSource = self
        faqTableView.separatorStyle = .singleLine
        faqTableView.tableFooterView = UIView()
    }
    
    private func setFaq(faq: FAQ, index:Int){
        questionTextField.text = faq.question
        answerTextField.text = faq.answer
        editQuestionOutlet.setTitle("EDITAR Q\(index)", for: .normal)
        deleteQuestionOutlet.setTitle("ELIMINAR Q\(index)", for: .normal)
    }
}

struct FAQAux{
    var faq:FAQ
    var isOpen:Bool
}
