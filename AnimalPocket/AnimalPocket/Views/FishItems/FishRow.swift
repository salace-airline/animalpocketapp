//
//  GridView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishRow: View {
  @ObservedObject var viewModel = FishViewModel()
  
  var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
  let rows = [
    GridItem()
  ]
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.fishArray) { fish in
          FishDetails(fish: fish)
        }
      }
//      LazyVGrid(columns: columns) {
//        ForEach(viewModel.fishArray) { fish in
//          FishDetails(fish: fish)
//        }
//      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
}

struct FishGrid_Previews: PreviewProvider {
  static var previews: some View {
    FishRow(viewModel: FishViewModel())
  }
}