//
//  MemoViewController.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/4/24.
//

import UIKit

class MemoViewController: UIViewController {

    let measureDataManager = MeasureDataManager()
    
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
    
    // 입력된 데이터를 저장하고 다음 화면으로 이동
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        measureDataManager.saveData(date: datePicker.date, systole: systoleField.text, diastole: diastoleField.text, heartRate: heartRateField.text)
        
        let storyboard = UIStoryboard(name: "Measurement", bundle: nil)
        let measurementVC = storyboard.instantiateViewController(withIdentifier: "MeasurementVC") as! MeasurementViewController
        if let measurement = measureDataManager.getMeasurement() {
            measurementVC.measurement = measurement
            measurementVC.trialDataManager = TrialDataManager(selectMeasurement: measurement)
            self.navigationController?.pushViewController(measurementVC, animated: true)
        } else {
            print("선택된 기록이 없거나 새로운 기록이 올바르게 생성되지 못했습니다.")
        }
        
        
            

    }
}

extension MemoViewController: UITextFieldDelegate {
    
}
