//
//  AppUsers.swift
//  Core Data Demo
//
//  Created by jordan on 05/11/2014.
//  Copyright (c) 2014 jordan. All rights reserved.
//

import Foundation
import CoreData

@objc(AppUsers)
class AppUsers: NSManagedObject {

    @NSManaged var username: String
    @NSManaged var password: String

}
