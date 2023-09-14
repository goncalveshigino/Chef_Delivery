//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                
               NavigationBar()
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                       OrderTypeGridView()
                       CarouselTabView()
                       StoresContainerView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
