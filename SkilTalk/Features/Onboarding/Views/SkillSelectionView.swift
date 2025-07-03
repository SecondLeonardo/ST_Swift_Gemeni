import SwiftUI

@available(iOS 16.0, *)
struct SkillSelectionView: View {
    @State private var selectedExpertSkills: Set<String> = []
    @State private var selectedTargetSkills: Set<String> = []

    let sampleSkills = ["Cooking", "Coding", "Photography", "Music", "Drawing", "Writing"]

    @available(iOS 16.0, *)
    var body: some View {
        VStack {
            Text("Select your Skills")
                .font(.title1)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Section(header: Text("Expert Skills (What you can teach)").font(.headline)) {
                FlowLayout(alignment: .leading, spacing: Spacing.s) {
                    ForEach(sampleSkills, id: \.self) {
                        skill in
                        SkillTag(skill: skill, isSelected: selectedExpertSkills.contains(skill)) {
                            if selectedExpertSkills.contains(skill) {
                                selectedExpertSkills.remove(skill)
                            } else {
                                selectedExpertSkills.insert(skill)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)

            Section(header: Text("Target Skills (What you want to learn)").font(.headline)) {
                FlowLayout(alignment: .leading, spacing: Spacing.s) {
                    ForEach(sampleSkills, id: \.self) {
                        skill in
                        SkillTag(skill: skill, isSelected: selectedTargetSkills.contains(skill)) {
                            if selectedTargetSkills.contains(skill) {
                                selectedTargetSkills.remove(skill)
                            } else {
                                selectedTargetSkills.insert(skill)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)

            PrimaryButton(title: "Next") {
                // Action to proceed
            }
            .padding()

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

@available(iOS 16.0, *)
struct SkillSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SkillSelectionView()
    }
}

// Helper views for SkillSelectionView
struct SkillTag: View {
    let skill: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Text(skill)
            .font(.subheadline)
            .padding(.vertical, Spacing.xs)
            .padding(.horizontal, Spacing.s)
            .background(isSelected ? Color.primaryTeal : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .textPrimary)
            .cornerRadius(5)
            .onTapGesture(perform: action)
    }
}

@available(iOS 16.0, *)
struct FlowLayout<Content: View>: View {
    let alignment: HorizontalAlignment
    let spacing: CGFloat
    @ViewBuilder let content: () -> Content

    var body: some View {
        // Correct usage of Layout protocol
        _FlowLayout(alignment: alignment, spacing: spacing) {
            content()
        }
    }

    @available(iOS 16.0, *)
    private struct _FlowLayout: Layout {
        let alignment: HorizontalAlignment
        let spacing: CGFloat

        func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
            let containerWidth = proposal.width ?? 0
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0
            var totalHeight: CGFloat = 0

            for subview in subviews {
                let subviewSize = subview.sizeThatFits(.unspecified)
                if currentX + subviewSize.width + spacing > containerWidth && currentX != 0 {
                    currentX = 0
                    currentY += lineHeight + spacing
                    totalHeight = currentY + subviewSize.height
                    lineHeight = 0
                }
                currentX += subviewSize.width + spacing
                lineHeight = max(lineHeight, subviewSize.height)
            }
            totalHeight = currentY + lineHeight
            return CGSize(width: containerWidth, height: totalHeight)
        }

        func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
            let containerWidth = bounds.width
            var currentX: CGFloat = bounds.minX
            var currentY: CGFloat = bounds.minY
            var lineHeight: CGFloat = 0

            for subview in subviews {
                let subviewSize = subview.sizeThatFits(.unspecified)
                if currentX + subviewSize.width + spacing > containerWidth && currentX != bounds.minX {
                    currentX = bounds.minX
                    currentY += lineHeight + spacing
                    lineHeight = 0
                }
                subview.place(at: CGPoint(x: currentX, y: currentY), proposal: .init(subviewSize))
                currentX += subviewSize.width + spacing
                lineHeight = max(lineHeight, subviewSize.height)
            }
        }
    }
}