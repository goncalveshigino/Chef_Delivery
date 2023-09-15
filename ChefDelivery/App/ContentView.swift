//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Attributes
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
   
    
    @State private var isLoading = true
    
    
    //MARK - View
    
    var body: some View {
        
        NavigationView {
            if isLoading {
                ProgressView()
            } else {
                VStack(spacing: 0) {
                   NavigationBar()
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 20) {
                           OrderTypeGridView()
                           CarouselTabView()
                           StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
         
        }
        .onAppear {
            Task {
                await getStores()
            }
            getStoresWithAlamofire()
        }
    }
    
    func getStores() async {
        
        do {
            let result = try await service.fetchData()
            
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        } catch {
            print(error.localizedDescription)
            self.isLoading = false
        }
        
    }
    
    
    func getStoresWithAlamofire() {
        service.fetchDataWithAlamofire { stores, error in
            print(stores)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
