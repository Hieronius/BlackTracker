import UIKit

final class ProgressScreenViewController: GenericViewController<ProgressScreenView> {
    
    // MARK: - Private Properties
    private var currentProgressCount = 0
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        self.title = "Black Tracker"
    }
    
}

// MARK: - Extensions

extension ProgressScreenViewController: ProgressScreenViewDelegate {
    func imageViewTapped() {
        
        if currentProgressCount < ImageService.images.count - 1 {
            currentProgressCount += 1
            rootView.animateImageTransition(to: ImageService.images[currentProgressCount])
        } else {
            currentProgressCount = 0
            rootView.animateImageTransition(to: ImageService.images[currentProgressCount])
        }
    }
    
    
}
