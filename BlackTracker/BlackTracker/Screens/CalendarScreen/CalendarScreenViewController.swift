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
private extension CalendarScreenView {
  // 1
  func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
    // 2
    guard let numberOfDaysInMonth = calendar.range(
        of: .day,
        in: .month,
        for: baseDate)?.count,
        let firstDayOfMonth = calendar.date(
        from: calendar.dateComponents([.year, .month], from: baseDate)
        )
      else {
        // 3
        throw CalendarDataError.metadataGeneration
    }

    // 4
      let firstDayWeekday = self.calendar.component(.weekday, from: firstDayOfMonth)

    // 5
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
