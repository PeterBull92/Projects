//
//  ListViewController.swift
//  GlobalLogicTest
//
//  Created by Pedro Toro on 9/18/23.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: String(describing: InformationTableViewCell.self), bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "InformationTableViewCell")
        
        fillArray()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDescriptionVC" {
            if let vc = segue.destination as? DescriptionViewController,
               let item = sender as? Item {
                // Configura las propiedades del destinoVC con los datos que deseas pasar
                
                vc.item = item
            }
        }
    }

    
    func fillArray() {
        items = [Item(title: "Macbook PRO", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus varius sem, eu ultricies urna condimentum a. Suspendisse aliquam mi vel orci viverra consectetur. Morbi at diam neque. Nam commodo risus sit amet mi hendrerit, sed facilisis quam tincidunt. Nulla facilisi. Nam commodo ultricies dignissim. In tempor sapien mattis, suscipit dolor at, semper odio. Proin interdum sapien sit amet nibh tincidunt, luctus congue nunc viverra. Proin pharetra neque vel orci porta, et pharetra turpis venenatis. Nam volutpat aliquet ante, nec ullamcorper felis semper eget. Vivamus posuere suscipit gravida. Nunc ut efficitur turpis.", url:"https://picsum.photos/100/100?image=0"),
                 Item(title: "Duis dapibus varius sem, eu ultricies urna condimentum.", description: "In hac habitasse platea dictumst. Aliquam mi erat, fermentum non nisi non, congue dictum velit. Suspendisse hendrerit velit at vulputate suscipit. Nunc in erat vestibulum, lacinia neque vel, molestie arcu. Proin vestibulum sagittis mauris, eu consequat neque imperdiet non. Donec feugiat viverra quam, sit amet pulvinar justo accumsan sed. Praesent gravida eros in libero facilisis, quis molestie nisl interdum. Ut gravida vel felis quis rutrum. Mauris accumsan lacus et sem efficitur, in mattis sem lacinia. Suspendisse id nisi arcu. Maecenas at magna in nisl ornare gravida. Pellentesque vitae auctor sem.", url:"https://picsum.photos/200/200?image=1"),
                 Item(title: "Macbook PRO", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus varius sem, eu ultricies urna condimentum a. Suspendisse aliquam mi vel orci viverra consectetur. Morbi at diam neque. Nam commodo risus sit amet mi hendrerit, sed facilisis quam tincidunt. Nulla facilisi. Nam commodo ultricies dignissim. In tempor sapien mattis, suscipit dolor at, semper odio. Proin interdum sapien sit amet nibh tincidunt, luctus congue nunc viverra. Proin pharetra neque vel orci porta, et pharetra turpis venenatis. Nam volutpat aliquet ante, nec ullamcorper felis semper eget. Vivamus posuere suscipit gravida. Nunc ut efficitur turpis.", url:"https://picsum.photos/300/300?image=2"),
                 Item(title: "Duis dapibus varius sem, eu ultricies urna condimentum.", description: "In hac habitasse platea dictumst. Aliquam mi erat, fermentum non nisi non, congue dictum velit. Suspendisse hendrerit velit at vulputate suscipit. Nunc in erat vestibulum, lacinia neque vel, molestie arcu. Proin vestibulum sagittis mauris, eu consequat neque imperdiet non. Donec feugiat viverra quam, sit amet pulvinar justo accumsan sed. Praesent gravida eros in libero facilisis, quis molestie nisl interdum. Ut gravida vel felis quis rutrum. Mauris accumsan lacus et sem efficitur, in mattis sem lacinia. Suspendisse id nisi arcu. Maecenas at magna in nisl ornare gravida. Pellentesque vitae auctor sem.", url:"https://picsum.photos/400/400?image=3"),
                 Item(title: "Macbook PRO", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus varius sem, eu ultricies urna condimentum a. Suspendisse aliquam mi vel orci viverra consectetur. Morbi at diam neque. Nam commodo risus sit amet mi hendrerit, sed facilisis quam tincidunt. Nulla facilisi. Nam commodo ultricies dignissim. In tempor sapien mattis, suscipit dolor at, semper odio. Proin interdum sapien sit amet nibh tincidunt, luctus congue nunc viverra. Proin pharetra neque vel orci porta, et pharetra turpis venenatis. Nam volutpat aliquet ante, nec ullamcorper felis semper eget. Vivamus posuere suscipit gravida. Nunc ut efficitur turpis.", url:"https://picsum.photos/500/500?image=4"),
                 Item(title: "Duis dapibus varius sem, eu ultricies urna condimentum.", description: "In hac habitasse platea dictumst. Aliquam mi erat, fermentum non nisi non, congue dictum velit. Suspendisse hendrerit velit at vulputate suscipit. Nunc in erat vestibulum, lacinia neque vel, molestie arcu. Proin vestibulum sagittis mauris, eu consequat neque imperdiet non. Donec feugiat viverra quam, sit amet pulvinar justo accumsan sed. Praesent gravida eros in libero facilisis, quis molestie nisl interdum. Ut gravida vel felis quis rutrum. Mauris accumsan lacus et sem efficitur, in mattis sem lacinia. Suspendisse id nisi arcu. Maecenas at magna in nisl ornare gravida. Pellentesque vitae auctor sem.", url:"https://picsum.photos/600/600?image=5"),
                 Item(title: "Macbook PRO", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus varius sem, eu ultricies urna condimentum a. Suspendisse aliquam mi vel orci viverra consectetur. Morbi at diam neque. Nam commodo risus sit amet mi hendrerit, sed facilisis quam tincidunt. Nulla facilisi. Nam commodo ultricies dignissim. In tempor sapien mattis, suscipit dolor at, semper odio. Proin interdum sapien sit amet nibh tincidunt, luctus congue nunc viverra. Proin pharetra neque vel orci porta, et pharetra turpis venenatis. Nam volutpat aliquet ante, nec ullamcorper felis semper eget. Vivamus posuere suscipit gravida. Nunc ut efficitur turpis.", url:"https://picsum.photos/700/700?image=6"),
                 Item(title: "Duis dapibus varius sem, eu ultricies urna condimentum.", description: "In hac habitasse platea dictumst. Aliquam mi erat, fermentum non nisi non, congue dictum velit. Suspendisse hendrerit velit at vulputate suscipit. Nunc in erat vestibulum, lacinia neque vel, molestie arcu. Proin vestibulum sagittis mauris, eu consequat neque imperdiet non. Donec feugiat viverra quam, sit amet pulvinar justo accumsan sed. Praesent gravida eros in libero facilisis, quis molestie nisl interdum. Ut gravida vel felis quis rutrum. Mauris accumsan lacus et sem efficitur, in mattis sem lacinia. Suspendisse id nisi arcu. Maecenas at magna in nisl ornare gravida. Pellentesque vitae auctor sem.", url:"https://picsum.photos/800/800?image=7")
        ]
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello, you are in the row \(indexPath.row) and in the section \(indexPath.section)")
        let item = items[indexPath.row]
        performSegue(withIdentifier: "goToDescriptionVC", sender: item)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell else { return UITableViewCell() }
        cell.fillData(item: items[indexPath.row])
        return cell
    }
    
}
