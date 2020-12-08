//
//  JokeViewController.swift
//  APIChallenge
//
//  Created by Gabriel Marinho on 08/12/20.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var viewText: UITextView!
    @IBAction func getFactPressed(_ sender: UIButton) {
        reloadJoke.getData {
                    DispatchQueue.main.async {
                    self.viewText.text = self.reloadJoke.quote
                }
            }
//        reloadCategory.getData {
//            DispatchQueue.main.async {
//                self.labelView.text = self.reloadCategory.quote
//            }
//        }
    }
    var reloadJoke = ReloadJoke()
//    var reloadCategory = ReloadCategory()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.text = ""
        viewText.text = ""
        labelView.text = "\(TypeString.name.uppercased())"
        JokeREST.jokeRequest(onComplete: { (jokereturn) in
            let joke = jokereturn
            DispatchQueue.main.sync {
                self.viewText.text = joke.value
                
            }
        }, onError: { (error) in
            print(error)
        }, categoria: TypeString.name)
        
            }

    }
  

