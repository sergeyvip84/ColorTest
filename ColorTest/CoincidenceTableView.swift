//
//  CoincidenceTableView.swift
//  ColorTest
//
//  Created by Serhii Palamarchuk on 28.11.2021.
//

import UIKit
import CoreData

class CoincidenceTableView: UITableViewController {
    
    var fetchResultsController: NSFetchedResultsController <Coincidence>!
    var concidence : [Coincidence] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest : NSFetchRequest<Coincidence> = Coincidence.fetchRequest()
        let sortDescriptor = NSSortDescriptor (key: "coincidenceLevel", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            do {
                try fetchResultsController.performFetch()
                concidence = fetchResultsController.fetchedObjects!
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concidence.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.labelCoincidence?.text = String(concidence[indexPath.row].coincidenceLevel)
        cell.labelDate.text = concidence[indexPath.row].date
        
        if concidence[indexPath.row].level {
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            cell.backgroundColor = .none
        }
        
        switch concidence[indexPath.row].coincidenceLevel {
        case 97...100: cell.imageStars?.image = UIImage(named: "stars3")
        case 94..<97: cell.imageStars?.image = UIImage(named: "stars2")
        case 90..<94: cell.imageStars?.image = UIImage(named: "star1")
        default: cell.imageStars?.image = UIImage(named: "badsmile")
        }
        return cell
    }   
}
