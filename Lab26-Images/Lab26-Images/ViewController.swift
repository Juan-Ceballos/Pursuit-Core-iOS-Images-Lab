//
//  ViewController.swift
//  Lab26-Images
//
//  Created by Juan Ceballos on 12/10/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var recentButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var comicStepper: UIStepper!
    @IBOutlet weak var comicTextField: UITextField!
    
    var imageURL = ""
    var randomIssue = 1
    var comicURL = "https://xkcd.com/info.0.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecentComicImage()
        comicTextField.delegate = self
    }
    
    
    
    func loadRandomComicImage()    {
        var randomComicURL = "https://xkcd.com/\(randomIssue)/info.0.json"
        ComicAPI.getComic(comicURL: comicURL) {  (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let comic):
                self.randomIssue = comic.randomNum
                randomComicURL = "https://xkcd.com/\(self.randomIssue)/info.0.json"
                ComicAPI.getComic(comicURL: randomComicURL) { (result) in
                    switch result   {
                    case .failure(let appError):
                        print(appError)
                    case .success(let forRandomComic):
                        self.comicImage.setImage(with: forRandomComic.img) { (result) in
                            switch result   {
                            case .failure(let appError):
                                print(appError)
                            case .success(let randomComicImage):
                                DispatchQueue.main.async    {
                                    self.comicImage.image = randomComicImage
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func loadRecentComicImage() {
        ComicAPI.getComic(comicURL: comicURL) {  (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let comic):
                self.comicImage.setImage(with: comic.img) { (result) in
                    switch result   {
                    case .failure(let appError):
                        print(appError)
                    case .success(let comicImage):
                        DispatchQueue.main.async    {
                            self.comicImage.image = comicImage
                        }
                    }
                }
            }
        }
    }
    
    func configureStepper() {
        comicStepper.stepValue = 1
        comicStepper.maximumValue = 20
        comicStepper.minimumValue = 1
        comicStepper.value = 20
    }
    
    // property observer for stepper
    var value: Int = 0   {
        didSet  {
            
        }
    }
    
    
    @IBAction func comicButtonPressed(_ sender: UIButton) {
        switch sender.tag   {
        case 0:
            loadRecentComicImage()
        case 1:
            loadRandomComicImage()
        default:
            print("Error")
        }
    }
    
    @IBAction func comicStepperChanged(_ sender: UIStepper) {
        // when stepper is pressed up or down
        
    }
    
}

extension ViewController: UITextFieldDelegate   {
    
    
}
