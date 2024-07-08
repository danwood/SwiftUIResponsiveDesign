//
//  ColumnFlip.swift
//  Responsive Layouts
//
//  Created by Dan Wood on 7/17/20.
//
// See: https://designshack.net/articles/ux-design/5-really-useful-responsive-web-design-patterns/
//
//
//
import SwiftUI

struct ColumnFlip: View {

	let spacing = 20.0

	var body: some View {

		// Same number as above.  If we were to be general, we should build up columns to equal # of items
		let columns : [GridItem] = Array(repeating: .init(.flexible(), spacing:spacing), count: 4)	// spacing is horizontal here

		return ScrollView {
			VStack(spacing:spacing) {

				Text("Book List").font(.largeTitle)

				MyViewThatFits(in: .horizontal, useMinSize: true) {

					// LARGE - 3 full rows - 900 and up

					VStack(spacing:spacing) {

						ForEach(0..<titles.count, id:\.self) { i in
							HStack(alignment:.top, spacing: spacing) {

								Image(sovietImages[i])
									.resizable()
									.scaledToFit()

								VStack(alignment:.leading, spacing: spacing) {

									Text("\(titles[i])").font(.headline)
									Text(lorem).font(.body)
								}

								Image(avatarImages[i])
									.avatar()

								VStack(alignment:.leading, spacing: spacing) {

									Text("\(authors[i])").font(.headline)
									Text(lorem).font(.body)
								}
							}
						}
					}
					.frame(minWidth: 900)

					// MEDIUM - 3 big pictures, then below 3 rows - 600 to 900 wide

					VStack(spacing:spacing) {

						// 3 big pictures across, equal width

						// For some reason I can't get them to have a spacing of zero
						LazyVGrid(columns:columns, spacing: spacing) {	// vertical spacing

							ForEach(0..<titles.count, id:\.self) { i in

								Image(sovietImages[i])
									.resizable()
									.scaledToFit()
									.frame(maxHeight:200)	// don't let a portrait image get too tall
							}
						}

						ForEach(0..<titles.count, id:\.self) { i in

							// Everything else is identical to the wide.

							HStack(alignment:.top, spacing: spacing) {

								VStack(alignment:.leading, spacing: spacing) {

									Text("\(titles[i])").font(.headline)
									Text(lorem).font(.body)
								}
								Image(avatarImages[i])
									.avatar()

								VStack(alignment:.leading, spacing: spacing) {

									Text("\(authors[i])").font(.headline)
									Text(lorem).font(.body)
								}
							}
						}
					}
					.frame(minWidth: 600)

					// Lots of options here but let's mostly stack things vertically, but avatar next to text.

					VStack(spacing:spacing) {

						ForEach(0..<titles.count, id:\.self) { i in

							Image(sovietImages[i])
								.resizable()
								.scaledToFit()
								.frame(maxHeight:150)	// don't make it too tall.

							Text("\(titles[i])").font(.headline)
							Text(lorem).font(.body)

							HStack(alignment:.top, spacing: spacing) {

								Image(avatarImages[i])
									.avatar()

								VStack(alignment:.leading, spacing: spacing) {

									Text("\(authors[i])").font(.headline)
									Text(lorem).font(.body)
									}
							}
						}
					}
				}
			}
			.padding()
		}
	}
}
