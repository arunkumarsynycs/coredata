//
//  ViewController.swift
//  coredata
//
//  Created by Arun Reddy on 08/06/19.
//  Copyright © 2019 ITS ME. All rights reserved.
//

import UIKit
import CoreData
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext
class ViewController: UIViewController {
    
    
    var username=String()
    var password=String()
    var age=String()
    @IBOutlet weak var userNameTF: UITextField!
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var ageaTF: UITextField!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("welcome")
    }
    
    
    
    @IBAction func onSaveBTNtap(_ sender: UIButton) {
        self.username=self.userNameTF.text!
        self.password=self.passwordTF.text!
        self.age=self.ageaTF.text!
       
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(self.username, forKey: "username")
        newUser.setValue(self.password, forKey: "password")
        newUser.setValue(self.age, forKey: "age")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
        
        
    }
    

    @IBAction func onFetchBtnTap(_ sender: UIButton) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
        
        
    }
    
}

