//
//  CollectibleItem.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 17/02/2023.
//

import Foundation

struct CollectibleItem: Identifiable {
  let id: Int
  let name: Name
  let availability: Availability
  let speed: String?
  let shadow: String?
  let price: Int
  let iconURI: String
  var isCollected: Bool
  
  init(id: Int, name: Name, availability: Availability, speed: String?, shadow: String?, price: Int, iconURI: String, isCollected: Bool = false) {
    self.id = id
    self.name = name
    self.availability = availability
    self.speed = speed
    self.shadow = shadow
    self.price = price
    self.iconURI = iconURI
    self.isCollected = isCollected
  }
}

extension CollectibleItem {
  static let bugSample = CollectibleItem(id: 80,
                                         name: Name(nameEUen: "scorpion", nameEUfr: "scorpion"),
                                         availability: Availability(monthNorthern: "5-10",
                                                                    monthSouthern: "11-4",
                                                                    time: Time.bet7pm4am,
                                                                    isAllDay: false,
                                                                    isAllYear: false,
                                                                    location: "On the ground",
                                                                    rarity: Rarity.ultraRare,
                                                                    monthArrayNorthern: [5,6,7,8,9,10],
                                                                    monthArraySouthern: [11,12,1,2,3,4],
                                                                    timeArray: [19,20,21,22,23,0,1,2,3]),
                                         speed: nil,
                                         shadow: nil,
                                         price: 8000,
                                         iconURI: "https://acnhapi.com/v1/icons/bugs/80",
                                         isCollected: false
  )
  
  static let fishSample = CollectibleItem(id: 80,
                                          name: Name(nameEUen: "coelacanth", nameEUfr: "cœlacanthe"),
                                          availability: Availability(monthNorthern: "",
                                                                     monthSouthern: "",
                                                                     time: .empty,
                                                                     isAllDay: true,
                                                                     isAllYear: true,
                                                                     location: "Sea (when raining or snowing)",
                                                                     rarity: Rarity.ultraRare,
                                                                     monthArrayNorthern: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                                                                     monthArraySouthern: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                                                                     timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                                          speed: nil,
                                          shadow: "Largest (6)",
                                          price: 15000,
                                          iconURI: "https://acnhapi.com/v1/icons/fish/80",
                                          isCollected: false
  )
  
  static let seaSample = CollectibleItem(id: 40,
                                         name: Name(nameEUen: "Venus' flower basket", nameEUfr: "Corbeille de Vénus"),
                                         availability: Availability(monthNorthern: "10-2",
                                                                    monthSouthern: "4-8",
                                                                    time: .empty,
                                                                    isAllDay: true,
                                                                    isAllYear: false,
                                                                    location: nil,
                                                                    rarity: nil,
                                                                    monthArrayNorthern: [10, 11, 12, 1, 2],
                                                                    monthArraySouthern: [4, 5, 6, 7, 8],
                                                                    timeArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]),
                                         speed: "Fast",
                                         shadow: "Medium",
                                         price: 5000,
                                         iconURI: "https://acnhapi.com/v1/icons/sea/40",
                                         isCollected: true
  )
}
