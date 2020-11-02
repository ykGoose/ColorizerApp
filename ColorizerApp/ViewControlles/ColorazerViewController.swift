
import UIKit

class ColorazerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var colorView: UIView!
    @IBOutlet var colorLabels: [UILabel]!
    @IBOutlet var colorSliders: [UISlider]!
    @IBOutlet var colorTextField: [UITextField]!
    
    
    // MARK: - Public Properties
    var color: UIColor!
    var delegate: BackgroundColorDelegate!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        getColors()
        setColor()
        setValue()
        setTextField()
    }
    
    // MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        setValue()
        setTextField()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.colorTransfer(color: colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setColor() {
        var red: CGFloat = 1
        var green: CGFloat = 1
        var blue: CGFloat = 1
        
        colorSliders.forEach { slider in
            switch slider.tag {
            case 0: red = CGFloat(slider.value)
            case 1: green = CGFloat(slider.value)
            case 2: blue = CGFloat(slider.value)
            default: break
            }
            colorView.backgroundColor = UIColor(red: CGFloat(red),
                                                green: CGFloat(green),
                                                blue: CGFloat(blue),
                                                alpha: 1)
        }
    }
    
    private func setValue() {
        for (label, slider) in zip(colorLabels, colorSliders) {
            label.text = string(from: slider)
        }
    }
    
    private func setTextField() {
        for (textField, slider) in zip(colorTextField, colorSliders) {
            textField.text = string(from: slider)
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func getColors() {
        var red: CGFloat = 1
        var green: CGFloat = 1
        var blue: CGFloat = 1
        var alpha: CGFloat = 1
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        colorSliders.forEach { slider in
            switch slider.tag {
            case 0: slider.value = Float(red)
            case 1: slider.value = Float(green)
            case 2: slider.value = Float(blue)
            default: break
            }
        }
    }
    
}

// MARK: - Extension Methods
extension ColorazerViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textFieldDidEndEditing(colorTextField)
        view.endEditing(true)
    }

    private func textFieldDidEndEditing(_ textField: [UITextField]) {
        for (textField, slider) in zip(colorTextField, colorSliders) {
            guard let x = Float(textField.text ?? "0.00") else { return }
            if x > 1 {
                textField.text = "1.00"
                slider.value = 1.00
            } else {
                slider.value = x
            }
            setColor()
            setValue()
        }
    }
}


