//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: OrderType
    
    var body: some View {
        VStack(spacing: 5) {
            
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .fixedSize(
                    horizontal: false,
                    vertical: true
                )
    
            Text(orderType.name)
                .font(.system(size: 12))
        }
        .frame(width: 80, height: 100)
    }
}

struct OrderTypeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeView(orderType: ordersMock[0])
        .previewLayout(.sizeThatFits)
    }
}
