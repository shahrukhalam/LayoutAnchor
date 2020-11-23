import XCTest
import LayoutAnchor

class PinToSuperviewEdgesTests: XCTestCase {

    var superview: UIView!
    var view: UIView!

    let insetConstant: CGFloat = 20
    let superviewFrame = CGRect(x: 0, y: 0, width: 200, height: 300)
    let insetAllFrame = CGRect(x: 20, y: 20, width: 160, height: 260)
    let insetTopFrame = CGRect(x: 0, y: 20, width: 200, height: 280)

    override func setUp() {
        super.setUp()

        setupViewHierarchy()
    }

    func setupViewHierarchy() {
        superview = UIView(frame: superviewFrame)
        view = UIView()

        superview.addSubview(view)
    }

    func updateFrames() {
        superview.setNeedsLayout()
        superview.layoutIfNeeded()
    }

    func testThatTheConstraintsHavePriorityRequired() {
        view.pinToSuperviewEdges()

        superview.constraints.forEach { constraint in
            XCTAssertEqual(constraint.priority, .required)
        }
    }

    func testThatByDefaultTheFrameIsTheSameAsTheSuperviewFrame() {
        view.pinToSuperviewEdges()
        updateFrames()

        XCTAssertEqual(view.frame, superviewFrame)
    }

    func testTheConstantInsetsTheInnerView() {
        view.pinToSuperviewEdges(constant: insetConstant)
        updateFrames()

        XCTAssertEqual(view.frame, insetAllFrame)
    }

    func testThatSpecifyingEdgesIsEquivalentToSuperviewEdgesConvenienceAPI() {
        view.pinToSuperview(edges: [.top, .leading, .trailing, .bottom])
        updateFrames()

        XCTAssertEqual(view.frame, superviewFrame)
    }

    func testThatEdgeConstraintsCanBeAppliedSeparately() {
        view.pinToSuperviewTop(constant: insetConstant)
        view.pinToSuperviewBottom()
        view.pinToSuperviewLeading()
        view.pinToSuperviewTrailing()

        updateFrames()

        XCTAssertEqual(view.frame, insetTopFrame)
    }

    func testThatDifferentSuperviewConstraintAPIsCanBeCombined() {
        view.pinToSuperviewTop(constant: insetConstant)
        view.pinToSuperview(edges: [.leading, .trailing, .bottom])
        updateFrames()

        XCTAssertEqual(view.frame, insetTopFrame)
    }

    func testThatTheConstantOnIndividualConstraintsCanBeUpdated() {
        let top = view.pinToSuperviewTop()
        view.pinToSuperview(edges: [.leading, .trailing, .bottom])

        top.constant = insetConstant
        updateFrames()

        XCTAssertEqual(view.frame, insetTopFrame)
    }
}
