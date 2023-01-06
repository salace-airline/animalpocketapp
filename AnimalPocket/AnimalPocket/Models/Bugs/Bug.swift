//
//  Bug.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 25/11/2022.
//

import Foundation
import SwiftUI

struct Bug: Identifiable {
  let id: Int
  let name: Name
  let availability: Availability
  let price: Int
  let imageURI: String
  let iconURI: String
  
  init(id: Int, name: Name, availability: Availability, price: Int, imageURI: String, iconURI: String) {
    self.id = id
    self.name = name
    self.availability = availability
    self.price = price
    self.imageURI = imageURI
    self.iconURI = iconURI
  }
}

extension Bug: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case availability 
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}

// MARK: - Bug availability check
extension Bug {
  var period: String {
    if self.availability.isAllYear == true {
      return "Toute l'année"
    } else {
      return "\(monthsString)"
    }
  }
  
  var hour: String {
    if self.availability.time.self == .empty || self.availability.isAllDay == true {
      return "Toute la journée"
    } else {
      return self.availability.time.self.rawValue
    }
  }
  
  var monthsString: String {
    var monthArray: [String] = []
    
    for month in self.availability.monthArrayNorthern {
      switch month {
        case 1:
          monthArray.append("January")
        case 2:
          monthArray.append("February")
        case 3:
          monthArray.append("March")
        case 4:
          monthArray.append("April")
        case 5:
          monthArray.append("May")
        case 6:
          monthArray.append("June")
        case 7:
          monthArray.append("July")
        case 8:
          monthArray.append("August")
        case 9:
          monthArray.append("September")
        case 10:
          monthArray.append("October")
        case 11:
          monthArray.append("November")
        case 12:
          monthArray.append("December")
        default:
          monthArray.append("R")
      }
    }
    
    var finalMonthString: String {
      if monthArray.first! == monthArray.last! {
        return monthArray.first!
      } else {
        return [monthArray.first!, monthArray.last!].joined(separator: " - ")
      }
    }
    return finalMonthString
  }
}

// MARK: - Bug sample
extension Bug {
  static let sample = Bug(id: 80,
                          name: Name(nameEUen: "scorpion", nameEUfr: "scorpion"),
                          availability: Availability(monthNorthern: "5-10", monthSouthern: "11-4", time: Time.bet7pm4am, isAllDay: false, isAllYear: false, location: "On the ground", rarity: Rarity.ultraRare, monthArrayNorthern: [5,6,7,8,9,10], monthArraySouthern: [11,12,1,2,3,4], timeArray: [19,20,21,22,23,0,1,2,3]),
                          price: 8000,
                          imageURI: "https://acnhapi.com/v1/images/bugs/80",
                          iconURI: "https://acnhapi.com/v1/icons/bugs/80")
}

