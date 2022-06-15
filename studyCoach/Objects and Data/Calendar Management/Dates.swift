import SwiftUI
class dates: Identifiable, ObservableObject, Codable {
    
    @Published var holderDate : Date = Date.now
    @Published var allDates: [Date] = []
    @Published var startDate : Date = Date.now
    @Published var endDate : Date = Date.now
    
    func fillDates(startDate: Date, endDate: Date) {
        var date = startDate // first date
        let endDate = endDate // last date
        
        // Formatter for printing the date, adjust it according to your needs:
        let fmt = DateFormatter()
        fmt.dateFormat = "MM/dd"
        
        while date <= endDate {
            allDates.append(date)
            //dData.dayItemData.append(dayItem(day: date))
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            
        }        
        
        
        
        /*
        allDates.append(startDate)
        print(startDate)
        
        while (holderDate < endDate){
            allDates.append(holderDate)
            holderDate = holderDate.addingTimeInterval(60*60*24)
            //print(holderDate)
        }
         */
        //allDates = Date.allDates(fromDate: startDate, toDate: endDate)
    }
}

extension Date {
    func daysOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ("EEEE")
        return dateFormatter.string(from: self).capitalized
    }
}
