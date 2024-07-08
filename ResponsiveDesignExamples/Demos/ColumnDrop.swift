//
//  ColumnDrop.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 6/28/24.
//

import SwiftUI

struct ColumnDrop: View {

	var body: some View {

		ScrollView {
			MyViewThatFits(in: .horizontal, useMinSize: true) {

				// Widest - 900 and up
				HStack(alignment: .top, spacing: 0) {
					HStackReversable(alignment: .top, spacing: 0, reverse: true) {
						View1()
							.frame(minWidth: 450)
							.layoutPriority(1)
						View2()
							.frame(minWidth: 250)
					}
					.layoutPriority(1)
					View3()
						.frame(minWidth: 200)
				}

				// Medium - 600 and up
				VStack(spacing: 0) {
					HStackReversable(alignment: .top, spacing: 0, reverse: true) {
						View1()
							.frame(minWidth: 425)
							.layoutPriority(1)	// layoutPriority should come after the frame to make this column grow
						View2()
							.frame(minWidth: 175)
					}
					View3()
				}

				// Narrow
				VStack(spacing: 0) {
					View1()
					View2()
					View3()
				}
			}
		}
	}
}

#Preview {
	ColumnDrop()
}
