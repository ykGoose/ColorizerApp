
import UIKit

protocol BackgroundColorDelegate {
    func colorTransfer(red: Float, green: Float, blue: Float)
}

class BackgroundViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    var rgbValue = Color(colorRed: 0.30, colorGreen: 0.30, colorBlue: 0.60)
    
    override func viewDidLoad() {
        setColor()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorazerVC = segue.destination as! ColorazerViewController
        colorazerVC.delegate = self
        colorazerVC.red = rgbValue.colorRed
        colorazerVC.green = rgbValue.colorGreen
        colorazerVC.blue = rgbValue.colorBlue
    }


private func setColor() {
    backgroundView.backgroundColor = UIColor(red: CGFloat(rgbValue.colorRed),
                                             green: CGFloat(rgbValue.colorGreen),
                                             blue: CGFloat(rgbValue.colorBlue),
                                             alpha: 1)
    
}

}
    
extension BackgroundViewController: BackgroundColorDelegate {
    func colorTransfer(red: Float, green: Float, blue: Float) {
        rgbValue = Color(colorRed: red, colorGreen: green, colorBlue: blue)
        setColor()
    }
}
