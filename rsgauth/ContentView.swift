//
//  ContentView.swift
//  swift-amplify-cognito
//
//  Created by Ross Gill on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var environmentObject: TestObject
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! \(environmentObject.num)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
