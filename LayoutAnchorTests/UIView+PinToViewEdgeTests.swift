import XCTest
import LayoutAnchor

class PinToViewEdgeTests: XCTestCase {

    var superview: UIView!
    var view: UIView!
    var view2: UIView!
    var view3: UIView!

    let superviewFrame = CGRect(x: 0, y: 0, width: 200, height: 300)

    override func setUp() {
        super.setUp()

        setupViewHierarchy()
    }

    func setupViewHierarchy() {
        superview = UIView(frame: superviewFrame)
        view = UIView()
        view2 = UIView()
        view3 = UIView()

        superview.addSubview(view)
        superview.addSubview(view2)
        view.addSubview(view3)
    }

    func updateFrames() {
        superview.setNeedsLayout()
        superview.layoutIfNeeded()
    }

    func testThatViewsCanBePinnedToAnotherViewEdge() {
        view.pinToSuperview(edges: [.top, .leading, .bottom])
        view2.pin(edge: .leading, to: .trailing, of: view)
        view2.pinToSuperview(edges: [.top, .trailing, .bottom])

        view.widthConstraint(constant: 150)

        updateFrames()

        XCTAssertEqual(view2.frame.width, 50)
        XCTAssertEqual(view2.frame.origin.x, 150)
    }

    func testThatViewsCanBePinnedToOtherViewHorizontally() {
        view.pinToSuperview(edges: [.top, .leading, .bottom])

        view2.pinTop(to: view)
        view2.pinBottom(to: view)
        view2.pin(edge: .leading, to: .trailing, of: view)
        view2.pinTrailing(to: superview)

        view.widthConstraint(constant: 100)

        updateFrames()

        XCTAssertEqual(view2.frame.width, 100)
        XCTAssertEqual(view2.frame.origin.x, 100)
    }

    func testThatViewsCanBePinnedToOtherViewVertically() {
        view.pinToSuperview(edges: [.top, .leading, .trailing])

        view2.pin(edge: .top, to: .bottom, of: view)
        view2.pinLeading(to: view)
        view2.pinBottom(to: superview)
        view2.pinTrailing(to: view)

        view.heightConstraint(constant: 150)

        updateFrames()

        XCTAssertEqual(view2.frame.height, 150)
        XCTAssertEqual(view2.frame.origin.y, 150)
    }

    func testThatViewCanBePinnedHorizontallyCentered() {
        view.pinToSuperview(edges: [.top, .leading, .trailing])
        view3.pinTop(to: view, constant: 20)
        view3.heightConstraint(constant: 50)
        view3.widthConstraint(constant: 50)
        view3.pinCenterX(to: view)
        view.heightConstraint(constant: 150)

        updateFrames()

        XCTAssertEqual(view3.frame.origin.x, 75)
    }

    func testThatViewCanBePinnedVerticallyCentered() {
        view.pinToSuperview(edges: [.top, .leading, .trailing])
        view3.heightConstraint(constant: 50)
        view3.widthConstraint(constant: 50)
        view3.pinCenterY(to: view)
        view.heightConstraint(constant: 150)

        updateFrames()

        XCTAssertEqual(view3.frame.origin.y, 50)
    }
}
