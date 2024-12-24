//
//  ContentView.swift
//  macOS
//
//  Created by Junsang Ryu on 2023/01/09.
//

import SwiftUI

import Pretendard

struct ContentView: View {
  init() {
    do {
      try Pretendard.registerFonts()
    } catch {
      fatalError("Fail register font")
    }
  }


  var body: some View {
    HStack {
      GroupBox("System") {
        Text("Hello, world!")
          .font(
            .system(
              size: 14,
              weight: .regular
            )
          )

        Text("Hello, world!")
          .font(
            .system(
              size: 14,
              weight: .medium
            )
          )

        Text("Hello, world!")
          .font(
            .system(
              size: 14,
              weight: .semibold
            )
          )

        Text("Hello, world!")
          .font(
            .system(
              size: 14,
              weight: .bold
            )
          )
      }

      GroupBox("Pretendard") {
        Text("Hello, world!")
          .font(
            .pretendard(
              ofSize: 14,
              weight: .regular
            )
          )

        Text("Hello, world!")
          .font(
            .pretendard(
              ofSize: 14,
              weight: .medium
            )
          )

        Text("Hello, world!")
          .font(
            .pretendard(
              ofSize: 14,
              weight: .semibold
            )
          )

        Text("Hello, world!")
          .font(
            .pretendard(
              ofSize: 14,
              weight: .bold
            )
          )
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
