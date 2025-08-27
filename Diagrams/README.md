# Hub & Spoke Architecture Template

Advanced template system for creating professional, rule-based Hub & Spoke diagrams with intelligent spacing, line routing, and theme support.

## Overview

This template provides a comprehensive framework for creating Azure Landing Zone hub & spoke architecture diagrams with:

- **Intelligent Layout**: Automatic spacing and positioning rules
- **Theme Support**: Light and dark themes with semantic colors
- **Hierarchical Organization**: Clean 4-5 level container hierarchy
- **Professional Styling**: Consistent visual design patterns
- **Abstracted Dependencies**: All diagram components imported from a single source

## Files Structure

```
├── hub_spoke_template.py    # Main template class and all dependencies
├── examples.py             # Example implementations
├── README.md              # This documentation
└── diagrams/              # Generated diagram output folder
```

## Quick Start

```python
# Simple import - all dependencies included
from hub_spoke_template import (
    HubSpokeTemplate,
    Diagram, Cluster, Edge,
    ApplicationGateway, LoadBalancers, VirtualMachines,
    Firewall, Router, Internet
)

# Create template
template = HubSpokeTemplate(theme='light')

# Use template styling
with Diagram("My Architecture", show=False):
    with Cluster("Region", graph_attr=template.get_region_style()):
        with Cluster("Hub", graph_attr=template.get_hub_style()):
            firewall = Firewall("Hub Firewall")
```

## Architecture Hierarchy

### Current Implementation (4 Levels)

| Level | Container Type | Purpose | Example |
|-------|---------------|---------|---------|
| 1 | **Region** | Geographic/logical boundaries | "East US", "West Europe" |
| 2 | **Hub/Spoke** | Network architecture containers | "Connectivity Hub", "Corp Spoke" |
| 3 | **Zones** | Security/functional zones | "DMZ Zone", "App Zone", "Data Zone" |
| 4 | **Services** | Individual components | Firewall, LoadBalancer, VirtualMachines |

### Recommended Azure Landing Zone Hierarchy (5 Levels)

```python
# Level 1: Management Groups / Subscriptions
with Cluster("Platform Subscription", **template.get_region_style()):
    
    # Level 2: Regional Boundary  
    with Cluster("Primary Region - East US 2", **template.get_region_style()):
        
        # Level 3: Network Architecture (Hub & Spoke)
        with Cluster("Connectivity Hub", **template.get_hub_style()):
            
            # Level 4: Network Zones/Subnets
            with Cluster("Gateway Subnet", **template.get_zone_style()):
                
                # Level 5: Azure Services
                vpn_gateway = VPNGateway("VPN Gateway")
                expressroute_gw = ExpressRouteGateway("ExpressRoute Gateway")
            
            with Cluster("AzureFirewallSubnet", **template.get_zone_style()):
                azure_firewall = AzureFirewall("Azure Firewall")
            
            with Cluster("Bastion Subnet", **template.get_zone_style()):
                bastion = BastionHost("Bastion Host")
        
        # Level 3: Spoke Networks
        with Cluster("Corporate Spoke", **template.get_spoke_style('standard')):
            
            # Level 4: Application Tiers
            with Cluster("Web Tier", **template.get_zone_style()):
                app_gateway = ApplicationGateway("Application Gateway")
                web_apps = AppService("Web Apps")
            
            with Cluster("App Tier", **template.get_zone_style()):
                vmss = VMSS("VM Scale Set")
                app_insights = ApplicationInsights("App Insights")
            
            with Cluster("Data Tier", **template.get_zone_style()):
                sql_database = SQLDatabase("SQL Database")
                key_vault = KeyVault("Key Vault")
        
        with Cluster("Online Spoke", **template.get_spoke_style('standard')):
            # Internet-facing workloads
            with Cluster("Public Web Tier", **template.get_zone_style()):
                cdn = CDN("Azure CDN")
                front_door = FrontDoor("Azure Front Door")
```

## Features

### Current Features
- ✅ **4-Level Hierarchy**: Region → Hub/Spoke → Zone → Services
- ✅ **Theme Support**: Light and dark themes
- ✅ **Intelligent Spacing**: Automatic layout rules
- ✅ **Connection Styling**: Different line styles by purpose
- ✅ **Abstracted Imports**: Single import source for all dependencies
- ✅ **Professional Output**: High-quality diagram generation

### Planned Enhancements

