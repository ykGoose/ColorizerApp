

import SwiftUI


class ColorazerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Public Properties
    var color: UIColor!
    var delegate: BackgroundColorDelegate!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        getColors()
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: - IBActions
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
        delegate.colorTransfer(color: colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
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
    
    private func getColors() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    
}


