import SwiftUI
class selSym : ObservableObject{
    @Published var symSet : [String] = []
    
}
import SwiftUI
struct symbolSet {
    static var art : [String]=[
        ("camera.shutter.button"),
        ("video"),
        ("ticket"),
        ("film"),
        ("megaphone"),
        ("radio"),
        ("speaker.wave.3"),
        ("music.mic"),
        ("waveform.and.mic"),
        ("metronome"),
        ("pianokeys"),
        ("headphones"),
        ("guitars"),
        ("pencil.and.outline"),
        ("paintbrush.pointed"),
        ("eyedropper"),
        ("paintbrush"),
        ("paintpalette")
        
    ]
    static var math : [String] = [
        ("x.squareroot"),
        ("percent"),
        ("plus.forwardslash.minus"),
        ("divide"),
        ("number"),
        ("ruler"),
        ("die.face.5")
    ]
    static var science : [String] = [
        ("moon"),
        ("sun.and.horizon"),
        ("thermometer"),
        ("leaf"),
        ("tornado"),
        ("facemask"),
        ("bandage"),
        ("testtube.2"),
        ("stethoscope"),
        ("gyroscope"),
        ("barometer"),
        ("cross.case"),
        ("ivfluid.bag"),
        ("cross.vial")
        
    ]
    static var technology : [String] = [
        ("desktopcomputer"),
        ("bolt.horizontal"),
        ("keyboard"),
        ("gearshape.2"),
        ("wrench"),
        ("hammer"),
        ("screwdriver"),
        ("memorychip"),
        ("cpu")
    ]
    static var social : [String] = [
        ("dollarsign.circle"),
        ("globe.americas"),
        ("map"),
        ("chart.xyaxis.line")
        
    ]
    static var language : [String] = [
        ("quote.bubble"),
        ("scroll"),
        ("book"),
        ("book.closed"),
        ("theatermasks"),
    ]
    static var physical : [String] = [
        ("figure.walk"),
        ("bicycle"),
        ("scooter")
    ]
    static var career : [String] = [
        ("briefcase"),
        ("cup.and.saucer")
        
    ]
    
}

enum options: String, Identifiable, CaseIterable {
    var id: String {self.rawValue}
    var name: String{self.rawValue}
    case art = "Art"
    case math = "Math"
    case science = "Science"
    case technology = "Technology"
    case social = "Social"
    case language = "Language"
    case physical = "Physical"
    case career = "Career"
    
}
