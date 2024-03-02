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
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
        
        let progressScreenVC = ProgressScreenViewController()
        let progressImage = UIImage(named: "chart.bar")
        let progressImagePressed = UIImage(named: "chart.bar.fill")
        let progressTabBarIcon = UITabBarItem(
            title: "Progress",
            image: progressImage,
            selectedImage: progressImagePressed
        )
        progressScreenVC.tabBarItem = progressTabBarIcon
        
        let progressNavigationVC = UINavigationController(rootViewController: progressScreenVC)
        
        let habitsListScreenVC = HabitsListScreenViewController()
        let habitsListImage = UIImage(named: "list.bullet.circle")
        let habitsListImagePressed = UIImage(named: "list.bullet.circle.fill")
        let habitsTabBarIcon = UITabBarItem(
            title: "My Habits",
            image: habitsListImage,
            selectedImage: habitsListImagePressed
        )
        habitsListScreenVC.tabBarItem = habitsTabBarIcon
        
        let statisticsScreenVC = StatisticsScreenViewController()
        let statisticsImage = UIImage(named: "chart.line.uptrend.xyaxis.circle")
        let statisticsImagePressed = UIImage(named: "chart.line.uptrend.xyaxis.circle.fill")
        let statisticsTabBarIcon = UITabBarItem(
            title: "Statistics",
            image: statisticsImage,
            selectedImage: statisticsImagePressed
        )
        statisticsScreenVC.tabBarItem = statisticsTabBarIcon
        
        let achievementsScreenVC = AchievementScreenViewController()
        let achievementsImage = UIImage(named: "medal")
        let achievementsImagePressed = UIImage(named: "medal.fill")
        let achievementsTabBarIcon = UITabBarItem(
            title: "Achievements",
            image: achievementsImage,
            selectedImage: achievementsImagePressed
        )
        achievementsScreenVC.tabBarItem = achievementsTabBarIcon
        
        let controllers = [
                progressNavigationVC,
                habitsListScreenVC,
                statisticsScreenVC,
                achievementsScreenVC
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
