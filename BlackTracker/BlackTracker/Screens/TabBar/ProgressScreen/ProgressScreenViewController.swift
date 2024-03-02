import UIKit

final class ProgressScreenViewController: GenericViewController<ProgressScreenView> {
    
    // MARK: - Private Properties
    private var currentProgressCount = 0
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        setupNavigationVC()
    }
    
    // MARK: - Private Methods

    private func setupNavigationVC() {
        self.title = "Black Tracker"
        
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func leftButtonTapped() {
        
    }
    
    @objc private func rightButtonTapped() {
        
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
