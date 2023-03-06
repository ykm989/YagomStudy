//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김경호 on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
        slider.setThumbImage(UIImage(imageLiteralResourceName: "slider_thumb"), for: .normal)
    }

    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        slider.value = Float(Int(slider.value))
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == Int(slider.value){
            showAlert(message: "YOU HIT!!")
            reset()
            return
        } else if tryCount >= 5{
            showAlert(message: "YOU LOSE...")
            reset()
        } else if randomValue > Int(slider.value){
            slider.minimumValue = Float(Int(slider.value))
            minimumValueLabel.text = String(Int(slider.value))
        } else {
            slider.maximumValue = Float(Int(slider.value))
            maximumValueLabel.text = String(Int(slider.value))
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("touch up reset button")
        reset()
    }
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        print("\(randomValue) : randomValue")
    }
}

// 주석 연습
/*
 해피해피 주석 연습
 */
