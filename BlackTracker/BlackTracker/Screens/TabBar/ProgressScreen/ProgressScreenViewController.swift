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
    
    // MARK: - Private Methods
    
    // Zoom Animation
    private func animateImageTransition(to newImage: UIImage) {
        UIView.transition(with: rootView.progressImageView,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.rootView.progressImageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.rootView.progressImageView.image = newImage
            self.rootView.progressImageView.transform = .identity
        },
                          completion: nil)
    }
    

}

// MARK: - Extensions

extension ProgressScreenViewController: ProgressScreenViewDelegate {
    func imageViewTapped() {
        
        if currentProgressCount < ImageService.images.count - 1 {
            currentProgressCount += 1
            animateImageTransition(to: ImageService.images[currentProgressCount])
        } else {
            currentProgressCount = 0
            animateImageTransition(to: ImageService.images[currentProgressCount])
        }
    }
    
    
}
