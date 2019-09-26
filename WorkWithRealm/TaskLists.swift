//
//  TaskLists.swift
//  WorkWithRealm
//
//  Created by Egor Syrtcov on 26/09/2019.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit
import RealmSwift

class TaskLists: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    var tasks = List<Task>()
}
