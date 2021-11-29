//
//  CoincidenceTableView.swift
//  ColorTest
//
//  Created by Serhii Palamarchuk on 28.11.2021.
//

import UIKit

class CoincidenceTableView: UITableViewController {

    var arrayCoincidence = [97,96,99,94,95,83,93,55,46,98]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCoincidence.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(arrayCoincidence[indexPath.row])
        
        switch arrayCoincidence[indexPath.row] {
        case 97...100: cell.imageView?.image = UIImage(named: "stars3")
        case 94..<97: cell.imageView?.image = UIImage(named: "stars2")
        case 90..<94: cell.imageView?.image = UIImage(named: "star1")
        default: break
        }
        
        return cell
    }
     
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }

}
