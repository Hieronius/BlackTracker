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
        
        self.tabBar.backgroundColor = AppColors.darkGray
        self.tabBar.tintColor = .gray
        
        let progressScreenVC = ProgressScreenViewController()
        let progressImage = UIImage(named: "chart.bar")
        let progressImagePressed = UIImage(named: "chart.bar.fill")
        let progressTabBarIcon = UITabBarItem(
            title: "Progress",
            image: progressImage,
            selectedImage: progressImagePressed
        )
        progressScreenVC.tabBarItem = progressTabBarIcon
        
        let habitsListScreenVC = HabitsListScreenViewController()
        let habitsListImage = UIImage(named: "list.bullet.circle")
        let habitsListImagePressed = UIImage(named: "list.bullet.circle.fill")
        let habitsTabBarIcon = UITabBarItem(
            title: "My Habits",
            image: habitsListImage,
            selectedImage: habitsListImagePressed
        )
        habitsListScreenVC.tabBarItem = habitsTabBarIcon
        
        
        
        let controllers = [
                progressScreenVC,
                habitsListScreenVC,
                
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
