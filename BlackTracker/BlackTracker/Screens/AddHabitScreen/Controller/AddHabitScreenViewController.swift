import UIKit

final class AddHabitScreenViewController: GenericViewController<AddHabitScreenView> {
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddHabit controller on the screen")
        setupNavigationVC()
    }
    
    // MARK: - Private Methods
    
    private func setupNavigationVC () {
        guard let NaviVC = navigationController else { return }
        
        NaviVC.navigationBar.backgroundColor = .darkGray
    }
}
