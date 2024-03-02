import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        delegate = self
        
        self.tabBar.backgroundColor = .lightGray
        self.tabBar.tintColor = .darkGray
        
        let progressScreenVC = ProgressScreenViewController()
        let progressImage = UIImage(named: "chart.bar")
        let progressImagePressed = UIImage(named: "chart.bar.fill")
        let homeTabBarIcon = UITabBarItem(title: "Progress", image: progressImage, selectedImage: progressImagePressed
                                                 
        )
        progressScreenVC.tabBarItem = homeTabBarIcon
        
        
        
        
        let controllers = [
                progressScreenVC,
            
            ]
        self.viewControllers = controllers
        
        
        
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
