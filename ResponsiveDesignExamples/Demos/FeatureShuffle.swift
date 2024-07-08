//
//  FeatureShuffle.swift
//  Responsive Layouts
//
//  Created by Dan Wood on 7/17/20.
//
// See: https://designshack.net/articles/ux-design/5-really-useful-responsive-web-design-patterns/
//
// Also very similar to Three Column Content Reflow https://responsivedesign.is/patterns/three-column-content-reflow/
//
import SwiftUI

struct FeatureShuffle: View {

	let spacing = 10.0

	var body: some View {

		ScrollView {
			VStack(spacing:10) {

				Text("This is the Headline").font(.largeTitle)

				MyViewThatFits(in: .horizontal, useMinSize: true) {

					HStack(alignment: .top, spacing:spacing) {
						ForEach(0..<titles.count, id:\.self) { i in
							VStack(spacing:spacing) {
								Image(sovietImages[i])
									.centerCropped()
									.aspectRatio(1.5, contentMode: .fit)
								Text("\(titles[i])").font(.headline)
								Text(lorem).font(.body)
							}
							.padding(spacing)
						}
					}
					.frame(minWidth: 900)

					VStack(spacing:spacing) {
						ForEach(0..<titles.count, id:\.self) { i in
							HStack(spacing:spacing) {
								Image(sovietImages[i]).resizable().scaledToFit().frame(width: 100, height: 100, alignment: .center)

								VStack(alignment:.leading) {
									Text("\(titles[i])").font(.headline)
									Text(lorem).font(.body)
								}
								.padding(spacing)
							}
							.environment(\.layoutDirection, i%2==0 ? .leftToRight  : .rightToLeft)
						}
					}

					.frame(minWidth: 600)

					VStack(spacing:spacing) {
						ForEach(0..<titles.count, id:\.self) { i in
							VStack(spacing:spacing) {
								// No image
								Text("\(titles[i])").font(.headline)
								Text(lorem).font(.body)
							}
							.padding(spacing)
						}
					}
				}
			}
			.padding()
		}
	}
}
