import UIKit

final class CalendarScreenViewController: GenericViewController<CalendarScreenView> {
    
    // MARK: - Private Properties
    
    // isDailyVisitsButtonTapped = false/true
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }
    
}

// MARK: - Extensions

extension CalendarScreenViewController: CalendarScreenViewDelegate {
    func dayTapped() {
        // some code here
    }
}
