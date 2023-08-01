// The MIT License (MIT)
//
// Copyright (c) 2020–2023 Alexander Grebenyuk (github.com/kean).

import SwiftUI

struct Checkbox<Label: View>: View {
    @Binding var isOn: Bool
    let label: () -> Label

    var body: some View {
#if os(iOS)
        Button(action: { isOn.toggle() }) {
            HStack {
                Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundColor(isOn ? .blue : .separator)
                label()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .contentShape(Rectangle())
        }.buttonStyle(.plain)
#else
        Toggle(isOn: $isOn, label: label)
#endif
    }
}

extension Checkbox where Label == Text {
    init(_ title: String, isOn: Binding<Bool>) {
        self.init(isOn: isOn) { Text(title) }
    }
}
