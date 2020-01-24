//
//  ContentView.swift
//  getoff
//
//  Created by Steven Popovich on 1/24/20.
//  Copyright © 2020 Steven Popovich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let text: String
    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: "Hello, World!")
    }
}
