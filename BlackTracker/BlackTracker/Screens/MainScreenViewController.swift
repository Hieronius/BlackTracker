import UIKit

final class MainScreenViewController: GenericViewController<MainScreenView> {
    
    // MARK: - Private Properties
    
    private var currentProgressCount = 0
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }


}

// MARK: - Extensions

extension MainScreenViewController: MainScreenViewDelegate {
    func imageViewTapped() {
        
        if currentProgressCount < ImageService.images.count - 1 {
            currentProgressCount += 1
            rootView.imageView.image = ImageService.images[currentProgressCount]
        } else {
            currentProgressCount = 0
            rootView.imageView.image = ImageService.images[currentProgressCount]
        }
    }
    
    
}
