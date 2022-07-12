//
//  CustomCell1.swift
//  15thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 12.07.22.
//

import UIKit

protocol CustomCellDelegate {
    func buttonPressed(cell: CustomCell1)
}

class CustomCell1: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    var delegate: CustomCellDelegate!
    var status = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func watchedButton(_ sender: Any) {
        delegate.buttonPressed(cell: self)
    }
}
