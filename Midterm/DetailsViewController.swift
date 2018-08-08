//
//  DetailsViewController.swift
//  Midterm
//
//  Created by student on 2018-06-14.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
protocol DetailsViewControllerDelegate: class {
    func showData(data: Movie, position: Int)
}

class DetailsViewController: UIViewController {
    weak var delegate: DetailsViewControllerDelegate?
    var movie: Movie!
    var position: Int!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDetailImage: UIImageView!
    @IBOutlet weak var movieDetail: UITextView!
    
    @IBOutlet var starButtons: [UIButton]!
    
    @IBAction func saveRating(_ sender: UIButton) {
        self.delegate?.showData(data: movie, position: position)
    }
    
    @IBAction func starTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in starButtons{
            if button.tag <= tag{
                button.setTitle("★", for: .normal)
                button.titleLabel?.font = button.titleLabel?.font.withSize(50)
            }else{
                button.setTitle("☆", for: .normal)
            }
        }
        movie.rating = tag + 1
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movie = movie{
            movieTitleLabel.text = movie.name
            movieDetailImage.image = movie.image
            movieDetail.text = movie.description
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
