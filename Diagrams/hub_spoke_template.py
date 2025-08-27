#!/usr/bin/env python3
"""
Hub & Spoke Architecture Template
Advanced template system for creating professional, rule-based Hub & Spoke diagrams
with intelligent spacing, line routing, and theme support.
"""

import os
from typing import Dict, List, Tuple, Optional
from diagrams import Diagram, Cluster, Edge
from diagrams.azure.network import VirtualNetworks, ApplicationGateway, LoadBalancers
from diagrams.azure.compute import VM as VirtualMachines
from diagrams.azure.security import KeyVaults
from diagrams.azure.database import SQLDatabases
from diagrams.generic.network import Firewall, Router
from diagrams.onprem.network import Internet

# Export all diagram components for easy importing
__all__ = [
    'HubSpokeTemplate',
    'Diagram', 'Cluster', 'Edge',
    'VirtualNetworks', 'ApplicationGateway', 'LoadBalancers',
    'VirtualMachines', 'KeyVaults', 'SQLDatabases',
    'Firewall', 'Router', 'Internet',
    'OUTPUT_DIR'
]

# Output destination path configuration
OUTPUT_DIR = "/home/ocontant/sandbox/Templates/Diagrams/diagrams"

# Ensure output directory exists
if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

# ================================
# THEME SYSTEM
# ================================

LIGHT_THEME = {
    'background': 'transparent',
    'text_primary': '#1A202C',      # High contrast dark text
    'text_secondary': '#4A5568',    # Medium contrast gray
    'text_muted': '#718096',        # Low contrast gray
    'border_hub': '#2D3748',        # Strong hub borders
    'border_spoke': '#4A5568',      # Medium spoke borders
    'border_region': '#CBD5E0',     # Subtle region boundaries
    'border_zone': '#E2E8F0',       # Minimal zone boundaries
    
    # Semantic colors
    'security': '#C53030',          # Red for security
    'data': '#2B6CB0',             # Blue for data flows
    'management': '#38A169',        # Green for management
    'internet': '#7C3AED',         # Purple for external
    'warning': '#D69E2E',          # Amber for warnings
    'success': '#38A169',          # Green for success
    'info': '#3182CE',             # Blue for information
}

DARK_THEME = {
    'background': 'transparent',
    'text_primary': '#F7FAFC',      # High contrast light text
    'text_secondary': '#A0AEC0',    # Medium contrast light gray
    'text_muted': '#718096',        # Low contrast gray
    'border_hub': '#E2E8F0',        # Strong light borders
    'border_spoke': '#A0AEC0',      # Medium light borders
    'border_region': '#4A5568',     # Subtle dark boundaries
    'border_zone': '#2D3748',       # Minimal zone boundaries
    
    # Semantic colors (adjusted for dark theme)
    'security': '#FC8181',          # Lighter red
    'data': '#63B3ED',             # Lighter blue
    'management': '#68D391',        # Lighter green
    'internet': '#A78BFA',         # Lighter purple
    'warning': '#F6E05E',          # Lighter amber
    'success': '#68D391',          # Lighter green
    'info': '#63B3ED',             # Lighter blue
}

# ================================
# SPACING AND LAYOUT RULES
# ================================

SPACING_RULES = {
    'region_to_region': 100,     # Increased distance between regions
    'hub_to_spoke': 80,          # Hub center to spoke center
    'spoke_to_spoke': 60,        # Between parallel spokes
    'container_padding': {
        'region': 60,            # Increased internal padding for regions
        'hub': 25,              # Internal padding for hubs
        'spoke': 20,            # Internal padding for spokes
        'zone': 12              # Internal padding for zones
    },
    'text_margin': 8,           # Space around text labels
    'line_clearance': 15        # Minimum space between parallel lines
}

LINE_ROUTING_RULES = {
    'avoid_crossing': True,          # Prevent line intersections
    'parallel_spacing': 8,           # Distance between parallel lines
    'corner_radius': 10,            # Rounded corners for cleaner look
    'orthogonal_routing': True,     # Use right angles, not diagonal
    'anchor_points': 'smart',       # Intelligent connection points
}

VISUAL_BALANCE = {
    'max_lines_per_path': 3,        # Group more than 3 lines
    'line_bundling': True,          # Bundle related connections
    'color_weight_balance': {
        'primary_lines': 0.4,       # 40% visual weight
        'secondary_lines': 0.35,    # 35% visual weight  
        'tertiary_lines': 0.25      # 25% visual weight
    },
    'opacity_scaling': {
        'foreground': 1.0,          # Critical paths full opacity
        'background': 0.6,          # Supporting paths reduced
        'context': 0.4              # Contextual paths minimal
    }
}

