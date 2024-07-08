//
//  ContentView.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 6/28/24.
//

import SwiftUI

#if os(iOS)

extension UIUserInterfaceIdiom : @retroactive CustomStringConvertible {
	public var description: String {
		switch self {
		case .unspecified: "unspecified"
		case .phone: "iPhone"
		case .pad: "iPad"
		case .tv: "TV"
		case .carPlay: "CarPlay"
		case .mac: "Mac"
		case .vision: "Vision"
		@unknown default: "unknown"
		}
	}
}
#endif

//	extension EnvironmentValues {
//		@Entry var deviceIsCompact: Bool = true
//	}
	private struct CompactKey: EnvironmentKey {
		static let defaultValue = false
	}

	extension EnvironmentValues {
		var deviceIsCompact: Bool {
			get { self[CompactKey.self] }
			set { self[CompactKey.self] = newValue }
		}
	}

struct ContentView: View {

	@Environment(\.horizontalSizeClass) var horizontalSizeClass // iOS only
#if os(iOS)
	@Environment(\.sizeCategory) var sizeCategory
	// "That asks the system to provide the current size category from the environment, which determines what level Dynamic Type is set to. The trick is that we don’t actually use it – we don’t care what the Dynamic Type setting is, but by asking the system to update us when it changes our UIFontMetrics code will be run at the same time, causing our font to scale correctly."
	var bodySize: CGFloat { UIFontMetrics.default.scaledValue(for: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body).pointSize) }

	var deviceIsCompact: Bool {
		if ProcessInfo.processInfo.isMacCatalystApp || ProcessInfo.processInfo.isiOSAppOnMac {
			return false
		}
		return horizontalSizeClass == .compact
	}
	let backingScaleFactor: CGFloat = UIScreen.main.scale
#elseif os(macOS)


	// Better to use this than the horizontalSizeClass since it will also work on macOS.
	@State private var deviceIsCompact: Bool = false
#endif

	// Empirically found to match ios.
	// iPhone horizontal screen size ranges 320 [obsolete] up to 430 [iPhone 15 Pro Max]
	// landscape mode, iphone 15 & 15 Pro is 852 and is considered compact
	// iphone 15 pro max is 932 and is regular (but STILL shows 1 table column!)
	// So we could set breakpoint around 900 to mimic iOS, but that depends on the content.
	let breakpointWidth = 600

	var body: some View {
		VStack {
			NavigationSplitView {
				List {
					Section("General") {

						NavigationLink("Scaling", destination: ScalingDemo())
						NavigationLink("Fluid Typography", destination: FluidTypography())
						NavigationLink("Table View", destination: TableView())
					}
					Section("Luke's Patterns") {
						NavigationLink("Mostly Fluid", destination: MostlyFluid())
						NavigationLink("Column Drop", destination: ColumnDrop())
						NavigationLink("Layout Shifter", destination: LayoutShifter())
						NavigationLink("Off Canvas", destination: OffCanvas())
					}
					Section("Joshua's Patterns") {
						NavigationLink("Mondrian", destination: Mondrian())
						NavigationLink("Basic Gallery", destination: BasicGallery())
						NavigationLink("Featured Items", destination: FeaturedItems())
						NavigationLink("Column Flip", destination: ColumnFlip())
						NavigationLink("Feature Shuffle", destination: FeatureShuffle())
					}
					Section("One More Thing") {
						NavigationLink("Data Table Stack", destination: DataTableStack())
					}
				}
			} detail: {
				EmptyView()
			}
		}
	#if os(macOS)
		.background {
			GeometryReader { geo in
				Color.clear
					.onChange(of: geo.size) {
						// iOS 18, macOS 15: may want to change to .onGeometryChange
						deviceIsCompact = geo.size.width < 600
					}
			}
		}
		#endif
		.environment(\.deviceIsCompact, deviceIsCompact)
	}
}

#Preview {
	ContentView()
}

