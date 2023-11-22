//
//  AllFish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct AllFish: View {
  @EnvironmentObject var user: LoginViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingItemsOnly {
        switch viewModel.filter {
          case .noFilter:
            loadedFish(fish: user.showMissingFish(user.showMissingFish(viewModel.fishArray)))
          case .increasingPrice:
            loadedFish(fish: viewModel.filter.increasePrice(of: user.showMissingFish(viewModel.fishArray)))
          case .decreasingPrice:
            loadedFish(fish: viewModel.filter.decreasePrice(of: user.showMissingFish(viewModel.fishArray)))
          case .alphatically:
            loadedFish(fish: viewModel.filter.sortAlphabetically(user.showMissingFish(viewModel.fishArray)))
        }
      } else {
        switch viewModel.filter {
          case .noFilter:
            loadedFish(fish: viewModel.fishArray)
          case .increasingPrice:
            loadedFish(fish: viewModel.filter.increasePrice(of: viewModel.fishArray))
          case .decreasingPrice:
            loadedFish(fish: viewModel.filter.decreasePrice(of: viewModel.fishArray))
          case .alphatically:
            loadedFish(fish: viewModel.filter.sortAlphabetically(viewModel.fishArray))
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
  
  func loadedFish(fish: [CollectibleItem]) -> some View {
    VStack {
      FishButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(fish) { fish in
            FishDetails(fish: fish)
          }
        }
      }
    }
  }
}

struct AllFish_Previews: PreviewProvider {
  static var previews: some View {
    AllFish()
  }
}
