//
//  StorageManager.swift
//  WorkWithRealm
//
//  Created by Egor Syrtcov on 26/09/2019.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()


class StorageManager {
    static func saveData(_ taskList: [TaskLists]) {
        
        try! realm.write {
            realm.add(taskList)
        }
    }
}
