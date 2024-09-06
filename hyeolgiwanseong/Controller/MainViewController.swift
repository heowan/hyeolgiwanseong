//
//  ViewController.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 8/26/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var memoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func memoButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Memo", bundle: nil)
        let memoVC = storyboard.instantiateViewController(withIdentifier: "memoVC") as! MemoViewController
        let vc = UINavigationController(rootViewController: memoVC)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

