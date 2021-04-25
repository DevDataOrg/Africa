//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Artyom Romanchuk on 25.04.2021.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: - PROPERTYS
    
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 20) {
                //: HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                
                //: TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height: 6)
                                    .offset(y: 20) //line uder text
                    )
                
                //: HEADLINE
                
                Text(animal.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //: GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //: FACTS
                
                //: DESCRIPTION
                
                //: MAP
                
                //: LINK
            }//: VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//: SCROLL
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11")
    }
}
