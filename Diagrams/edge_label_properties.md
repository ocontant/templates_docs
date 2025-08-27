# Edge Label Properties Reference

A comprehensive guide to all available label attributes and properties for Edge labels in Graphviz (used by the diagrams library).

## 🏷️ Basic Label Properties

| Property | Type | Description | Example | Default |
|----------|------|-------------|---------|---------|
| `label` | string | The text to display on the edge | `label="Data Flow"` | `""` |
| `xlabel` | string | External label positioned outside the edge | `xlabel="External Label"` | `""` |
| `headlabel` | string | Label positioned near the arrowhead/end | `headlabel="To"` | `""` |
| `taillabel` | string | Label positioned near the tail/start | `taillabel="From"` | `""` |

## 📍 Label Positioning & Distance

| Property | Type | Description | Example | Default |
|----------|------|-------------|---------|---------|
| `labeldistance` | float | Distance from edge center (smaller = closer) | `labeldistance="0.1"` | `1.0` |
| `labelangle` | float | Angle of label relative to edge (degrees) | `labelangle="0"` | `0` |
| `labelpos` | string | Position along edge: "c" (center), "h" (head), "t" (tail) | `labelpos="c"` | `"c"` |
| `labelfloat` | boolean | Allow label to float away from edge | `labelfloat="false"` | `"true"` |
| `decorate` | boolean | Force label to follow edge path closely | `decorate="true"` | `"false"` |

## 🎨 Label Typography & Styling

| Property | Type | Description | Example | Default |
|----------|------|-------------|---------|---------|
| `fontname` | string | Font family for all text | `fontname="Arial"` | System default |
| `fontsize` | float | Font size in points | `fontsize="12"` | `14.0` |
| `fontcolor` | string | Text color (hex, name, or RGB) | `fontcolor="#333333"` | `"black"` |
| `labelfontname` | string | Specific font for edge labels only | `labelfontname="Helvetica"` | Inherits `fontname` |
| `labelfontsize` | float | Specific font size for edge labels | `labelfontsize="10"` | Inherits `fontsize` |
| `labelfontcolor` | string | Specific color for edge labels | `labelfontcolor="blue"` | Inherits `fontcolor` |

## 📦 Label Background & Spacing

| Property | Type | Description | Example | Default |
|----------|------|-------------|---------|---------|
| `labelbgcolor` | string | Background color behind label | `labelbgcolor="white"` | `"transparent"` |
| `labelmargin` | float | Margin/padding around label text | `labelmargin="0.1"` | `0.11` |
| `labeljust` | string | Text justification: "l" (left), "c" (center), "r" (right) | `labeljust="c"` | `"c"` |

## 🔧 Advanced Label Control

| Property | Type | Description | Example | Default |
|----------|------|-------------|---------|---------|
| `concentrate` | boolean | Merge parallel edges (affects label space) | `concentrate="true"` | `"false"` |
| `constraint` | boolean | Whether edge affects node ranking | `constraint="false"` | `"true"` |
| `minlen` | integer | Minimum edge length (affects available space) | `minlen="2"` | `1` |
| `len` | float | Preferred edge length | `len="2.0"` | `1.0` |

## 💡 Common Use Cases & Best Practices

### Close Label Positioning (3-5px from line)

```python
# Method 1: Aggressive positioning
Edge(
    label="Data Flow",
    labeldistance="0.1",      # Very close to line
    decorate="true",          # Follow edge path
    labelfloat="false",       # Don't float away
    labelangle="0"            # Keep horizontal
)

# Method 2: Head/Tail labels
Edge(
    headlabel="Response",     # At arrow end
    taillabel="Request",      # At arrow start
    labeldistance="0.2"
)

# Method 3: External labels (best for avoiding overlaps)
Edge(
    xlabel="External Label"   # Positioned outside edge
)
```

### Multi-line Labels

```python
Edge(
    label="Line 1\\nLine 2\\nLine 3",  # Use \\n for line breaks
    labeljust="l"                      # Left-align multi-line text
)
```

### Styled Labels

```python
Edge(
    label="Important Connection",
    labelfontname="Arial Bold",
    labelfontsize="14",
    labelfontcolor="#FF0000",
    labelbgcolor="#FFFFFF",
    labelmargin="0.2"
)
```

### Complex Layouts with Multiple Labels

```python
Edge(
    label="Main Label",        # Center label
    headlabel="End",          # At arrowhead
    taillabel="Start",        # At tail
    xlabel="External Info",   # External label
    labeldistance="0.5"
)
```

## ⚠️ Common Issues & Solutions

### Problem: Labels too far from lines
**Solutions:**
- Use `labeldistance="0.1"` or smaller
- Set `decorate="true"`
- Set `labelfloat="false"`
- Consider using `xlabel` for external positioning

### Problem: Label overlaps with other elements
**Solutions:**
- Use `xlabel` instead of `label`
- Increase `labelmargin`
- Add `labelbgcolor` for background
- Use shorter label text

### Problem: Labels at wrong angle
**Solutions:**
- Set `labelangle="0"` for horizontal
- Use `decorate="true"` to follow edge path
- Consider `headlabel`/`taillabel` for specific positioning

### Problem: Multi-line labels not formatting correctly
**Solutions:**
- Use `\\n` for line breaks (double backslash)
- Set appropriate `labeljust` ("l", "c", or "r")
- Increase `labelmargin` for spacing

## 🔗 Graphviz Documentation References

- [Official Graphviz Edge Attributes](https://graphviz.org/doc/info/attrs.html)
- [Graphviz Label Guide](https://graphviz.org/Gallery/directed/datastruct.html)
- [Python Diagrams Library](https://diagrams.mingrammer.com/)

## 📝 Notes

- All measurements are in inches unless specified otherwise
- Boolean values should be strings: `"true"` or `"false"`
- Color values support hex (`#FF0000`), names (`red`), or RGB (`"1.0,0.0,0.0"`)
- Font names depend on system availability
- Some attributes may not be supported by all Graphviz layouts