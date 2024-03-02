import UIKit

final class ProgressScreenViewController: GenericViewController<ProgressScreenView> {
    
    // MARK: - Private Properties
    
    private var currentProgressCount = 0
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }
    
    // MARK: - Private Methods
    
    // Zoom Animation
    private func animateImageTransition(to newImage: UIImage) {
        UIView.transition(with: rootView.imageView,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.rootView.imageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.rootView.imageView.image = newImage
            self.rootView.imageView.transform = .identity
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
