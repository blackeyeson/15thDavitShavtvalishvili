//
//  ViewController.swift
//  15thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 12.07.22.
//

import UIKit

//taken out of class for accessibility
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

//data for collectionView
var arr = [Genre.comedy, Genre.comedy, Genre.action, Genre.drama]
var arrStatus = ["Dummy", "O", "O", "O"]

//viewController
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
    //for filtering by collectionView
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

//Table
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
    
    func getCells(indexPath: IndexPath, stat: Bool) -> CustomCell1 {
        var status = "New"
        if stat { status = "Watched" }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell1", for: indexPath) as! CustomCell1
        let Arr = movieArrFiltered!.filter { $0.seen == stat }
        cell.buttonOutlet.setTitle(status, for: .normal)
        cell.title.text = Arr[indexPath.row].title
        cell.score.text = "\(Arr[indexPath.row].imdb)"
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return getCells(indexPath: indexPath, stat: true)
        } else {
            return getCells(indexPath: indexPath, stat: false)
        }
    }
    
    func getIndexByTitle(movieArr: [Movie], title: String) -> Int {
        var index = 0
        for i in 0..<movieArr.count {
            if movieArr[i].title == title { index = i }
        }
        return index
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell1
        let index = getIndexByTitle(movieArr: movieArr, title: cell.title.text!)
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc1.data = movieArr[index]
        vc1.index = index
        vc1.vc = self
        self.navigationController!.pushViewController(vc1, animated: true)
    }
        
    func buttonPressed(cell: CustomCell1) {
        let index1 = getIndexByTitle(movieArr: movieArr, title: cell.title.text!)
        let index2 = getIndexByTitle(movieArr: movieArrFiltered!, title: cell.title.text!)
        movieArr[index1].seen = !movieArr[index1].seen
        movieArrFiltered![index2].seen = !movieArrFiltered![index2].seen
        tableView.reloadData()
    }
}

//CollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 4 }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.delegate = self
        cell.page = 1
        cell.indexPath = indexPath
        cell.cellButtonOutlet.setTitle("\(arrStatus[indexPath[1]]) \(arr[indexPath[1]])",for: .normal)
        if indexPath[1] == 0 { cell.cellButtonOutlet.setTitle("Clear All",for: .normal) }
        return cell
    }
    func CollectionViewButtonPressed(cell: CollectionViewCell) {
        let index = cell.indexPath[1]
        if cell.cellButtonOutlet.titleLabel!.text!.first == "O" {
            arrStatus[index] = "X"
        } else {
            if cell.cellButtonOutlet.titleLabel!.text!.first == "X" {
                arrStatus[index] = "O"
            } else {
                arrStatus = ["O","O","O","O"]
//                genreColloctionView.reloadData()
                genreColloctionView.reloadItems(at: [
                    IndexPath(item: 1, section: 0), IndexPath(item: 2, section: 0), IndexPath(item: 3, section: 0)]
                )
            }
        }
        genreColloctionView.reloadItems(at: [cell.indexPath!])
        updateFilterMovies()
        
    }
    
    func updateFilterMovies() {
        movieArrFiltered = movieArr
        for i in 1...3 {
            if arrStatus[i] == "X" { movieArrFiltered = movieArrFiltered!.filter { $0.genre == arr[i]} }
        }
        tableView.reloadData()
    }
}
