//
//  ViewController.swift
//  practice-calculator
//
//  Created by Burhan AFŞAR on 31.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var process: UILabel!
    
    var firstValue: Double = 0.0
    var lastValue: Double = 0.0
    var currentOperation: Operation = .plus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum Operation{
        case plus
        case minus
        case multiply
        case divide
    }
    
    private func clearProcess(){
        process.text = ""
    }
    
    private func clearResult(){
        result.text = ""
    }
    
    private func setProcessText(number: Double){
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: number)
        process.text = formatter.string(from: number)
    }
    
    private func setResultText(number: Double){
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: number)
        result.text = formatter.string(from: number)
    }
    
    @IBAction func numberTapped(_ sender: UIButton){
        addWorking(item: sender.tag)
        clearResult()
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
        firstValue = Double(process.text!) ?? firstValue
        clearProcess()
        clearResult()
        
        switch sender.tag{
        case 1:
            currentOperation = .plus
            break
        case 2:
            currentOperation = .minus
        case 3:
            currentOperation = .multiply
        case 4:
            currentOperation = .divide
        default:
            break
        }
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        lastValue = Double(process.text!) ?? 0
        
        switch currentOperation{
        case .plus:
            firstValue = firstValue + lastValue
            break
        case .minus:
            firstValue = firstValue - lastValue
            break
        case .multiply:
            firstValue = firstValue * lastValue
            break
        case .divide:
            firstValue = firstValue / lastValue
            break
        }
        setResultText(number: firstValue)
        clearProcess()
    }
    
    private func addWorking(item: Int){
        if process.text == "0"{
            clearProcess()
        }
        process.text! += String(item)
    }
    
    @IBAction func acTapped(_ sender: Any) {
        clearResult()
        process.text = "0"
        firstValue = 0
    }
    
    @IBAction func convertTapped(_ sender: Any) {
        if process.text == "0"{
            return
        }
        else if process.text != ""{
            firstValue = Double(process.text!) ?? 0
        }
        firstValue = firstValue * -1
        setProcessText(number: firstValue)
        clearResult()
    }
    
    @IBAction func percentTapped(_ sender: Any) {
        firstValue = Double(process.text!) ?? 0
        firstValue = (firstValue / 100.0)
        setProcessText(number: firstValue)
    }
    
    @IBAction func dotTapped(_ sender: Any) {
        firstValue = Double(process.text!) ?? 0
        firstValue = (firstValue / 10)
        setProcessText(number: firstValue)
    }
}
