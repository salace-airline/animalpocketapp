//
//  Fish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation

public struct Fish: Identifiable {
  public let id: Int
  public let name: Name
  let availability: Availability
  public let shadow: String
  public let price: Int
  public let imageURI: String
  public let iconURI: String
  
  init(id: Int, name: Name, availability: Availability, shadow: String, price: Int, imageURI: String, iconURI: String) {
    self.id = id
    self.name = name
    self.availability = availability
    self.shadow = shadow
    self.price = price
    self.imageURI = imageURI
    self.iconURI = iconURI
  }
}

extension Fish: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case availability
    case shadow
    case price
    case imageURI = "image_uri"
    case iconURI = "icon_uri"
  }
}
