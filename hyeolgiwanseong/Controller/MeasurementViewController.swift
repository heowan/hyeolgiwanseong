//
//  MeasurementTableViewController.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/9/24.
//

import UIKit

class MeasurementViewController: UIViewController {

    var measurement: Measurement?
    let doneButton = UIButton(type: .system)
    
    @IBOutlet weak var recordDate: UILabel!
    
    @IBOutlet weak var bloodPressure: UILabel!
    @IBOutlet weak var bloodPressureState: UILabel!
    
    @IBOutlet weak var heartRate: UILabel!
    @IBOutlet weak var heartRateState: UILabel!
    
    @IBOutlet weak var pulPress: UILabel!
    @IBOutlet weak var pulPressState: UILabel!
    
    @IBOutlet weak var meanArtPress: UILabel!
    @IBOutlet weak var meanArtPressState: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        setupBottomBtn()
        setupData()

    }
    
    // MARK: - setup doneButton
    func setupBottomBtn() {
        
        doneButton.setTitle("완료", for: .normal)
        doneButton.backgroundColor = .systemBlue
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            doneButton.layer.cornerRadius = doneButton.frame.height / 2
        }
    @objc func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - setup Data
    func setupData() {
        guard let measure = measurement else { return }
        recordDate.text = DateFormatter.customFormatter.string(from: measure.date)
        
        bloodPressure.text = "\(measure.systole)/\(measure.diastole)"
        bloodPressureState.text = StateHelper.getBloodPressState(systolic: measure.systole, diastolic: measure.diastole).rawValue
        
        heartRate.text = "\(measure.heartRate)"
        heartRateState.text = StateHelper.getHeartRateState(hearRate: measure.heartRate).rawValue
        
        pulPress.text = "\(measure.pulPress)"
        pulPressState.text = StateHelper.getPulPressState(pulPress: measure.pulPress).rawValue
        
        meanArtPress.text = "\(measure.meanArtPress)"
        meanArtPressState.text = StateHelper.getMeanArtPressState(MeanArtPress: measure.meanArtPress).rawValue
        
    }
   
}
