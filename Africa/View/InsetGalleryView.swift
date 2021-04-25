//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Artyom Romanchuk on 25.04.2021.
//

import SwiftUI

struct InsetGalleryView: View {
    
    //MARK: PROPERTYS
    let animal: Animal
    
    
    //MARK: BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15 ) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item) //Image(animal.gallery[0]) before add loop 
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//: LOOP
            }//: HSTACK
        }//: SCROLLVIEW
      
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
