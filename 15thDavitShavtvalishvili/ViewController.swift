//
//  ViewController.swift
//  15thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 12.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    struct Movie {
        let title: String
        let releaseDate: String
        let imdb: Double
        let mainActor: String
        let seen: Bool
        let isFavourite: Bool
        let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
    }
    var movieArr = [
        Movie(title: "Homo habilis and the pope", releaseDate: "1 Dec 980781 BC", imdb: 7.2, mainActor: "handy man", seen: true, isFavourite: true),
        Movie(title: "The Wolf of Floor Street", releaseDate: "25 Dec 2013", imdb: 8.2, mainActor: "jeff jeff", seen: false, isFavourite: false),
        Movie(title: "Gotham", releaseDate: "29 Dec 2013", imdb: 8.0, mainActor: "tomas homeson", seen: true, isFavourite: false),
        Movie(title: "Power", releaseDate: "21 Apr 2010", imdb: 8.9, mainActor: "alfred the great", seen: false, isFavourite: false),
        Movie(title: "Breaking Bank", releaseDate: "13 Jun 2006", imdb: 5.5, mainActor: "linus torvados", seen: true, isFavourite: false),
        Movie(title: "Doctor Odd", releaseDate: "7 Jan 2009", imdb: 6.8, mainActor: "darwin erismus", seen: false, isFavourite: false),
        Movie(title: "Luke Container", releaseDate: "14 Sep 2017", imdb: 6.7, mainActor: "lie shou", seen: true, isFavourite: true),
        Movie(title: "The Blue Viking", releaseDate: "28 Feb 2018", imdb: 4.6, mainActor: "sir mamoth", seen: true, isFavourite: false),
        Movie(title: "The Vindicators", releaseDate: "16 May 2018", imdb: 4.3, mainActor: "eric theman", seen: false, isFavourite: false),
        Movie(title: "Tomatos", releaseDate: "3 Jul 2020", imdb: 6.2, mainActor: "jon vermant", seen: true, isFavourite: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

