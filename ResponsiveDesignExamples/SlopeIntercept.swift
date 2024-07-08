//
//  SlopeIntercept.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 7/1/24.
//

import Foundation
import CoreGraphics

import CoreGraphics

func scaledSize(smallSource: CGSize, smallScaled: CGSize, largeSource: CGSize, largeScaled: CGSize, targetSize: CGSize) -> CGSize {
	// Calculate the scaling factors based on the small and large reference sizes
	let scaleFactorWidth  = (largeScaled.width  - smallScaled.width)  / (largeSource.width  - smallSource.width)
	let scaleFactorHeight = (largeScaled.height - smallScaled.height) / (largeSource.height - smallSource.height)

	// Interpolate the target size based on the scaling factors
	let scaledWidth  = smallScaled.width  + (targetSize.width  - smallSource.width)  * scaleFactorWidth
	let scaledHeight = smallScaled.height + (targetSize.height - smallSource.height) * scaleFactorHeight

	return CGSize(width: scaledWidth, height: scaledHeight)
}
