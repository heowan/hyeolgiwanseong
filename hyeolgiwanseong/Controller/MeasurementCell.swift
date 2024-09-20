//
//  MeasurementCell.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/12/24.
//

import UIKit

class MeasurementCell: UITableViewCell {
    
    var data: Trial? {
        didSet {
            setupData()
        }
    }
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var trialNumLabel: UILabel!
    @IBOutlet weak var bloodPressLabel: UILabel!
    @IBOutlet weak var stateBarView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var heartRateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupData()
    }
    
    func setupData() {
        if let trial = data {
            bloodPressLabel.text = "\(trial.systole)/\(trial.diastole) mmHg"
            stateBarView.backgroundColor = .green
            stateLabel.text = StateHelper.getBloodPressState(systolic: trial.systole, diastolic: trial.diastole).rawValue
            heartRateLabel.text = "\(trial.heartRate) bpm"
        }
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
