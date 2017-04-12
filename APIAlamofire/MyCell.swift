//
//  MyCell.swift
//  APIAlamofire
//
//  Created by Indu Pal on 20/02/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    
    @IBOutlet weak var epsLabel: UILabel!
    @IBOutlet weak var relLabel: UILabel!
    @IBOutlet weak var tilLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var imdbratLabel: UILabel!
    
    
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var releaseLab: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var imdbrat: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        epsLabel.text = "Episode"
        relLabel.text = "Released"
        tilLabel.text = "Title"
        imdbLabel.text = "imdbID"
        imdbratLabel.text = "imdbRating"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
