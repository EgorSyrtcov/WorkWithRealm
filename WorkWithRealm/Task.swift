//
//  Task.swift
//  WorkWithRealm
//
//  Created by Egor Syrtcov on 26/09/2019.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit
import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var data = Date()
    @objc dynamic var completed = false
}
