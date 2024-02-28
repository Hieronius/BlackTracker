import UIKit

final class MainScreenViewController: GenericViewController<MainScreenView> {
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

// MARK: - Extensions

extension MainScreenViewController: MainScreenViewDelegate {
    func imageViewTapped() {
        // method to get images from imageService and change the content of imageView
    }
    
    
}
