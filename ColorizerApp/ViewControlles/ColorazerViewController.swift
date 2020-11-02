

import SwiftUI



class ColorazerViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var red: Float!
    var green: Float!
    var blue: Float!
    var delegate: BackgroundColorDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        
        colorView.layer.cornerRadius = 15
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        default: break
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.colorTransfer(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        dismiss(animated: true)
    }
    
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
