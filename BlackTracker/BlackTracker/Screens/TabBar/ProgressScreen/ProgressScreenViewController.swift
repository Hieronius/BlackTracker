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
        let settingsButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(settingsButtonTapped))
        settingsButton.tintColor = .white
        settingsButton.image = UIImage(named: "gear")
        navigationItem.leftBarButtonItem = settingsButton
        
        let profileButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(profileButtonTapped))
        profileButton.tintColor = .white
        profileButton.image = UIImage(named: "person.crop.circle")
        navigationItem.rightBarButtonItem = profileButton
    }
    
    @objc private func settingsButtonTapped() {
        // go to Settings Screen
    }
    
    @objc private func profileButtonTapped() {
        // go to Profile Screen
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
