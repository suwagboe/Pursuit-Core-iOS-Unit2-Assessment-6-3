//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

//MARK: need to figure out how to make the colors populate in this view controller
// should i make a custom cell and try doing it there?? 
class mainViewController: UIViewController {

    // this is connected and it has constraints
    @IBOutlet weak var tableView: UITableView!
    
    
    private var colors = [Crayon]() {
        didSet{
            // loads the tableView
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
   loadData()
    // this allows for the data to populate in the tableview when it first loads
    tableView.dataSource = self
    
  }
    
    //MARK: SEGUE IS BELOW
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? DetailViewController, let indexpath = tableView.indexPathForSelectedRow
            else {
                return
        }
        
        // assigns the selected in the main controller and makes it the color of the next viewcontroller
        dvc.selectedColor = colors[indexpath.row]
    }
    
    
    // need the loadData function inorder to HAVE data
    func loadData() {
        // gives the above variable crayons the data of the class crayons; all crayons
        colors = Crayon.allTheCrayons
    }


}

extension mainViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    
    //Do I need this function in order to populate data
//    func numberOfSections(in tableView: UITableView) -> Int {
//             colors.count
//         }
      
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // allows for the cell to be reused if it is there if not then a new cell will be created.
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        
        
        // this variable gives me access to the propeties from colors which is of type crayon.
        let crayon = colors[indexPath.row]
        
        //it doesnt have any sections
        //[indexPath.section]
        
        // configure cell
        cell.textLabel?.text = crayon.name
        cell.textLabel?.textColor = .white
        
        
        cell.detailTextLabel?.text = crayon.hex
        cell.detailTextLabel?.textColor = .white
        //cell.tintColor
       // cell.backgroundView?.backgroundColor = UIColor(red: CGFloat(crayon.red), green: CGFloat(crayon.green), blue: CGFloat(crayon.blue), alpha: 1.0)
        
        
        // only the black color row shows....
        // had to divide by 255
        // also need to red instructions
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1.0)


      
        return cell
        
    }
   
  
}



//https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
// the below extention allows for UIColors to access the hex value instead of just the string...
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}


/*
        DONT KNOW IF I NEED YET
 
 extension UITableViewCell {
     var selectionColor: UIColor {
         set {
             let view = UIView()
             view.backgroundColor = newValue
             self.selectedBackgroundView = view
         }
         get {
             return self.selectedBackgroundView?.backgroundColor ?? UIColor.clear
         }
     }
 }
 
 
 
 
 let backgroundView = UIView()
       backgroundView.backgroundColor = UIColor.red
       cell.selectedBackgroundView = backgroundView
       
 */
