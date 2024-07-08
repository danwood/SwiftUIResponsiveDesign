//
//  BasicGallery.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 7/5/24.
//

import SwiftUI

struct BasicGallery: View {

	let spacing: CGFloat = 20.0
	let minWidth: CGFloat = 290.0		// At width of approximately 600 and above, this would fit two side-by-side.  ~900 and up -> three

	var body: some View {

		let columns: [GridItem] = [GridItem(.adaptive(minimum: minWidth), spacing: spacing, alignment: .top)]

		let allTitles = titles + moreTitles

		return ScrollView {

			VStack(spacing:spacing) {

				Text("Book List").font(.largeTitle)

				LazyVGrid(columns: columns, spacing:spacing) {		// Spacing is vertical here

					ForEach(0..<allTitles.count, id:\.self) { i in
						VStack(spacing: spacing) {

							Image(sovietImages[i])
								.centerCropped()
								.aspectRatio(1.5, contentMode: .fit)

							Text("\(allTitles[i])").font(.headline)
						}
					}
				}
			}
			.frame(maxWidth: (4 * minWidth + 3 * spacing) - 1)	// One point less than what would (just barely) fit 4 across, so we won't ever get 4 or more across.
			.padding()
		}
	}
}

#Preview {
	BasicGallery()
}
