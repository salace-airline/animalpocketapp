//
//  SeaCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct SeaCategory: View {
  @ObservedObject var viewModel = CollectibleViewModel()
  
  var body: some View {
    VStack {
      Text("Sea Creatures")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $viewModel.showCurrentItem, label: {
            Text("Currently")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showCurrentItem {
            CurrentSeaCreatures()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $viewModel.showItemsOfTheMonth, label: {
            Text("This Month")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showItemsOfTheMonth {
            SeaCreaturesOfTheMonth()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $viewModel.showAllItems, label: {
            Text("All Sea Creatures")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showAllItems {
            AllSeaCreatures()
          }
        }
      }
      Image("tide3")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}


struct SeaCategory_Previews: PreviewProvider {
    static var previews: some View {
        SeaCategory()
    }
}
