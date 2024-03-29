//
//  HomePage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct HomePage: View {
  var body: some View {
      VStack(alignment: .center) {
        Text("Currently Available")
          .font(.custom("FinkHeavy", size: 20))
          .font(.subheadline)
        
        ScrollView {
          VStack {
            Text("Fish")
              .font(.custom("FinkHeavy", size: 15))
            FishRow()
          }
          
          VStack {
            Text("Bugs")
              .font(.custom("FinkHeavy", size: 15))
            BugRow()
          }
          
          VStack {
            Text("Sea Creatures")
              .font(.custom("FinkHeavy", size: 15))
            SeaRow()
          }
        }
                
        Image("tide3")
          .resizable()
          .aspectRatio(contentMode: .fit)
        
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }


struct HomePage_Previews: PreviewProvider {
  static let items = CollectibleViewModel()
  
  static var previews: some View {
    HomePage()
  }
}
