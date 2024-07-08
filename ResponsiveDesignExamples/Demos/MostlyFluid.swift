//
//  MostlyFluid.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 6/28/24.
//

import SwiftUI

struct MostlyFluid: View {

	var body: some View {

		ScrollView {
			MyViewThatFits(in: .horizontal, useMinSize: true) {

				// Wide - 600 width and more
				VStack(spacing: 0) {
					View1()
						.frame(minWidth: 600)

					HStack(alignment: .top, spacing: 0) {
						View2()
						View3()
					}
				}

				// Narrow
				VStack(spacing: 0) {
					View1()
					View2()
					View3()
				}
			}
			.frame(maxWidth: 900)
		}
	}
}

#Preview {
	MostlyFluid()
}
