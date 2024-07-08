//
//  FluidTypography.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 7/1/24.
//

import SwiftUI

// Very simple clamp function given a fraction and the width of the entire container. Not at all as sophisticated as the CSS clamp function!
func clamp(min: CGFloat, preferredFraction: CGFloat, max: CGFloat, containerWidth: CGFloat) -> CGFloat {
	let preferredValue = preferredFraction * containerWidth
	return Swift.min(Swift.max(min, preferredValue), max)
}

struct FluidTypography: View {

	@State private var imageSize: CGSize = .zero

	var body: some View {

		VStack(spacing: 0) {
			Text("Width: \(Int(imageSize.width)) Height: \(Int(imageSize.height))")
				.frame(height: 20)
			GeometryReader { geo in
				Text(longLoremIpsum)
					.font(.system(size: clamp(min: 12, preferredFraction: 0.025, max: 48, containerWidth: geo.size.width)))
					.onAppear {
						imageSize = geo.size
					}
					.onChange(of: geo.size) {
						// iOS 18, macOS 15: may want to change to .onGeometryChange
						imageSize = geo.size
					}
			}
		}
		.padding()
	}
}

#Preview {
	FluidTypography()
}
