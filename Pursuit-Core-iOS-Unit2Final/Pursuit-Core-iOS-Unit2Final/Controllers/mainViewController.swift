//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var colors = [Crayon]() {
        didSet{
            // loads the tableView
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
   
    // this allows for the data to populate in the tableview when it first loads
    tableView.dataSource = self
  }


}

extension mainViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // allows for the cell to be reused if it is there if not then a new cell will be created.
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        // this variable gives me access to the propeties from colors which is of type crayon.
        let crayon = colors[indexPath.row]
        
        // configure cell
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(named: crayon.hex)
        
        return cell
        
    }
   
    //Do I need this function in order to populate data
    func numberOfSections(in tableView: UITableView) -> Int {
           colors.count
       }
    
}

