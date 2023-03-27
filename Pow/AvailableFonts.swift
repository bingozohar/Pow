//
//  AvailableFonts.swift
//  Pow
//
//  Created by Romi on 27/03/2023.
//

import SwiftUI

struct AvailableFonts: View {
    
    let allFontNames = UIFont.familyNames
      .flatMap { UIFont.fontNames(forFamilyName: $0) }
    
    var body: some View {
        List(allFontNames, id: \.self) { name in
          Text(name)
            .font(Font.custom(name, size: 12))
        }
    }
}

struct AvailableFonts_Previews: PreviewProvider {
    static var previews: some View {
        AvailableFonts()
    }
}
