
import UIKit

protocol BackgroundColorDelegate {
    func colorTransfer(color: UIColor)
}

class BackgroundViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var backgroundView: UIView!
    
    // MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorazerVC = segue.destination as! ColorazerViewController
        colorazerVC.delegate = self
        colorazerVC.color = backgroundView.backgroundColor
    }
}

// MARK: - Extensions
extension BackgroundViewController: BackgroundColorDelegate {
    func colorTransfer(color: UIColor) {
        backgroundView.backgroundColor = color
    }
}
