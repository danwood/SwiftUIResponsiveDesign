//
//  HStackReversable.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 6/28/24.
//

import SwiftUI

struct HStackReversable<Content>: View where Content: View {

	@Environment(\.layoutDirection) var layoutDirection

	/// Creates a horizontal stack with the given spacing and vertical alignment AND direction reversal
	///
	/// - Parameters:
	///   - alignment: The guide for aligning the subviews in this stack. This
	///	 guide has the same vertical screen coordinate for every subview.
	///   - spacing: The distance between adjacent subviews, or `nil` if you want the stack to choose a default distance for each pair of subviews.
	///   - reverse: Whether to switch direction, e.g. RtoL in an LtoR environment
	///   - content: A view builder that creates the content of this stack.
	init(
		alignment: VerticalAlignment = .center,
		spacing: CGFloat? = nil,
		reverse: Bool = false,
		@ViewBuilder content: () -> Content
	) {
		self.alignment = alignment
		self.spacing = spacing
		self.reverse = reverse
		self.content = content()
	}

	let content: Content
	let alignment: VerticalAlignment
	let spacing: CGFloat?
	let reverse: Bool

	var body: some View {
		HStack(alignment: alignment, spacing: spacing) {
				content
					.environment(\.layoutDirection, layoutDirection)	// the actual content in normal direction
			}
			.environment(\.layoutDirection, reverse == (layoutDirection == .leftToRight) ? .rightToLeft : .leftToRight)
	}
}

#Preview {

	HStackReversable(spacing: 40, reverse: false) {
		HStack {
			Text("1")
			Text("2")
			Text("3")
		}
		HStack {
			Text("4")
			Text("5")
			Text("6")
		}
	}

	HStackReversable {
		HStack {
			Text("1")
			Text("2")
			Text("3")
		}
		HStack {
			Text("4")
			Text("5")
			Text("6")
		}
	}

	HStackReversable(reverse: true) {
		HStack {
			Text("1")
			Text("2")
			Text("3")
		}
		HStack {
			Text("4")
			Text("5")
			Text("6")
		}
	}
}
