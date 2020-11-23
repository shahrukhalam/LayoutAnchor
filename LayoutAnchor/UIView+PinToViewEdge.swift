import Foundation
import UIKit

extension UIView {
    
    @discardableResult public func pinTop(to view: UIView,
                                          constant: CGFloat = 0,
                                          priority: UILayoutPriority = .required,
                                          relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge: .top, to: .top, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pinBottom(to view: UIView,
                                             constant: CGFloat = 0,
                                             priority: UILayoutPriority = .required,
                                             relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge: .bottom, to: .bottom, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pinLeading(to view: UIView,
                                              constant: CGFloat = 0,
                                              priority: UILayoutPriority = .required,
                                              relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge: .leading, to: .leading, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pinTrailing(to view: UIView,
                                               constant: CGFloat = 0,
                                               priority: UILayoutPriority = .required,
                                               relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge: .trailing, to: .trailing, of: view,
                   constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pinCenterX(to view: UIView,
                                              constant: CGFloat = 0,
                                              priority: UILayoutPriority = .required,
                                              relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge: .centerX, to: .centerX, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pinCenterY(to view: UIView,
                                              constant: CGFloat = 0,
                                              priority: UILayoutPriority = .required,
                                              multiplier: CGFloat = 1,
                                              relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(edge: .centerY, to: .centerY, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pin(edge: XEdge,
                                       to otherEdge: XEdge,
                                       of view: UIView,
                                       constant: CGFloat = 0,
                                       priority: UILayoutPriority = .required,
                                       relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        if view !== superview {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let anchor = edge.anchor(for: self)
        let otherAnchor = otherEdge.anchor(for: view)
        
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func pin(edge: YEdge,
                                       to otherEdge: YEdge,
                                       of view: UIView,
                                       constant: CGFloat = 0,
                                       priority: UILayoutPriority = .required,
                                       relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        if view !== superview {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let anchor = edge.anchor(for: self)
        let otherAnchor = otherEdge.anchor(for: view)
        
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func width(constant: CGFloat = 0,
                                         priority: UILayoutPriority = .required,
                                         relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return constraint(dimension: .width, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func height(constant: CGFloat = 0,
                                          priority: UILayoutPriority = .required,
                                          relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return constraint(dimension: .height, constant: constant, priority: priority, relatedBy: relation)
    }
    
    private func constraint(dimension: Dimension,
                            constant: CGFloat = 0,
                            priority: UILayoutPriority = .required,
                            relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = dimension.anchor(for: self)
        
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalToConstant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult public func aspectRatio(_ aspectRatio: CGFloat)
    -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = Dimension.width.anchor(for: self)
        let otherAnchor = Dimension.height.anchor(for: self)
        
        let constraint = anchor.constraint(equalTo: otherAnchor, multiplier: aspectRatio)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult public func widthEqualToWidth(of view: UIView,
                                                     relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                                     priority: UILayoutPriority = .required,
                                                     multiplier: CGFloat = 1) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = Dimension.width.anchor(for: self)
        let otherAnchor = Dimension.width.anchor(for: view)
        
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: otherAnchor, multiplier: multiplier)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, multiplier: multiplier)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, multiplier: multiplier)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult public func heightEqualToHeight(of view: UIView,
                                                       relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                                       priority: UILayoutPriority = .required,
                                                       multiplier: CGFloat = 1) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = Dimension.height.anchor(for: self)
        let otherAnchor = Dimension.height.anchor(for: view)
        
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: otherAnchor, multiplier: multiplier)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, multiplier: multiplier)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, multiplier: multiplier)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    public func size(size: CGSize) {
        width(constant: size.width)
        height(constant: size.height)
    }
    
    public func pinCenter(to view: UIView,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = .required,
                          relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        pinCenterY(to: view, constant: constant, priority: priority, relatedBy: relation)
        pinCenterX(to: view, constant: constant, priority: priority, relatedBy: relation)
    }
}