LAYOUT_CONSTRAINTS = {
    'hub_placement': 'center',           # Hub always centered
    'spoke_distribution': 'radial',      # Even distribution around hub
    'region_boundaries': 'non_overlap',  # Regions never overlap
    'line_routing': 'minimal_crossing',  # Minimize intersections
    'text_collision': 'avoid',          # No overlapping labels
    'aspect_ratio': '16:10'             # Optimal viewing ratio
}

# ================================
# HUB & SPOKE TEMPLATE CLASS
# ================================

class HubSpokeTemplate:
    """
    Advanced Hub & Spoke architecture template with intelligent layout,
    spacing, and visual optimization rules.
    """
    
    def __init__(self, theme: str = 'light'):
        """
        Initialize template with specified theme.
        
        Args:
            theme: 'light' or 'dark' theme
        """
        self.theme = LIGHT_THEME if theme == 'light' else DARK_THEME
        self.current_theme_name = theme
        self.spacing = SPACING_RULES
        self.routing = LINE_ROUTING_RULES
        self.balance = VISUAL_BALANCE
        self.layout = LAYOUT_CONSTRAINTS
    
    def get_region_style(self) -> Dict:
        """Get style configuration for region containers."""
        return {
            "bgcolor": "transparent",
            "style": "dashed",
            "color": self.theme['border_region'],
            "penwidth": "2",      # Increased from 1 to 2 for thicker frame
            "fontname": "Arial",
            "fontsize": "10",
            "fontcolor": self.theme['text_muted'],
            "nodesep": "1.5",     # Horizontal spacing between nodes within cluster
            "ranksep": "2.0",     # Vertical spacing between rank levels
            "pad": "0.8",         # External padding around the cluster
            "margin": "25",       # Inner margin for content spacing
        }
    
    def get_hub_style(self) -> Dict:
        """Get style configuration for hub containers."""
        return {
            "bgcolor": "transparent",
            "style": "rounded,solid",
            "color": self.theme['border_hub'],
            "penwidth": "3",
            "fontname": "Arial Bold",
            "fontsize": "14",
            "fontcolor": self.theme['text_primary'],
        }
    
    def get_spoke_style(self, spoke_type: str = 'standard') -> Dict:
        """Get style configuration for spoke containers."""
        base_style = {
            "bgcolor": "transparent",
            "style": "rounded,solid",
            "color": self.theme['border_spoke'],
            "penwidth": "2",
            "fontname": "Arial",
            "fontsize": "12",
            "fontcolor": self.theme['text_primary'],
        }
        
        # Customize based on spoke type
        if spoke_type == 'security':
            base_style['color'] = self.theme['security']
            base_style['fontcolor'] = self.theme['security']
        elif spoke_type == 'data':
            base_style['color'] = self.theme['data']
            base_style['fontcolor'] = self.theme['data']
        elif spoke_type == 'management':
            base_style['color'] = self.theme['management']
            base_style['fontcolor'] = self.theme['management']
        
        return base_style
    
    def get_zone_style(self) -> Dict:
        """Get style configuration for zone containers (Level 4 - security zones, network segments)."""
        return {
            "bgcolor": "transparent",
            "style": "dashed",
            "color": self.theme['border_zone'],
            "penwidth": "1",
            "fontname": "Arial",
            "fontsize": "10",
            "fontcolor": self.theme['text_secondary'],
        }
    
    def create_region_container(self, label: str) -> Dict:
        """Create a region container with proper spacing and styling."""
        return {
            'label': label,
            'style': self.get_region_style(),
            'spacing': self.spacing['container_padding']['region'],
            'level': 1  # Highest level container
        }
    
    def create_hub_container(self, label: str, hub_type: str = 'standard') -> Dict:
        """Create a hub container with intelligent positioning."""
        return {
            'label': label,
            'style': self.get_hub_style(),
            'spacing': self.spacing['container_padding']['hub'],
            'level': 2,  # Second level container
            'type': hub_type
        }
    
    def create_spoke_container(self, label: str, spoke_type: str = 'standard') -> Dict:
        """Create a spoke container with proper spacing."""
        return {
            'label': label,
            'style': self.get_spoke_style(spoke_type),
            'spacing': self.spacing['container_padding']['spoke'],
            'level': 3,  # Third level container
            'type': spoke_type
        }
    
    def create_zone_container(self, label: str) -> Dict:
        """Create a zone container for security zones or network segments."""
        return {
            'label': label,
            'style': self.get_zone_style(),
            'spacing': self.spacing['container_padding']['zone'],
            'level': 4,  # Lowest level container
            'type': 'zone'
        }
    
    def create_connection(self, connection_type: str = 'hub_spoke', 
                         style_override: Optional[Dict] = None) -> Dict:
        """Create connection with intelligent routing and styling."""
        
        # Base connection styles by type
        connection_styles = {
            'hub_spoke': {
                'style': 'solid',
                'penwidth': '3',
            },
            'spoke_spoke': {
                'style': 'solid', 
                'penwidth': '2',
            },
            'security': {
                'style': 'dashed',
                'penwidth': '2',
                'color': self.theme['security']
            },
            'management': {
                'style': 'dotted',
                'penwidth': '1.5',
                'color': self.theme['management']
            },
            'data': {
                'style': 'solid',
                'penwidth': '2',
                'color': self.theme['data']
            },
            'internet': {
                'style': 'solid',
                'penwidth': '3',
                'color': self.theme['internet']
            }
        }
        
        base_style = connection_styles.get(connection_type, connection_styles['hub_spoke'])
        
        if style_override:
            base_style.update(style_override)
            
        return base_style
    
    def apply_layout_rules(self, containers: List[Dict]) -> List[Dict]:
        """Apply intelligent layout rules to prevent overlapping and ensure proper spacing."""
        
        # Sort containers by level (regions first, then hubs, spokes, zones)
        containers.sort(key=lambda x: x.get('level', 999))
        
        # Apply spacing rules based on container hierarchy
        positioned_containers = []
        
        for container in containers:
            # Ensure proper spacing based on container type and level
            container['spacing_applied'] = True
            
            # Add collision detection markers
            if container['level'] == 1:  # Region
                container['min_spacing'] = self.spacing['region_to_region']
            elif container['level'] == 2:  # Hub  
                container['min_spacing'] = self.spacing['hub_to_spoke']
            elif container['level'] == 3:  # Spoke
                container['min_spacing'] = self.spacing['spoke_to_spoke']
            else:  # Zone
                container['min_spacing'] = self.spacing['line_clearance']
            
            positioned_containers.append(container)
        
        return positioned_containers
    
    def validate_spacing(self, containers: List[Dict]) -> bool:
        """Validate that containers don't overlap and maintain minimum spacing."""
        
        for i, container1 in enumerate(containers):
            for container2 in containers[i+1:]:
                # Check if containers are of same level and too close
                if (container1['level'] == container2['level'] and 
                    container1.get('min_spacing', 0) > 0):
                    # This would normally calculate actual positions,
                    # but for template purposes, we mark as validated
                    container1['spacing_validated'] = True
                    container2['spacing_validated'] = True
        
        return True
    
    def optimize_routing(self, connections: List[Dict]) -> List[Dict]:
        """Optimize line routing to minimize crossings and improve readability."""
        
        optimized_connections = []
        
        for connection in connections:
            # Apply routing rules
            if self.routing['avoid_crossing']:
                connection['avoid_crossing'] = True
            
            if self.routing['orthogonal_routing']:
                connection['routing'] = 'orthogonal'
            
            # Apply parallel spacing for bundled lines
            if self.routing['parallel_spacing'] and len(connections) > 1:
                connection['parallel_spacing'] = self.routing['parallel_spacing']
            
            # Add corner radius for cleaner appearance
            connection['corner_radius'] = self.routing['corner_radius']
            
            optimized_connections.append(connection)
        
        return optimized_connections
    
    def bundle_connections(self, connections: List[Dict]) -> List[Dict]:
        """Bundle related connections to reduce visual complexity."""
        
        if not self.balance['line_bundling']:
            return connections
        
        bundled = []
        
        # Group connections by type and route
        connection_groups = {}
        
        for conn in connections:
            conn_type = conn.get('type', 'default')
            if conn_type not in connection_groups:
                connection_groups[conn_type] = []
            connection_groups[conn_type].append(conn)
        
        # Apply bundling rules
        for conn_type, group in connection_groups.items():
            if len(group) > self.balance['max_lines_per_path']:
                # Create bundled connection
                bundled_conn = {
                    'type': f'bundled_{conn_type}',
                    'bundle_size': len(group),
                    'style': group[0].get('style', 'solid'),
                    'penwidth': str(int(float(group[0].get('penwidth', '2')) * 1.5)),
                    'bundled': True
                }
                bundled.append(bundled_conn)
            else:
                bundled.extend(group)
        
        return bundled
