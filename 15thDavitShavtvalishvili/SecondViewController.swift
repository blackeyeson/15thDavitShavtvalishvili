//
//  SecondViewController.swift
//  15thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 12.07.22.
//

import UIKit

class SecondViewController: UIViewController {


    var data: Movie!
    var index: Int!
    var vc: ViewController!
    @IBOutlet weak var dTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var mainActor: UILabel!
    @IBOutlet weak var seen: UILabel!
    @IBOutlet weak var longStory: UILabel!
    @IBOutlet weak var isFavorite: UILabel!
    @IBOutlet weak var stitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dTitle.text = "Title: \(data.title)"
        releaseDate.text = "release Date: \(data.releaseDate)"
        imdb.text = "imdb rating: \(data.imdb)"
        mainActor.text = "Main actor: \(data.mainActor)"
        longStory.text = data.description
        seen.text = "Status: \(vc.movieArr[index].seen ? "Watched" : "New" )"
        isFavorite.text = "Favorite: \(vc.movieArr[index].isFavourite ? "Yes" : "No" )"
        stitch.setOn(vc.movieArr[index].isFavourite, animated: false)
        
    }
    
    func favsSwitch() {
        vc.movieArr[index].isFavourite = !vc.movieArr[index].isFavourite
        stitch.setOn(vc.movieArr[index].isFavourite, animated: true)
        isFavorite.text = "Favorite: \(vc.movieArr[index].isFavourite ? "Yes" : "No")"
        vc.tableView.reloadData()
    }
    @IBAction func realSwitch(_ sender: Any) {
        favsSwitch()
    }
    @IBAction func `switch`(_ sender: Any) {
        favsSwitch()
    }
}
