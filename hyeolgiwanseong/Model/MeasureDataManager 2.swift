//
//  MeasureDataManager.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/10/24.
//

import Foundation
import CoreData
import UIKit

class TrialDataManager {
    
    var selectMeasurement: Measurement?
    
    // Core Data context 가져오기
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // 데이터를 Core Data에 저장하는 함수
    func saveData(date: Date, systole: String?, diastole: String?, heartRate: String?) {
        
        // 입력된 데이터를 통해 새로운 차시 데이터를 생성
        let newTrial = Trial(context: self.context)
        newTrial.date = date
        newTrial.systole = Int64(systole!)!
        newTrial.diastole = Int64(diastole!)!
        newTrial.heartRate = Int64(heartRate!)!
        
        // 만약 선택된 기록이 있다면 해당 기록에 차시데이터를 추가
        if let measurement = selectMeasurement {
            measurement.addToTrials(newTrial)
            measurement.updateMeasureData()
            
        // 선택된 기록이 없다면 새로운 기록 데이터를 생성후 차시 데이터를 추가
        } else {
            let newMeasurement = Measurement(context: self.context)
            newMeasurement.date = date
            newMeasurement.addToTrials(newTrial)
            newMeasurement.updateMeasureData()
            selectMeasurement = newMeasurement
        }
        
        
        do {
            try context.save()
            print("Item saved!")
        } catch {
            print("Failed to save item: \(error)")
        }
        
    }
    
    // 선택된 기록 데이터 내보내기
    func getMeasurement() -> Measurement? {
        return selectMeasurement
    }
    
    // 데이터를 Core Data에서 가져오는 함수
    func fetchData() -> [Trial]? {
        
        guard let measurement = selectMeasurement else { return nil}
        let request: NSFetchRequest<Trial> = Trial.fetchRequest()
        request.predicate = NSPredicate(format: "parentMeaurement == %@", measurement)
        
        do {
            let items = try context.fetch(request)  // 요청 실행
            return items
        } catch {
            print("Failed to fetch items: \(error)")
            return nil
        }
    }
    
    // 데이터를 Core Data에서 삭제하는 함수
//    func deleteItem(_ item: Item) {
//        context.delete(item)
//        
//        do {
//            try context.save()
//            print("Item deleted!")
//        } catch {
//            print("Failed to delete item: \(error)")
//        }
//    }
}
