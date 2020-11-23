# LayoutAnchor
This is just a Helper Framework for easy auto-layout using Anchors.

## Features:
✅ Uses Anchor in place of old school NSLayoutConstraint  

✅ Unit Tested

**Semantic:** Let's You focus on your beautiful App idea, not the math behind Auto Layout Constraints

**Powerful:** Create multiple constraints with a single line of code

**Type Safe:** Takes care of Matching Anchors

**Expressive, Clear & Easy to use:** As easy as day-to-day English conversation

## How to use:

### SuperView
#### To pin a SubView to all Edges of it's SuperView:
```
view.pinToSuperviewEdges()
```

#### To pin a SubView to all Edges of it's SuperView by some Constant:
```
view.pinToSuperviewEdges(constant: 20)
```

#### To pin a SubView to all Edges of it's SuperView by some Constant, Priority & Relation:
```
view.pinToSuperviewEdges(constant: 20, priority: .defaultHigh, relatedBy: .greaterThanOrEqual)
```

#### To pin a SubView to some Edges of it's SuperView:
```
view.pinToSuperviewEdges(edges: [.top, .leading])
```

Or

```
view.pinToSuperviewTop()
view.pinToSuperviewLeading()
```

### One View to Another
#### To pin any Edge of View to any Edge of another View:
```
view.pin(edge: .leading, to: .trailing, of: otherView)
```

#### To pin any Edge of View to any Edge of another View by some Constant:
```
view.pin(edge: .leading, to: .trailing, of: otherView, constant: 20)
```

#### To pin any Edge of View to any Edge of another View by some Constant, Priority & Relation:
```
view.pin(edge: .leading, to: .trailing, of: otherView, constant: 20, priority: .defaultHigh, relatedBy: .greaterThanOrEqual)
```

#### To pin a particular Edge of View to that particular Edge of another View:
```
view.pinTop(to: otherView)
```

#### To pin centerX/CenterY of View to centerX/CenterY of another View:
```
view.pinCenterX(to: otherView)
```

#### To pin center of View to center of another View:
```
view.pinCenter(to: otherView)
```

#### To add a Width to a View:
```
view.width(constant: 200)
```

#### To add a Height to a View:
```
view.height(constant: 200)
```

#### To add a Size to a View:
```
view.size(size: CGSize(width: 200, height: 200))
```

#### To add an AspectRatio to a View:
```
view.aspectRatio(2.0)
```

#### To make Width/Height of a View equal to Width/Height of another View:
```
view.widthEqualToWidth(of: otherView)
```

#### To make Width/Height of a View equal to a Multiplier of Width/Height of another View:
```
view.widthEqualToWidth(of: otherView, multiplier: 0.5)
```
























