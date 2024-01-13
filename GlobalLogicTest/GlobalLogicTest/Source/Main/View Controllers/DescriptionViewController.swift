//
//  DescriptionViewController.swift
//  GlobalLogicTest
//
//  Created by Pedro Toro on 9/18/23.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var imageDescription: UIImageView!
    @IBOutlet weak var fullDescription: UITextView!
    

    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: item.url)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageDescription.image = UIImage(data: data!)
                self.fullDescription.text = self.item.description
            }
        }
        
	}
    
}
