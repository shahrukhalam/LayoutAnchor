import Foundation
import UIKit

public extension UIView {
    func pinToSuperviewEdges(constant: CGFloat = 0,
                             priority: UILayoutPriority = .required,
                             relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        pinToSuperview(edges: [.top, .bottom, .leading, .trailing],
                       constant: constant,
                       priority: priority,
                       relatedBy: relation)
    }

    func pinToSuperview(edges: [Edge],
                        constant: CGFloat = 0,
                        priority: UILayoutPriority = .required,
                        relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        for edge in edges {
            switch edge {
            case .top: pinToSuperviewTop(constant: constant, priority: priority, relatedBy: relation)
            case .bottom: pinToSuperviewBottom(constant: constant, priority: priority, relatedBy: relation)
            case .leading: pinToSuperviewLeading(constant: constant, priority: priority, relatedBy: relation)
            case .trailing: pinToSuperviewTrailing(constant: constant, priority: priority, relatedBy: relation)
            }
        }
    }

    @discardableResult func pinToSuperviewTop(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }

        return pinTop(to: superview, constant: constant, priority: priority, relatedBy: relation)
    }

    @discardableResult func pinToSuperviewBottom(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }

        return pinBottom(to: superview, constant: constant, priority: priority, relatedBy: relation)
    }

    @discardableResult func pinToSuperviewLeading(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }

        return pinLeading(to: superview, constant: constant, priority: priority, relatedBy: relation)
    }

    @discardableResult func pinToSuperviewTrailing(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }

        return pinTrailing(to: superview, constant: constant, priority: priority, relatedBy: relation)
    }
}
