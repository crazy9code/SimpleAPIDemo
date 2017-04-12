//
//  ViewController.swift
//  APIAlamofire
//
//  Created by indu Pal on 20/02/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //  @IBOutlet var tableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var episode = [String]()
    var rel = [String]()
    var til = [String]()
    var imdb = [String]()
    var imdbrat = [String]()
    typealias Dictionary = [String: Any]
    var EpisodesArry = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        self.alamofire()
        tableView.reloadData()
    }
    
    func alamofire() {
        let start = Date()
        let utilityQueue = DispatchQueue.global(qos: .userInteractive)
        
        Alamofire.request("http://www.omdbapi.com/?t=Game%20of%20Thrones&Season=1", method: .get).responseJSON(queue: utilityQueue) { response in
            // print(response.result.value!)
            let res = response.result.value as! Dictionary
            if let episodes = res["Episodes"]{
                // print(episodes)
                for eps in episodes as! Array<Any> {
                    // print(eps)
                    if let epsdist = eps as? Dictionary
                    {
                        if let name = epsdist["Episode"]{
                            self.episode.append(name as! String)
                            print(self.episode)
                        }
                        if let name = epsdist["Released"]{
                            self.rel.append(name as! String)
                        }
                        if let name = epsdist["Title"]{
                            self.til.append(name as! String)
                        }
                        if let name = epsdist["imdbID"]{
                            self.imdb.append(name as! String)
                        }
                        if let name = epsdist["imdbRating"]{
                            self.imdbrat.append(name as! String)
                        }
                        self.tableView.reloadData()
                    }
                }
                
            }
            
        }
        let end = Date()
        let exc = end.timeIntervalSince(start)
        print("time = \(exc)")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.backgroundColor = UIColor.cyan
        cell.episode.text = episode[indexPath.row]
        cell.releaseLab.text = rel[indexPath.row]
        cell.title.text = til[indexPath.row]
        cell.imdb.text = imdb[indexPath.row]
        cell.imdbrat.text = imdbrat[indexPath.row]
        
        return cell
    }
    
}
