import UIKit

final class MainScreenViewController: GenericViewController<MainScreenView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("There is a main view controller")
        rootView.backgroundColor = .blue
    }


}

