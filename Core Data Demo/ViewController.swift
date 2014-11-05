//
//  ViewController.swift
//  Core Data Demo
//
//  Created by jordan on 05/11/2014.
//  Copyright (c) 2014 jordan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(sender: AnyObject) {
        /*
            create reference to AppDelegate so that you can reference managedObjectContext.
            create NSEntityDescription - needs to know about your entity, needs its name and the object managing it.
            create an instance of your NSManagedObject subclass. this needs an entity description and the object managing the entity.
            assign values to new instance of NSManagedObject
            Save the managedObjectContext
        */
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDel.managedObjectContext!
        let entityDescription = NSEntityDescription.entityForName("AppUsers", inManagedObjectContext: context)
        
        var newUser = AppUsers(entity: entityDescription!, insertIntoManagedObjectContext: context)
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        context.save(nil)
        
    }

    @IBAction func loadButton(sender: AnyObject) {
        /*
            get reference to managedObjectContext in AppDelegate.
            create an NSFetchRequest instance - needs to know which entity its going to be fetching.
            use managedObjectContext's function executeFetchRequest to run the request and assign the array to userArray.
        */
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDel.managedObjectContext!
        let request = NSFetchRequest(entityName: "AppUsers")
        var userArray: NSArray = context.executeFetchRequest(request, error: nil)!
        
        // for each user in the userArray print their username
        for user in userArray {
            println(user.username + "\n")
        }
    }
}

