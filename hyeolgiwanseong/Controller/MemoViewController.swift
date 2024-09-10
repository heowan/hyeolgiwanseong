//
//  MemoViewController.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/4/24.
//

import UIKit
import CoreData

class MemoViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var selectMeasurement: Measurement?
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateDescription: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var systoleField: UITextField!
    @IBOutlet weak var diastoleField: UITextField!
    @IBOutlet weak var heartRateField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "측정 기록"
        
    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        let newTrial = Trial(context: self.context)
        newTrial.date = datePicker.date
        newTrial.systole = Int64(systoleField.text!)!
        newTrial.diastole = Int64(diastoleField.text!)!
        newTrial.heartRate = Int64(heartRateField.text!)!
        
        
        if let measurement = selectMeasurement {
            measurement.addToTrials(newTrial)
            measurement.updateMeasureData()
            
        } else {
            let newMeasurement = Measurement(context: self.context)
            newMeasurement.date = datePicker.date
            newMeasurement.addToTrials(newTrial)
            newMeasurement.updateMeasureData()
        }
        
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        let storyboard = UIStoryboard(name: "Measurement", bundle: nil)
        let measurementVC = storyboard.instantiateViewController(withIdentifier: "MeasurementVC") as! MeasurementViewController
        self.navigationController?.pushViewController(measurementVC, animated: true)
            

    }
}

extension MemoViewController: UITextFieldDelegate {
    
}
