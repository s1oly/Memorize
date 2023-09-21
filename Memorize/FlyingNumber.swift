//
//  FlyingNumber.swift
//  Memorize
//
//  Created by S1OLY on 9/19/23.
//

import SwiftUI

struct FlyingNumber: View {
    let number : Int
    var body: some View {
        if number != 0{
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number : 5)
}
