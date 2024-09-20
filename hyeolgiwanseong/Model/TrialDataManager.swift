//
//  TrialDataManager.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/12/24.
//

import Foundation
import CoreData
import UIKit

class TrialDataManager {
    
    var selectMeasurement: Measurement
    
    init(selectMeasurement: Measurement) {
        self.selectMeasurement = selectMeasurement
    }
    
    // Core Data context 가져오기
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // 데이터를 Core Data에서 가져오는 함수
    func fetchData() -> [Trial]? {
        
        let request: NSFetchRequest<Trial> = Trial.fetchRequest()
        request.predicate = NSPredicate(format: "parentMeaurement == %@", selectMeasurement)
        
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
