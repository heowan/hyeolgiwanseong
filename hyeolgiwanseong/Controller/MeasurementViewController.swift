//
//  MeasurementTableViewController.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/9/24.
//

import UIKit

class MeasurementViewController: UIViewController {

    
    let doneButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        setupBottomBtn()
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
    
   
}
