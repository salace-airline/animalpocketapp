//
//  BugsOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugsOfTheMonth: View {
  @EnvironmentObject var user: UserViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingItemsOnly {
//        switch viewModel.filter {
//          case .noFilter:
//            loadedBugs(with: viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray)))
//          case .increasingPrice:
//            loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray))))
//          case .decreasingPrice:
//            loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray))))
//          case .alphatically:
//            loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray))))
//        }
        loadedBugs(with: viewModel.filterItems(user.showMissingBugs(viewModel.bugsArray)))
      } else {
        loadedBugs(with: viewModel.filterItems(viewModel.bugsArray))
      }
    }
    .onAppear(perform: {
      viewModel.loadBugs()
    })
  }
  
  func loadedBugs(with bugs: [CollectibleItem]) -> some View {
    VStack {
      BugButtons(viewModel: viewModel)

      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(bugs) { bug in
            BugDetails(bug: bug)
          }
        }
      }
    }
  }

  
//  func loadedMissingBugs(with bugs: [CollectibleItem]) -> some View {
//    VStack {
//      switch viewModel.filter {
//        case .noFilter:
//          viewModel.filterCurrentMonth(for: user.showMissingBugs(bugs))
//        case .increasingPrice:
//          viewModel.filter.increasePrice(of: viewModel.filterCurrentMonth(for: user.showMissingBugs(bugs)))
//        case .decreasingPrice:
//          viewModel.filter.decreasePrice(of: viewModel.filterCurrentMonth(for: user.showMissingBugs(bugs)))
//        case .alphatically:
//          viewModel.filter.sortAlphabetically(viewModel.filterCurrentMonth(for: user.showMissingBugs(bugs)))
//      }
//
//      BugButtons(viewModel: viewModel)
//
//      ScrollView(.vertical) {
//        LazyVGrid(columns: columns, spacing: 10) {
//          ForEach(bugs) { bug in
//            BugDetails(bug: bug)
//          }
//        }
//      }
//    }
//  }
}

struct BugsOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    BugsOfTheMonth(viewModel: CollectibleViewModel()
    )
  }
}
