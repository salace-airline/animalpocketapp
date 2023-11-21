//
//  FishDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct FishDetails: View {
  @EnvironmentObject var collection: CollectionViewModel
  @EnvironmentObject var user: LoginViewModel
  var fish: CollectibleItem
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        CollectibleImage(item: fish, background: "fond_bleu")
          .accessibilityLabel(fish.name)
        
        HStack {
          Text(fish.name.capitalized)
            .font(.system(size: 15))
            .bold()
          
          CollectedButton(
            isCollected: .constant(collection.contains(fish) || user.containsFish(fish.itemNumber)),
            setImage: "fish.fill",
            unsetImage: "fish",
            setColor: .blue,
            updateCollection: {
              if user.isUserLoggedIn == true {
                Task {
                  if collection.contains(fish) {
                    collection.remove(fish)
                    await collection.updateFishCollection(with: fish.itemNumber)
                  } else {
                    collection.add(fish)
                    await collection.updateFishCollection(with: fish.itemNumber)
                  }
                }
              } else {
                // alert to tell the user they need to login to update their collection
                print("You need to login first!")
              }
            }
          )
        }
        .padding(.bottom, 0.5)
      }
      
      HStack {
        VStack(alignment: .leading) {
          HStack {
            Text("Period:")
          }
          HStack {
            Text("Time:")
          }
          HStack {
            Text("Place:")
          }
          HStack {
            Text("Price:")
          }
        }
        .foregroundColor(Colors.blue100)
        .bold()
        
        
        VStack(alignment: .leading) {
          HStack {
            Text(fish.period)
          }
          
          HStack {
            Text(fish.hour)
          }
          
          HStack {
            Text(fish.location ?? "")
          }
          
          HStack {
            Text("\(fish.price) bells")
          }
        }
      }
      .padding(.leading, 10)
      
      
      RarityBadge(rarity: RarityViewModel(rarityLevel: fish.rarity ?? .common)
      )
      .padding(
        EdgeInsets(
          top: 0,
          leading: 10,
          bottom: 10,
          trailing: 0
        )
      )
    }
    .font(.system(size: 11))
    .frame(width: 175)
    .background(Colors.blue100.opacity(0.1))
    .cornerRadius(4)
  }
}


struct GridItem_Previews: PreviewProvider {
  static var previews: some View {
    FishDetails(
      fish: CollectibleItem.fishSample
    )
  }
}
