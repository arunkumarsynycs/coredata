//
//  SecondViewController.swift
//  coredata
//
//  Created by Arun Reddy on 08/06/19.
//  Copyright © 2019 ITS ME. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var data=[String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.textLabel?.text=self.data[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tblView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
            self.data.append(data.value(forKey: "username") as! String)
            }
            self.tblView.reloadData()
            
        } catch {
            
            print("Failed")
        }
        
    }
    

    @IBAction func onTap(_ sender: UIButton) {
        
        
        self.dismiss(animated: true) {
            
        }
        
        
        
        
    }
    

}
class CustomCell:UITableViewCell{
    
    
    
    
    
    
    
    
    
}
