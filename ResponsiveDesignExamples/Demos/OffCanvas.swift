//
//  OffCanvas.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 7/1/24.
//

import SwiftUI

struct OffCanvas: View {

	@State private var viewShowing: Int = 1	// 1 is main view

	var body: some View {

		GeometryReader { geo in
			ScrollView(.vertical) {
				MyViewThatFits(in: .horizontal, useMinSize: true) {

					// Widest - all three columns showing; no scrolling or interaction
					HStack(alignment: .top, spacing: 0) {
						HStackReversable(alignment: .top, spacing: 0, reverse: true) {
							View1()
								.frame(minWidth: 450)
								.layoutPriority(1)
							View2()
								.frame(minWidth: 225)
						}
						.layoutPriority(1)
						View3()
							.frame(minWidth: 200)
					}

					// Medium - View3 is hidden
					ScrollViewReader { scroller in

						ScrollView(.horizontal) {
							HStack {
								HStack(alignment: .top, spacing: 0) {
									HStackReversable(alignment: .top, spacing: 0, reverse: true) {
										VStack {
											HStack {
												Spacer()
												Button(viewShowing == 1 ? "➡️" : "↪️") {
													withAnimation {
														viewShowing = (viewShowing == 1) ? 3 : 1
														scroller.scrollTo(viewShowing)
													}
												}
												.buttonStyle(.borderless)
												.padding(8)
											}
											View1()
												.frame(minWidth: 400)
										}
										.layoutPriority(1)
										View2()
											.frame(minWidth: 200)
									}
									.id(1)
									.frame(width: geo.size.width)		// Columns 1 and 2, make exactly as wide as there is room
									.layoutPriority(1)
									View3()
										.id(3)
										.frame(minWidth: min(200, geo.size.width * 0.9), maxWidth: geo.size.width * 0.9)
								}
							}
						}
						.scrollDisabled(true)
						.onAppear {
							scroller.scrollTo(viewShowing)
						}
						.onChange(of: geo.size) {
							// iOS 18, macOS 15: may want to change to .onGeometryChange
							scroller.scrollTo(viewShowing)
						}
					}
					.frame(minWidth: 600)

					// Narrow - main column same width as visible width; other views have fixed width
					ScrollViewReader { scroller in

						ScrollView(.horizontal) {
							HStack {
								HStack(alignment: .top, spacing: 0) {
									HStackReversable(alignment: .top, spacing: 0, reverse: true) {
										VStack {
											HStack {
												Button(viewShowing == 1 ? "⬅️" : "↩️") {
													withAnimation {
														viewShowing = (viewShowing == 1) ? 2 : 1
														scroller.scrollTo(viewShowing)
													}
												}
												.buttonStyle(.borderless)
												.padding(8)
												Spacer()
												Button(viewShowing == 1 ? "➡️" : "↪️") {
													withAnimation {
														viewShowing = (viewShowing == 1) ? 3 : 1
														scroller.scrollTo(viewShowing)
													}
												}
												.buttonStyle(.borderless)
												.padding(8)
											}
											View1()
										}
										.id(1)
										.frame(width: geo.size.width)		// main column, make exactly as wide as there is room
										.layoutPriority(1)
										View2()
											.id(2)
											.frame(minWidth: min(225, geo.size.width * 0.9), maxWidth: geo.size.width * 0.9)
									}
									.layoutPriority(1)
									View3()
										.id(3)
										.frame(minWidth: min(200, geo.size.width * 0.9), maxWidth: geo.size.width * 0.9)
								}
							}
						}
						.scrollDisabled(true)
						.onAppear {
							scroller.scrollTo(viewShowing)
						}
						.onChange(of: geo.size) {
							// iOS 18, macOS 15: may want to change to .onGeometryChange
							scroller.scrollTo(viewShowing)
						}
					}
				}
			}
		}
	}
}

#Preview {
	OffCanvas()
}
