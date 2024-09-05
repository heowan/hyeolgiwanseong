//
//  Measurement+CoreDataClass.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/3/24.
//
//

import Foundation
import CoreData

@objc(Measurement)
public class Measurement: NSManagedObject {
    func updateMeasureData() {
        if let trialArray = trials?.allObjects as? [Trial] {
            let totalCount = Int64(trialArray.count)
            self.systole = trialArray.reduce(into: 0){ $0 += $1.systole } / totalCount
            self.diastole = trialArray.reduce(into: 0){ $0 += $1.diastole } / totalCount
            self.heartRate = trialArray.reduce(into: 0){ $0 += $1.heartRate } / totalCount
            self.pulPress = self.systole - self.diastole
            self.meanArtPress = diastole + (self.pulPress/3)
        } else {
            print("측정 데이터 업데이트에 실패하였습니다.")
        }
    }
}
