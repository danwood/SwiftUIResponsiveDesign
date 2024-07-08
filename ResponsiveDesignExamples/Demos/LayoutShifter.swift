//
//  LayoutShifter.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 6/29/24.
//

import SwiftUI

struct LayoutShifter: View {

	var body: some View {

		ScrollView {
			MyViewThatFits(in: .horizontal, useMinSize: true) {

				// Wide - minimum 600 points in width, total
				HStack(alignment: .top, spacing: 0) {
					View2()
						.frame(minWidth: 200)
					VStack(spacing: 0) {
						View1()
						View3()
					}
					.frame(minWidth: 400)
					.layoutPriority(1)
				}

				// Narrow
				VStack(spacing: 0) {
					View2()
					View1()
					View3()
				}
			}
			.frame(maxWidth: 900)
		}
	}
}

#Preview {
	LayoutShifter()
}
