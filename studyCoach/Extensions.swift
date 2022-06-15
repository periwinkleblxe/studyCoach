import Foundation
import SwiftUI

extension Published:Encodable where Value:Decodable {
    
    public func encode(to encoder: Encoder) throws {
        
        let mirror = Mirror(reflecting: self)
        if let valueChild = mirror.children.first(where: { (child) -> Bool in
            child.label == "value"
        }) {
            if let value = valueChild.value as? Encodable {
                do {
                    try value.encode(to: encoder)
                    return
                } catch let error {
                    assertionFailure("Failed encoding: \(self) - \(error)")
                }
            }
            else {
                assertionFailure("Decodable Value not decodable. Odd \(self)")
            }
        }
        else {
            assertionFailure("Mirror Mirror on the wall - why no value y'all : \(self)")
        }
    }
}

extension Published:Decodable where Value:Decodable {
    public init(from decoder: Decoder) throws {
        self = Published(initialValue:try Value(from:decoder))
    }
}
#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#elseif os(macOS)
import AppKit
#endif

fileprivate extension Color {
#if os(macOS)
    typealias SystemColor = NSColor
#else
    typealias SystemColor = UIColor
#endif
    
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
#if os(macOS)
        SystemColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)
        // Note that non RGB color will raise an exception, that I don't now how to catch because it is an Objc exception.
#else
        guard SystemColor(self).getRed(&r, green: &g, blue: &b, alpha: &a) else {
            // Pay attention that the color should be convertible into RGB format
            // Colors using hue, saturation and brightness won't work
            return nil
        }
#endif
        
        return (r, g, b, a)
    }
}

extension Color: Codable {
    
    
    enum CodingKeys: String, CodingKey {
        case red, green, blue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let r = try container.decode(Double.self, forKey: .red)
        let g = try container.decode(Double.self, forKey: .green)
        let b = try container.decode(Double.self, forKey: .blue)
        
        self.init(red: r, green: g, blue: b)
    }
    
    public func encode(to encoder: Encoder) throws {
        guard let colorComponents = self.colorComponents else {
            return
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(colorComponents.red, forKey: .red)
        try container.encode(colorComponents.green, forKey: .green)
        try container.encode(colorComponents.blue, forKey: .blue)
    }
}
extension Image {
    //var systemName: String
}
/*
extension Image: Codable {
    enum CodingKeys: String, CodingKey {
        case name
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let link = try container.decode(String.self, forKey: .name)
        self.init(systemName: link)
    }
    public func encode(to encoder: Encoder) throws {
            
        guard let link = self.systemName else {return}
        var container = encoder.container(keyedBy: CodingKeys.self)
        //try container.encode(link)
    }
}
 */
// Swift 4.0
/*
public struct ImageWrapper: Codable {
    public let image: Image
    
    public enum CodingKeys: String, CodingKey {
        case image
    }
    
    // Image is a standard UI/NSImage conditional typealias
    public init(image: Image) {
        self.image = image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.decode(String.self, forKey: CodingKeys.image)
        let image = Image(data) 
        self.image = image
    }
    
    // cache_toData() wraps UIImagePNG/JPEGRepresentation around some conditional logic with some whipped cream and sprinkles.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let data = try container.encode(image, forKey: CodingKeys.image)
        
        
        try container.encode(data, forKey: CodingKeys.image)
    }
}
 */
