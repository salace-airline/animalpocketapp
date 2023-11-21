//
//  AllSeaCreatures.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct AllSeaCreatures: View {
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
            loadedSea(sea: user.showMissingSeaCreatures(viewModel.seaArray))
          case .increasingPrice:
            loadedSea(sea: viewModel.filter.increasePrice(of: user.showMissingSeaCreatures(viewModel.seaArray)))
          case .decreasingPrice:
            loadedSea(sea: viewModel.filter.decreasePrice(of: user.showMissingSeaCreatures(viewModel.seaArray)))
          case .alphatically:
            loadedSea(sea: viewModel.filter.sortAlphabetically(user.showMissingSeaCreatures(viewModel.seaArray)))
        }
      } else {
        switch viewModel.filter {
          case .noFilter:
            loadedSea(sea: viewModel.seaArray)
          case .increasingPrice:
            loadedSea(sea: viewModel.filter.increasePrice(of: viewModel.seaArray))
          case .decreasingPrice:
            loadedSea(sea: viewModel.filter.decreasePrice(of: viewModel.seaArray))
          case .alphatically:
            loadedSea(sea: viewModel.filter.sortAlphabetically(viewModel.seaArray))
        }
      }
    }
  }
  
  func loadedSea(sea: [CollectibleItem]) -> some View {
    VStack {
      SeaButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(sea) { sea in
            SeaDetails(sea: sea)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreatures()
    })
  }
}

struct AllSeaCreatures_Previews: PreviewProvider {
  static var previews: some View {
    AllSeaCreatures()
  }
}
