//
//  ScalingDemo.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 7/1/24.
//

import SwiftUI

#if os(iOS) || os(watchOS) || os(tvOS)
extension Image {
	init(nsImage: UIImage) {
		self.init(uiImage: nsImage)
	}
}
#endif

struct ScalingDemo: View {

	@State private var imageSize: CGSize = .zero

	var body: some View {

			VStack(spacing: 0) {
				Text("Image Width: \(Int(imageSize.width)) Height: \(Int(imageSize.height))")
					.frame(height: 20)
				GeometryReader { geo in
					Image(.abstract)
						.resizable()
						.onAppear {
							imageSize = geo.size
						}
						.onChange(of: geo.size) {
							// iOS 18, macOS 15: may want to change to .onGeometryChange
							imageSize = geo.size
						}
						.overlay {
							var scaledSize =
							scaledSize(smallSource: CGSize(width: 100, height: 100), smallScaled: CGSize(width: 20, height: 20),	// 1/5 of size of small image
									   largeSource: CGSize(width: 400, height: 400), largeScaled: CGSize(width: 40, height: 40),	// 1/10 of size of large image
									   targetSize: geo.size)
							if scaledSize.width < 10 || scaledSize.height < 10 {
								scaledSize = CGSize(width: 10, height: 10)
							}
							return "🆕".toImage()
								.resizable()
								.frame(width: scaledSize.width, height: scaledSize.width)	// keep 1:1 ratio
								.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
								.padding(10)
						}
				}
			}
	}
}

#Preview {
	ScalingDemo()
}
