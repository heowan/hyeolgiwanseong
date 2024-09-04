//
//  Measurement+CoreDataProperties.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/3/24.
//
//

import Foundation
import CoreData


extension Measurement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Measurement> {
        return NSFetchRequest<Measurement>(entityName: "Measurement")
    }

    @NSManaged public var changeRange: Int64
    @NSManaged public var date: Date?
    @NSManaged public var diastole: Int64
    @NSManaged public var heartRate: Int64
    @NSManaged public var meanArtPress: Int64
    @NSManaged public var pulPress: Int64
    @NSManaged public var systole: Int64
    @NSManaged public var trials: NSSet?

}

// MARK: Generated accessors for trials
extension Measurement {

    @objc(addTrialsObject:)
    @NSManaged public func addToTrials(_ value: Trial)

    @objc(removeTrialsObject:)
    @NSManaged public func removeFromTrials(_ value: Trial)

    @objc(addTrials:)
    @NSManaged public func addToTrials(_ values: NSSet)

    @objc(removeTrials:)
    @NSManaged public func removeFromTrials(_ values: NSSet)

}

extension Measurement : Identifiable {

}
