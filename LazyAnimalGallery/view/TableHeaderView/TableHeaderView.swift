//
//  TableHeaderView.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 04/11/23.
//

import UIKit

class TableHeaderView: UIView {
    
    @IBOutlet weak var tableHeaderText: UILabel!
    
    @IBOutlet weak var cacheSwitch: UISwitch!
    
    var swicthToggleCallback : ((_ switchState : Bool) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
    }
    private func loadXib(){
        
        let xib = Bundle.main.loadNibNamed("TableHeaderView", owner: self,options: nil)?.first as! UIView
        
        xib.frame = self.bounds
        self.addSubview(xib)
        setup()
    }
    
    private func setup(){
        
        cacheSwitch.isOn = true
//        cacheSwitch.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cacheSwitch.addTarget(self, action: #selector(switchStateChanged(_:)), for: .valueChanged)
        
    }
    @objc func switchStateChanged(_ sender: UISwitch) {
        swicthToggleCallback!(sender.isOn)
        if (sender.isOn) {
            tableHeaderText.text = "caching enabled"
        }else{
            tableHeaderText.text = "caching disabled"
        }
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
