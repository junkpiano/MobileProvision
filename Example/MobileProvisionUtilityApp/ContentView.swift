//
//  ContentView.swift
//  MobileProvisionUtilityApp
//
//  Created by Yusuke Ohashi on 2023/10/06.
//

import SwiftUI
import MobileProvision

struct ContentView: View {
    @State private var store = Store()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(store.count)")
            Button {
                store.increment()
            } label: {
                Text("CountUp")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
