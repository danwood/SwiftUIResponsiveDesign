//
//  ContentView.swift
//  Shared
//
//  Created by Dan Wood on 7/15/20.
//
// See: https://designshack.net/articles/css/5-really-useful-responsive-web-design-patterns/
// Similar to Layout Shifter
// See: https://www.lukew.com/ff/entry.asp?1514

import SwiftUI

struct Mondrian: View {

	let spacing = 0.0
	@State private var firstColumnWidth = 0.618
	@State private var aspectRatio = 1.618

	var body: some View {

		// Useful to tweak relative sizes
//		Slider(value: $firstColumnWidth, in: 0.5 ... 0.9)
//			.padding()
//		Slider(value: $aspectRatio, in: 0.75 ... 1.9)
//			.padding()
//		let _ = print(firstColumnWidth, aspectRatio)
		GeometryReader { geo in
			ScrollView {
				ViewThatFits(in: .horizontal) {

					// "WIDE" LAYOUT - 1 on the left, 2 and 3 stacked on the right

					HStack(alignment: .top, spacing:0) {
						Image1()
							.frame(width: geo.size.width * firstColumnWidth)

						VStack(spacing:0) {
							Image2()
							Image3()
						}
					}
					.aspectRatio(aspectRatio, contentMode: .fill)		// aspect ratio of all 3 images together
					.frame(minWidth: 900)

					// "MEDIUM" LAYOUT - 1 on the top, 2 and 3 together below

					VStack(spacing:spacing) {
						Image1()
							.aspectRatio(1.2, contentMode: .fill)
						HStack(alignment: .top, spacing:spacing) {
							Image2()
								.aspectRatio(1.2, contentMode: .fill)
							Image3()
								.aspectRatio(1.2, contentMode: .fill)
						}
					}
					.frame(minWidth: 600)

					// "NARROW" LAYOUT - all three stacked vertically

					VStack(spacing:spacing) {
						Image1()
							.aspectRatio(1.2, contentMode: .fill)
						Image2()
							.aspectRatio(1.2, contentMode: .fill)
						Image3()
							.aspectRatio(1.2, contentMode: .fill)
					}
				}
			}
		}
	}
}

#Preview {
	Mondrian()
}
