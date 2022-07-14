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
    var filteredMovies: [Movie]?
    @IBOutlet weak var dTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var mainActor: UILabel!
    @IBOutlet weak var seen: UILabel!
    @IBOutlet weak var longStory: UILabel!
    @IBOutlet weak var isFavorite: UILabel!
    @IBOutlet weak var stitch: UISwitch!
    @IBOutlet weak var moviesCView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredMovies = vc.movieArr.filter { $0.genre == data.genre}
        setPageStaticInfo()
        collectionViewConfig()
        stitch.setOn(vc.movieArr[index].isFavourite, animated: false)
    }
    
    func setPageStaticInfo() {
        dTitle.text = "Title: \(data.title)"
        releaseDate.text = "release Date: \(data.releaseDate)"
        imdb.text = "imdb rating: \(data.imdb)"
        mainActor.text = "Main actor: \(data.mainActor)"
        longStory.text = data.description
        seen.text = "Status: \(vc.movieArr[index].seen ? "Watched" : "New" )"
        isFavorite.text = "Favorite: \(vc.movieArr[index].isFavourite ? "Yes" : "No" )"
    }
    
    func collectionViewConfig() {
        moviesCView.delegate = self
        moviesCView.dataSource = self
        moviesCView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
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

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredMovies!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("A")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.delegate = vc
        cell.delegate2 = self
        cell.page = 2
        cell.indexPath = indexPath
        cell.cellButtonOutlet.setTitle("\(filteredMovies![indexPath[1]].title)",for: .normal)
        return cell
    }
    func buttonPressed2(data: Movie, index: Int) {
        self.data = data
        self.index = index
        setPageStaticInfo()
        stitch.setOn(vc.movieArr[index].isFavourite, animated: true)
    }
}
