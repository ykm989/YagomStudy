//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김경호 on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(UIImage(imageLiteralResourceName: "slider_thumb"), for: .normal)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        slider.value = 0
        print("touch up reset button")
    }
}

