//
//  AttributedText.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import SwiftUI
import WebKit

struct HTMLContentView: View {
    let htmlString: String
    
    var body: some View {
        convertHTMLToSwiftUI(htmlString)
    }
    
    func convertHTMLToSwiftUI(_ htmlString: String) -> Text {
        var modifiedString = htmlString
        // Replace <br> tags with line breaks
        modifiedString = modifiedString.replacingOccurrences(of: "<br><br>", with: "\n")
        modifiedString = modifiedString.replacingOccurrences(of: "<br>", with: "\n")
        // Replace <i> tags with italic modifier
        modifiedString = modifiedString.replacingOccurrences(of: "<i>", with: "")
        modifiedString = modifiedString.replacingOccurrences(of: "</i>", with: "")
        
        // Create the SwiftUI Text view with the modified string
        return Text(modifiedString)
    }
}

struct HTMLContentView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLContentView(
            htmlString: """
            Alchemy tore the Elric brothers’ bodies apart. Can their bond make them whole again?<br>
            In this world, alchemists are those who study and perform the art of alchemical transmutation—the science of manipulating and transforming matter. They are bounded by the Law of Equivalent Exchange: in order to gain something, one must sacrifice something of equal value.<br>
            In an alchemical ritual gone wrong, Edward Elric lost his arm and his leg, and his brother Alphonse became nothing but a soul in a suit of armor. Equipped with mechanical “auto-mail” limbs, Edward becomes a state alchemist, seeking the one thing that can restore his and his brother’s bodies...the legendary Philosopher’s Stone.<br><br>
            (Source: Viz Media)<br><br>
            <i>Note: Includes 8 extra chapters.</i>
            """
        )
        .padding(.all)
        .font(.footnote)
    }
}