#### 🔄 Clean 5-Level Hierarchy
- **Enhanced Management Layer**: Support for Azure Management Groups
- **Subscription Boundaries**: Explicit subscription containers
- **Resource Group Support**: Optional RG-level organization
- **Service Grouping**: Logical service clusters within zones

```python
# Planned hierarchy structure
def create_enhanced_hierarchy():
    # Level 1: Management Group
    with Cluster("Root Management Group"):
        # Level 2: Subscription
        with Cluster("Platform Subscription"):
            # Level 3: Region
            with Cluster("Primary Region"):
                # Level 4: Hub/Spoke
                with Cluster("Hub Network"):
                    # Level 5: Zones/Subnets
                    with Cluster("Gateway Subnet"):
                        # Services
                        pass
```

#### 🔄 Container Icons
Add icons to container headers for visual clarity:

- **Region Icons**: 🌍 Geographic indicators
- **Hub Icons**: 🏢 Central hub symbol
- **Spoke Icons**: 🔗 Connected spoke symbol
- **Zone Icons**: 🛡️ Security zone, 💾 Data zone, ⚙️ App zone
- **Service Icons**: Native Azure service icons

```python
# Planned icon implementation
def get_region_style_with_icon(self, region_type='primary'):
    base_style = self.get_region_style()
    base_style.update({
        'label': f'🌍 {label}',  # Add geographic icon
        'labelloc': 't',         # Top alignment
        'labeljust': 'l'         # Left alignment
    })
    return base_style
```

#### 🔄 Clean Alignment
Enhanced positioning and alignment controls:

- **Container Alignment**: Upper-left icon positioning
- **Label Positioning**: Consistent label placement
- **Grid Alignment**: Snap-to-grid container positioning  
- **Visual Balance**: Improved spacing calculations

```python
# Planned alignment features
ALIGNMENT_RULES = {
    'icon_position': 'upper_left',
    'label_alignment': 'left',
    'container_grid': True,
    'snap_to_grid': 20,  # 20px grid
    'icon_size': (16, 16),
    'icon_margin': 8
}
```

## Examples

### Basic Hub & Spoke
```bash
python examples.py
```

This generates three example diagrams:
- **Basic Template Example**: Simple hub & spoke with all features
- **Advanced Multi-Region**: Complex multi-region architecture
- **Dark Theme Example**: Same architecture with dark theme

### Custom Implementation

```python
from hub_spoke_template import *

template = HubSpokeTemplate(theme='light')

with Diagram("Custom Architecture"):
    with Cluster("Production Region", graph_attr=template.get_region_style()):
        # Your architecture here
        pass
```

## Theme System

### Light Theme
- High contrast dark text on light background
- Subtle border colors
- Professional color palette

### Dark Theme  
- Light text on dark background
- Enhanced border visibility
- Adjusted semantic colors

### Semantic Colors
- 🔴 **Security**: Red tones for security components
- 🔵 **Data**: Blue tones for data flows
- 🟢 **Management**: Green tones for management traffic
- 🟣 **Internet**: Purple tones for external connections

## Connection Types

| Type | Style | Use Case |
|------|-------|----------|
| `hub_spoke` | Solid, thick | Primary hub-to-spoke connections |
| `spoke_spoke` | Solid, medium | Inter-spoke communications |
| `security` | Dashed, red | Security-related flows |
| `data` | Solid, blue | Data replication/flows |
| `management` | Dotted, green | Management traffic |
| `internet` | Solid, purple | External connections |

## Installation

```bash
# Install required dependencies
pip install diagrams

# Run examples
python examples.py
```

## Contributing

1. **Hierarchy Enhancement**: Help implement the 5-level hierarchy
2. **Icon System**: Add container icons and positioning
3. **Alignment Improvements**: Enhance visual alignment and positioning
4. **New Templates**: Create specialized templates (Azure, AWS, GCP)
5. **Documentation**: Improve examples and documentation

## Roadmap

### Phase 1: Enhanced Hierarchy ⏳
- [ ] Implement 5-level container support
- [ ] Add Management Group containers
- [ ] Subscription-level organization
- [ ] Resource Group support

### Phase 2: Visual Enhancements ⏳  
- [ ] Container icon system
- [ ] Upper-left icon positioning
- [ ] Grid-based alignment
- [ ] Enhanced label positioning

### Phase 3: Advanced Features ⏳
- [ ] Multiple diagram composition
- [ ] Export to different formats
- [ ] Interactive diagram features
- [ ] Custom icon libraries

---

*This template abstracts the complexity of diagram creation, allowing you to focus on architecture design rather than GraphViz syntax.*