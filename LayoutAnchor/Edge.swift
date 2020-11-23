import UIKit

public enum Edge {
    case top
    case bottom
    case leading
    case trailing
}

public enum XEdge {
    case leading
    case trailing
    case centerX

    func anchor(for view: UIView) -> NSLayoutAnchor<NSLayoutXAxisAnchor> {
        switch self {
        case .leading:
            return view.leadingAnchor
        case .trailing:
            return view.trailingAnchor
        case .centerX:
            return view.centerXAnchor
        }
    }
}

public enum YEdge {
    case top
    case bottom
    case centerY

    func anchor(for view: UIView) -> NSLayoutAnchor<NSLayoutYAxisAnchor> {
        switch self {
        case .top:
            return view.topAnchor
        case .bottom:
            return view.bottomAnchor
        case .centerY:
            return view.centerYAnchor
        }
    }
}

enum Dimension {
    case width
    case height

    func anchor(for view: UIView) -> NSLayoutDimension {
        switch self {
        case .width:
            return view.widthAnchor
        case .height:
            return view.heightAnchor
        }
    }
}
