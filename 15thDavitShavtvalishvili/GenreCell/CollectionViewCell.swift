//
//  CollectionViewCell.swift
//  15thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 14.07.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellButtonOutlet: UIButton!
    var delegate: ViewController!
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func cellButtom(_ sender: Any) {
        delegate.CollectionViewButtonPressed(cell: self)
    }
    
}
