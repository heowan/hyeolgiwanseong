//
//  Trial+CoreDataProperties.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/3/24.
//
//

import Foundation
import CoreData


extension Trial {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trial> {
        return NSFetchRequest<Trial>(entityName: "Trial")
    }

    @NSManaged public var date: Date?
    @NSManaged public var diastole: Int64
    @NSManaged public var heartRate: Int64
    @NSManaged public var systole: Int64
    @NSManaged public var parentMeaurement: Measurement?

}

extension Trial : Identifiable {

}
