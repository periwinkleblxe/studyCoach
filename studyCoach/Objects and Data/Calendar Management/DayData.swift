import SwiftUI

class dayData : ObservableObject, Identifiable, Codable{
    @Published var dayItemData : [dayItem] = []
    func fillData(dateSet: [Date]) {
        for (dateItem) in dateSet{
            dayItemData.append(dayItem(day: dateItem))
            
        }
    }
    func addClass(thisClass: Class){
        for dItem in dayItemData {
            for dayAndTime in thisClass.daysAndTimes {
                if (dayAndTime.day == dItem.dayOfWeek) {
                    dItem.classes.append(thisClass)
                    print(thisClass.className)
                }
            }
            /*
            for index in (0...thisClass.daysAndTimes.count-1) {
                if (thisClass.daysAndTimes[index].day == dItem.dayOfWeek) {
                    dItem.classes.append(thisClass)
                    print(thisClass.className)
                }
            }*/
            
        }
    }
    
    
}
