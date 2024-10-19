import UIKit

class CalculatorVC: UIViewController {
    // Ensure you have this UILabel in your storyboard connected as an IBOutlet
    @IBOutlet weak var displayLabel: UILabel!
    private var currentInput: String = ""
    private var previousValue: Double = 0
    private var operation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(CalculatorVC.tapFunction))
        displayLabel.isUserInteractionEnabled = true
                displayLabel.addGestureRecognizer(tap)
        displayLabel.numberOfLines = 3
            }

         @objc  func tapFunction(sender:UITapGestureRecognizer) {
             displayLabel.text = "the result is \(displayLabel.text ?? "")"
    }
    
   // @IBAction func textfield(_ sender: Any) {
   // }
    
    @IBAction func acButton(_ sender: Any) {
        clearCalculator()
    }
    
    @IBAction func plusminusButton(_ sender: Any) {
        if let value = Double(currentInput) {
            currentInput = "\(value * -1)"
            displayLabel.text = currentInput
        }
    }
    @IBAction func percentageButton(_ sender: Any) {
        if let value = Double(currentInput) {
            if operation.isEmpty{
                currentInput = "\(value/100)"
            }else{
                let percentageValue = previousValue * (value/100)
                currentInput = "\(percentageValue)"
                displayLabel.text = currentInput
            }
               }
    }
    
    
    @IBAction func divideButton(_ sender: Any) {
        processOperation("/")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        appendNumber("7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        appendNumber("8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        appendNumber("9")
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        processOperation("×")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        appendNumber("4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        appendNumber("5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        appendNumber("6")
    }
    
    
    @IBAction func minusButton(_ sender: Any) {
        processOperation("-")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        appendNumber("1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        appendNumber("2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        appendNumber("3")
    }
    
    @IBAction func plusButton(_ sender: Any) {
        processOperation("+")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        appendNumber("0")
    }
    
    @IBAction func commaButton(_ sender: Any) {
        if !currentInput.contains(",") {
            appendNumber(",")
        }
    }
    
    @IBAction func dotButton(_ sender: Any) {
        if !currentInput.contains(".") {
            appendNumber(".")
        }
    }
    
    @IBAction func equalButton(_ sender: Any) {
        
        guard !currentInput.isEmpty else { return }
        let currentValue = Double(currentInput) ?? 0
        var result: Double = 0
        
        switch operation {
        case "+":
            result = previousValue + currentValue
        case "-":
            result = previousValue - currentValue
        case "×":
            result = previousValue * currentValue
        case "/":
            result = previousValue / currentValue
        case "%" :
            result = (previousValue / currentValue )*100
        default:
            result = currentValue
        }
        
        displayLabel.text = " \(result)"
        previousValue = result
        currentInput = ""
        operation = ""
    }
    
    // Helper Methods
    private func appendNumber(_ number: String) {
        if currentInput == "0"{
            currentInput = number
        }else{
            currentInput += number
            
        }
        displayLabel.text = currentInput
    }
    
    private func processOperation(_ op: String) {
        if let value = Double(currentInput) {
            if !operation.isEmpty{
                equalButton(self)
            }
            previousValue = value
            operation = op
            currentInput = ""
        }
    }
    
    private func clearCalculator() {
        currentInput = ""
        previousValue = 0
        operation = ""
        displayLabel.text = "0"
    }
}
    
    
