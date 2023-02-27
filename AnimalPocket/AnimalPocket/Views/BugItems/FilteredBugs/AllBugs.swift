//
//  AllBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct AllBugs: View {
  @ObservedObject var viewModel = BugsViewModel()
    
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {      
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.missingItems)
        case .increasingPrice:
          loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.bugsArray))
        case .decreasingPrice:
          loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.bugsArray))
        case .alphatically:
          loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.bugsArray))
      }
    }
  }
  
  func loadedBugs(with bugs: [CollectibleItem]) -> some View {
    NavigationStack {
      Toggle(isOn: $viewModel.showMissingItemsOnly) {
        Text("Missing Items Only")
      }
      
      BugButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(bugs) { bug in
            BugDetails(bug: bug)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadBugs()
    })
  }
}

struct AllBugs_Previews: PreviewProvider {
    static var previews: some View {
      AllBugs()
    }
}
