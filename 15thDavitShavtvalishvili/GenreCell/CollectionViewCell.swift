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
    var delegate2: SecondViewController?
    var indexPath: IndexPath!
    var page = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func cellButtom(_ sender: Any) {
        if page == 1 { delegate.CollectionViewButtonPressed(cell: self) }
        if page == 2 {
            let index = delegate.getIndexByTitle(movieArr: delegate.movieArr, title: self.cellButtonOutlet.titleLabel!.text!)
            delegate2?.buttonPressed2(data: delegate.movieArr[index], index: index)
        }
    }
}
