//
//  InformationTableViewCell.swift
//  GlobalLogicTest
//
//  Created by Pedro Toro on 9/20/23.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(item: Item) {
        let url = URL(string: item.url)

        DispatchQueue.global().async {
            guard let url = url else { return }
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.cellImage.image = UIImage(data: data)
                self.cellImage.isHidden = false
            }
        }
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}
