//
//  ViewController.swift
//  15thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 12.07.22.
//

import UIKit

protocol DataDelegate {
    func getInfo() -> Movie
    
}

enum Genre: String {
    case comedy
    case action
    case drama
}

struct Movie {
    let title: String
    let releaseDate: String
    let imdb: Double
    let genre: Genre
    let mainActor: String
    var seen: Bool
    var isFavourite: Bool
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
}

var arr = [Genre.comedy, Genre.comedy, Genre.action, Genre.drama]
var arrStatus = ["Dummy", "O", "O", "O"]

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var genreColloctionView: UICollectionView!
    
    var movieArr = [
        Movie(title: "Homo habilis and the pope", releaseDate: "1 Dec 980781 BC", imdb: 7.2, genre: .action, mainActor: "handy man", seen: true, isFavourite: true),
        Movie(title: "The Wolf of Floor Street", releaseDate: "25 Dec 2013", imdb: 8.2, genre: .comedy, mainActor: "jeff jeff", seen: false, isFavourite: false),
        Movie(title: "Gotham", releaseDate: "29 Dec 2013", imdb: 8.0, genre: .comedy, mainActor: "tomas homeson", seen: true, isFavourite: false),
        Movie(title: "Power", releaseDate: "21 Apr 2010", imdb: 8.9, genre: .comedy, mainActor: "alfred the great", seen: false, isFavourite: false),
        Movie(title: "Breaking Bank", releaseDate: "13 Jun 2006", imdb: 5.5, genre: .comedy, mainActor: "linus torvados", seen: true, isFavourite: false),
        Movie(title: "Doctor Odd", releaseDate: "7 Jan 2009", imdb: 6.8, genre: .drama, mainActor: "darwin erismus", seen: false, isFavourite: false),
        Movie(title: "Luke Container", releaseDate: "14 Sep 2017", imdb: 6.7, genre: .drama, mainActor: "lie shou", seen: true, isFavourite: true),
        Movie(title: "The Blue Viking", releaseDate: "28 Feb 2018", imdb: 4.6, genre: .drama, mainActor: "sir mamoth", seen: true, isFavourite: false),
        Movie(title: "The Vindicators", releaseDate: "16 May 2018", imdb: 4.3, genre: .action, mainActor: "eric theman", seen: false, isFavourite: false),
        Movie(title: "Tomatos", releaseDate: "3 Jul 2020", imdb: 6.2, genre: .action, mainActor: "jon vermant", seen: true, isFavourite: true)
    ]
    var movieArrFiltered: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieArrFiltered = movieArr
        tableConfiguration()
        collectionViewConfig()
    }
    func tableConfiguration() {
        self.tableView.backgroundColor = UIColor(red: 0.89, green: 0.73, blue: 0.41, alpha: 1.00)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomCell1", bundle: nil), forCellReuseIdentifier: "CustomCell1")
        tableView.reloadData()
    }
    func collectionViewConfig() {
        genreColloctionView.delegate = self
        genreColloctionView.dataSource = self
        genreColloctionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    func getSelf() -> UIViewController {
        self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfSeen = 0
        movieArrFiltered!.forEach { if $0.seen == true { countOfSeen = countOfSeen + 1 } }
        if section == 0 {
            return countOfSeen
        } else {
            return movieArrFiltered!.count - countOfSeen
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell1", for: indexPath) as! CustomCell1
            let Arr1 = movieArrFiltered!.filter { $0.seen == true }
            cell.buttonOutlet.setTitle("Watched", for: .normal)
            cell.title.text = Arr1[indexPath.row].title
            cell.score.text = "\(Arr1[indexPath.row].imdb)"
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell1", for: indexPath) as! CustomCell1
            let Arr2 = movieArrFiltered!.filter { $0.seen != true }
            cell.buttonOutlet.setTitle("New", for: .normal)
            cell.title.text = Arr2[indexPath.row].title
            cell.score.text = "\(Arr2[indexPath.row].imdb)"
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell1
        var index = 0
        for i in 0..<movieArr.count {
            if movieArr[i].title == cell.title.text { index = i }
        }
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc1.data = movieArr[index]
        vc1.index = index
        vc1.vc = self
        self.navigationController!.pushViewController(vc1, animated: true)
    }
        
    func buttonPressed(cell: CustomCell1) {
        var index = 0
        for i in 0..<movieArr.count {
            if movieArr[i].title == cell.title.text { index = i }
        }
        movieArr[index].seen = !movieArr[index].seen
        tableView.reloadData()
        print(tableView as Any)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 4 }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.cellButtonOutlet.setTitle("\(arrStatus[indexPath[1]]) \(arr[indexPath[1]])",for: .normal)
        if indexPath[1] == 0 { cell.cellButtonOutlet.setTitle("Clear All",for: .normal) }
        return cell
    }
    func CollectionViewButtonPressed(cell: CollectionViewCell) {
        let index = cell.indexPath[1]
        if cell.cellButtonOutlet.titleLabel!.text!.first == "O" {
            arrStatus[index] = "X"
        } else { arrStatus[index] = "O" }
        if cell.cellButtonOutlet.titleLabel!.text!.first == "C" {
            arrStatus = ["O","O","O","O"]
            movieArrFiltered = movieArr
            genreColloctionView.reloadData()
            tableView.reloadData()
        }
        genreColloctionView.reloadItems(at: [cell.indexPath!])
        movieArrFiltered = movieArr.filter { $0.genre == arr[index] }
        tableView.reloadData()
    }
}
