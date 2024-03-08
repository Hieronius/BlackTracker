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

// MARK: - Day Generation
private extension CalendarScreenViewController {
    
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
        guard let numberOfDaysInMonth = rootView.calendar.range(
            of: .day,
            in: .month,
            for: baseDate)?.count,
              let firstDayOfMonth = rootView.calendar.date(
                from: rootView.calendar.dateComponents([.year, .month], from: baseDate)
              )
        else {
            throw CalendarDataError.metadataGeneration
        }
        
        let firstDayWeekday = rootView.calendar.component(.weekday, from: firstDayOfMonth)
        
        return MonthMetadata(
            numberOfDays: numberOfDaysInMonth,
            firstDay: firstDayOfMonth,
            firstDayWeekday: firstDayWeekday
        )
    }
    
    enum CalendarDataError: Error {
        case metadataGeneration
    }
}

// MARK: - CalendarScreenViewDelegate

extension CalendarScreenViewController: CalendarScreenViewDelegate {
    func dayTapped() {
        print("calendar day tapped. reaction from CalendarScreenViewController")
    }
}
