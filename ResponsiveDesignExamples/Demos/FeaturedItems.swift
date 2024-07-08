//
//  FeaturedItems.swift
//  Responsive Layouts
//
//  Created by Dan Wood on 7/18/20.
//
// See: https://designshack.net/articles/ux-design/5-really-useful-responsive-web-design-patterns/
// Basically just have 4 columns in wide, down to 2, down to 1.
// We could use LazyVGrid with ranges, but that would allow the layout to have an intermediate state with 3 columns
// This one just switches layout by adjusting the column template for LazyVGrid

import SwiftUI

struct FeaturedItems: View {

	let spacing: CGFloat = 20.0
	@State private var screenWidth: CGFloat = 0.0

	var body: some View {

		let numAcross = switch(screenWidth) {
		case 0 ..< 600: 1		// 1 column ..<600 wide
		case 600 ..< 1200: 2	// 2 columns from 350 ..< 600 wide
		default: 4				// 4 columns 300 ... wide
		}
		let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing:spacing), count: numAcross)	// spacing is horizontal here

		return ScrollView {
			GeometryReader { geo in

				VStack(spacing:spacing) {

					Text("Book List").font(.largeTitle)

					LazyVGrid(columns: columns, spacing:spacing) {		// Spacing is vertical here

						ForEach(0..<titles.count, id:\.self) { i in
							VStack(spacing: spacing) {

								Image(sovietImages[i])
									.centerCropped()
									.aspectRatio(1.5, contentMode: .fit)

								Text("\(titles[i])").font(.headline)
								Text(lorem).font(.body)

								Image(avatarImages[i])
									.avatar()

								Text("\(authors[i])").font(.headline)
								Text(lorem).font(.body)
							}
						}
					}
				}

				// Make sure it uses up full width
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .top)

				.onAppear {
					screenWidth = geo.size.width
				}
				.onChange(of: geo.size) {
					// iOS 18, macOS 15: may want to change to .onGeometryChange
					screenWidth = geo.size.width
				}
			}
			.padding()
		}
	}
}

