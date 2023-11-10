//
//  SeaCreatureViewModel.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

final class SeaCreatureViewModel: ObservableObject {
  @Published var seaArray: [CollectibleItem] = []
  @Published var filter: Filter = .noFilter
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  @Published var isCollected = false
  
  @MainActor func loadSeaCreature() {
    Task {
      do {
        let response = try await CollectibleNetworkService.fetchCollectibles(path: CategoryRouter.seaCreature.path)
        let sea = response.map {
          CollectibleItem(
            itemNumber: $0.id,
            name: $0.name,
            monthNorthern: $0.monthNorthern,
            monthSouthern: $0.monthSouthern,
            monthArrayNorthern: $0.monthArrayNorthern,
            monthArraySouthern: $0.monthArraySouthern,
            availableTime: $0.availableTime,
            availableTimeArray: $0.availableTimeArray,
            isAllDay: $0.isAllDay,
            isAllYear: $0.isAllYear,
            location: $0.location,
            rarity: $0.rarity,
            speed: $0.speed,
            shadow: $0.shadow,
            price: $0.price,
            iconURI: $0.iconURI
//            isCollected: isCollected
          )
        }
        self.seaArray = sea
      } catch {
        print("Error", error)
      }
    }
  }
}

// Month & current filters
extension SeaCreatureViewModel {  
  var currentMonthSea: [CollectibleItem] {
    var currentSea: [CollectibleItem] = []
    for sea in seaArray {
      for month in sea.monthArrayNorthern {
        if month == sea.currentMonth {
          currentSea.append(sea)
        }
      }
    }
    return currentSea
  }
  
  var currentlyAvailable: [CollectibleItem] {
    var currentSea: [CollectibleItem] = []
    for sea in seaArray {
      for time in sea.availableTimeArray {
        if time == sea.currentTime {
          for month in sea.monthArrayNorthern {
            if month == sea.currentMonth {
              currentSea.append(sea)
            }
          }
        }
      }
    }
    return currentSea
  }
}
