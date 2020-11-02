
import UIKit

protocol BackgroundColorDelegate {
    func colorTransfer(color: UIColor)
}

class BackgroundViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorazerVC = segue.destination as! ColorazerViewController
        colorazerVC.delegate = self
        colorazerVC.color = backgroundView.backgroundColor
    }
}

extension BackgroundViewController: BackgroundColorDelegate {
    func colorTransfer(color: UIColor) {
        backgroundView.backgroundColor = color
    }
}
