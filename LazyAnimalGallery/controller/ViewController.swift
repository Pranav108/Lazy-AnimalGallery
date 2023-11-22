//
//  ViewController.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var animals : [Animal]? = nil
    let animalResource : AnimalResource = AnimalResource()
    var switchHeader : TableHeaderView?
    private var switchState : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "GalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "GalleryTableViewCell")
        
        setUpHeaderView()
        
        animalResource.getAnimal { animalResponse in
            switch animalResponse {
            case .success(let success):
                self.animals = success
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let failure):
                print("Failure in animalResponse : ")
                print(failure.localizedDescription)
            }
        }
    }
    
    func setUpHeaderView(){
        switchHeader = TableHeaderView(frame: self.headerView.bounds)
        headerView.addSubview(switchHeader!)
        switchHeader?.swicthToggleCallback = { switchState in
            self.switchState = switchState
            self.tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTableViewCell") as! GalleryTableViewCell
        
        let animal = animals?[indexPath.row]
        
        let animalImageURL = URL(string: animal!.image)!
        
        cell.lazyImageView.loadImage(fromURL: animalImageURL, with: "animalPlaceHolder", for: self.switchState)
        cell.animalNameLabel?.text = animal?.name
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

