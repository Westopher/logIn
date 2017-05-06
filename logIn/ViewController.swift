//
//  ViewController.swift
//  logIn
//
//  Created by West Kraemer on 5/6/17.
//  Copyright © 2017 West Kraemer. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var logInButton: UIButton!
    
    @IBAction func logIn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //To access the functions in the AppDelegate, which allow you to use core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        
        //If the user name is in the core data, then change the alphas of the text field and login button so that they disappear. Then, change the label's alpha so that it displays and shows the text below."
        do {
            
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                
                if let username = result.value(forKey: "name") as? String {
                    
                    textField.alpha = 0
                    
                    logInButton.alpha = 0
                    
                    label.alpha = 1
                    
                    label.text = "Hi there " + username + "!"
                    
                }
            }
            
            
        } catch {
            
            print("Request failed")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

