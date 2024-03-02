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
        
        let mainScreenVC = MainScreenViewController()
        let homeImage = UIImage(named: "house")
        let homeImagePressed = UIImage(named: "house.fill")
        let homeTabBarIcon = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImagePressed
                                                 
        )
        mainScreenVC.tabBarItem = homeTabBarIcon
        
        
        
//        let controllers = [menuVC, detailVC, profileVC, contactsVC, basketVC]
//        self.viewControllers = controllers
        
        
        
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
