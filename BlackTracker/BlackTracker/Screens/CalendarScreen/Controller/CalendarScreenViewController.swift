import UIKit

final class CalendarScreenViewController: GenericViewController<CalendarScreenView> {
    
    // MARK: - Private Properties
    
    private let selectedDate: Date? = nil
    private var baseDate: Date = Date() {
      didSet {
        days = generateDaysInMonth(for: baseDate)
          rootView.calendarCollectionView.reloadData()
          rootView.headerView.baseDate = baseDate
      }
    }
    private lazy var days = generateDaysInMonth(for: baseDate)
    private let selectedDateChanged: ((Date) -> Void)? = nil
    private var dateFormatter: DateFormatter!
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        rootView.headerView.delegate = self
        rootView.footerView.delegate = self
        setupDayFormatter()
        
    }
    
    // MARK: - Private Methods
    
    private func setupDayFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
    }
}

// MARK: - Day Generation
private extension CalendarScreenViewController {
    
    // Get actual data for month
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
    
    func generateDaysInMonth(for baseDate: Date) -> [Day] {
        guard let metadata = try? monthMetadata(for: baseDate) else {
            fatalError("An error occurred when generating the metadata for \(baseDate)")
        }
        
        let numberOfDaysInMonth = metadata.numberOfDays
        let offsetInInitialRow = metadata.firstDayWeekday
        let firstDayOfMonth = metadata.firstDay
        
        // code to avoid gaps in a month's first row
        var days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow)).map { day in
                let isWithinDisplayedMonth = day >= offsetInInitialRow
                let dayOffset =
                isWithinDisplayedMonth ?
                day - offsetInInitialRow :
                -(offsetInInitialRow - day)
                
                return generateDay(
                    offsetBy: dayOffset,
                    for: firstDayOfMonth,
                    isWithinDisplayedMonth: isWithinDisplayedMonth
                )
            }
        days += generateStartOfNextMonth(using: firstDayOfMonth)
        
        return days
    }
    
    func generateDay(
        offsetBy dayOffset: Int,
        for baseDate: Date,
        isWithinDisplayedMonth: Bool
    ) -> Day {
        let date = rootView.calendar.date(
            byAdding: .day,
            value: dayOffset,
            to: baseDate)
        ?? baseDate
        
        return Day(
            date: date,
            number: dateFormatter.string(from: date),
            isSelected: rootView.calendar.isDate(date, inSameDayAs: selectedDate!),
            isWithinDisplayedMonth: isWithinDisplayedMonth
        )
    }
    
    func generateStartOfNextMonth(
        using firstDayOfDisplayedMonth: Date
    ) -> [Day] {
        guard
            let lastDayInMonth = rootView.calendar.date(
                byAdding: DateComponents(month: 1, day: -1),
                to: firstDayOfDisplayedMonth
            )
        else {
            return []
        }
        
        let additionalDays = 7 - rootView.calendar.component(.weekday, from: lastDayInMonth)
        guard additionalDays > 0 else {
            return []
        }
        
        let days: [Day] = (1...additionalDays)
            .map {
                generateDay(
                    offsetBy: $0,
                    for: lastDayInMonth,
                    isWithinDisplayedMonth: false)
            }
        
        return days
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

// MARK: - CalendarScreenHeaderViewDelegate

extension CalendarScreenViewController: CalendarScreenHeaderViewDelegate {
    func closeButtonTapped() {

        dismiss(animated: true)
        print("close button tapped. Reaction from Controller")
    }
}

// MARK: - CalendarScreenFooterViewDelegate

extension CalendarScreenViewController: CalendarScreenFooterViewDelegate {
    
    func previousMonthButtonTapped() {
        baseDate = rootView.calendar.date(
          byAdding: .month,
          value: -1,
          to: baseDate
          ) ?? baseDate
    }
    
    func nextMonthButtonTapped() {
        baseDate = rootView.calendar.date(
          byAdding: .month,
          value: 1,
          to: baseDate
          ) ?? baseDate
    }
}