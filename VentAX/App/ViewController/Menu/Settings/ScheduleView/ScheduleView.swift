//
//  ScheduleView.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 11/04/21.
//

import UIKit

class ScheduleView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet var parentView: UIView!
    
    //MARK: - variables
    var scheduleList:[Schedule]?

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        Bundle.main.loadNibNamed("ScheduleView", owner: self, options: nil)
        parentView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 5)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension ScheduleView{
    private func setupViews(){
        self.addSubview(parentView)
    }
}
