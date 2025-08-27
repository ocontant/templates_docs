#!/usr/bin/env python3
"""
Hub & Spoke Architecture Template Examples
Examples demonstrating the various features of the HubSpokeTemplate class.
"""

import os

# Import all diagram components and template from hub_spoke_template
from hub_spoke_template import (
    HubSpokeTemplate,
    Diagram, Cluster, Edge,
    VirtualNetworks, ApplicationGateway, LoadBalancers,
    VirtualMachines, KeyVaults, SQLDatabases,
    Firewall, Router, Internet,
    OUTPUT_DIR
)

# OUTPUT_DIR is imported from hub_spoke_template

def create_example_hub_spoke_diagram():
    """Create an example diagram demonstrating template features."""
    
    # Initialize template
    template = HubSpokeTemplate(theme='light')
    
    with Diagram(
        "Hub & Spoke Architecture Template - Example",
        show=False,
        direction="TB",
        filename=os.path.join(OUTPUT_DIR, "hub_spoke_template_example")
    ):
        
        # Production Region with proper spacing
        with Cluster("Production Region", graph_attr=template.get_region_style()):
            
            # Hub with enhanced styling
            with Cluster("Hub Network", graph_attr=template.get_hub_style()):
                hub_fw = Firewall("Hub Firewall")
                hub_router = Router("Hub Router")
            
            # Spokes with different types and proper spacing
            with Cluster("Frontend Spoke", graph_attr=template.get_spoke_style('standard')):
                # Security zone within spoke
                with Cluster("DMZ Zone", graph_attr=template.get_zone_style()):
                    frontend = ApplicationGateway("Frontend Gateway")
                    load_balancer = LoadBalancers("Load Balancer")
            
            with Cluster("Backend Spoke", graph_attr=template.get_spoke_style('standard')):
                with Cluster("App Zone", graph_attr=template.get_zone_style()):
                    backend = VirtualMachines("Backend VMs")
            
            with Cluster("Data Spoke", graph_attr=template.get_spoke_style('data')):
                with Cluster("Database Zone", graph_attr=template.get_zone_style()):
                    database = SQLDatabases("Database")
            
            with Cluster("Security Spoke", graph_attr=template.get_spoke_style('security')):
                with Cluster("Security Zone", graph_attr=template.get_zone_style()):
                    keyvault = KeyVaults("Key Vault")
        
        # External connections
        internet = Internet("Internet")
        
        # Create optimized connections with different styles
        hub_spoke_style = template.create_connection('hub_spoke')
        security_style = template.create_connection('security') 
        data_style = template.create_connection('data')
        
        # Primary connections (hub-spoke)
        internet >> Edge(label="Internet Traffic", **hub_spoke_style) >> hub_fw
        hub_fw >> hub_router
        
        # Hub to spoke connections
        hub_router >> Edge(**hub_spoke_style) >> frontend
        hub_router >> Edge(**hub_spoke_style) >> backend
        hub_router >> Edge(**data_style) >> database
        hub_router >> Edge(**security_style) >> keyvault
        
        # Inter-spoke connections
        frontend >> Edge(**template.create_connection('spoke_spoke')) >> load_balancer
        load_balancer >> Edge(**template.create_connection('spoke_spoke')) >> backend
        backend >> Edge(**data_style) >> database
        
        # Security connections
        backend >> Edge(**security_style) >> keyvault
        database >> Edge(**security_style) >> keyvault

def create_advanced_multi_region_diagram():
    """Create an advanced multi-region diagram showcasing all template features."""
    
    template = HubSpokeTemplate(theme='light')
    
    with Diagram(
        "Advanced Multi-Region Hub & Spoke Architecture",
        show=False,
        direction="TB",
        filename=os.path.join(OUTPUT_DIR, "advanced_hub_spoke_template"),
        graph_attr={
            "ranksep": "3.0",    # Increase vertical space between regions
            "nodesep": "2.0",    # Increase horizontal space between elements
            "pad": "1.0",        # Overall diagram padding
        }
    ):
        
        # Primary Production Region
        with Cluster("Primary Region - East US", graph_attr=template.get_region_style()):
            
            # Primary Hub
            with Cluster("Primary Hub", graph_attr=template.get_hub_style()):
                primary_hub_fw = Firewall("Primary Firewall")
                primary_hub_router = Router("Primary Router")
            
            # Production Spokes
            with Cluster("Web Tier Spoke", graph_attr=template.get_spoke_style('standard')):
                with Cluster("DMZ", graph_attr=template.get_zone_style()):
                    web_gateway = ApplicationGateway("Web Gateway")
                with Cluster("Web Zone", graph_attr=template.get_zone_style()):
                    web_lb = LoadBalancers("Web LB")
            
            with Cluster("App Tier Spoke", graph_attr=template.get_spoke_style('standard')):
                with Cluster("App Zone", graph_attr=template.get_zone_style()):
                    app_servers = VirtualMachines("App Servers")
            
            with Cluster("Data Tier Spoke", graph_attr=template.get_spoke_style('data')):
                with Cluster("Database Zone", graph_attr=template.get_zone_style()):
                    primary_db = SQLDatabases("Primary DB")
            
            with Cluster("Shared Services Spoke", graph_attr=template.get_spoke_style('management')):
                with Cluster("Management Zone", graph_attr=template.get_zone_style()):
                    shared_services = KeyVaults("Shared Services")
        
        # Disaster Recovery Region with proper spacing
        with Cluster("DR Region - West US", graph_attr=template.get_region_style()):
            
            # DR Hub
            with Cluster("DR Hub", graph_attr=template.get_hub_style()):
                dr_hub_fw = Firewall("DR Firewall")
                dr_hub_router = Router("DR Router")
            
            # DR Spokes
            with Cluster("DR Data Spoke", graph_attr=template.get_spoke_style('data')):
                with Cluster("DR Database Zone", graph_attr=template.get_zone_style()):
                    dr_db = SQLDatabases("DR Database")
            
            with Cluster("DR Management Spoke", graph_attr=template.get_spoke_style('management')):
                with Cluster("DR Management Zone", graph_attr=template.get_zone_style()):
                    dr_mgmt = VirtualMachines("DR Management")
        
        # External
        internet = Internet("Internet")
        
        # Create connection styles
        primary_conn = template.create_connection('hub_spoke')
        data_conn = template.create_connection('data')
        mgmt_conn = template.create_connection('management')
        dr_conn = template.create_connection('hub_spoke', {'style': 'dashed', 'color': '#666'})
        
        # Internet to primary region
        internet >> Edge(label="Primary Traffic", **primary_conn) >> primary_hub_fw
        
        # Primary region internal connections
        primary_hub_fw >> primary_hub_router
        primary_hub_router >> Edge(**primary_conn) >> web_gateway
        primary_hub_router >> Edge(**primary_conn) >> app_servers  
        primary_hub_router >> Edge(**data_conn) >> primary_db
        primary_hub_router >> Edge(**mgmt_conn) >> shared_services
        
        # Application tier connections
        web_gateway >> web_lb >> Edge(**template.create_connection('spoke_spoke')) >> app_servers
        app_servers >> Edge(**data_conn) >> primary_db
        
        # DR region connections
        dr_hub_fw >> dr_hub_router
        dr_hub_router >> Edge(**data_conn) >> dr_db
        dr_hub_router >> Edge(**mgmt_conn) >> dr_mgmt
        
        # Cross-region replication and management
        primary_db >> Edge(
            xlabel="Data Replication",
            **dr_conn
        ) >> dr_db
        shared_services >> Edge(
            headlabel="Management",
            decorate="true",
            labelangle="0",
            labeldistance="15.5,4",
            **mgmt_conn
        ) >> dr_mgmt
        primary_hub_router >> Edge(
            label="Hub-to-Hub", 
            labeldistance="0.1",
            labelangle="0", 
            labelfloat="false",
            decorate="true",
            **dr_conn
        ) >> dr_hub_router

def create_dark_theme_diagram():
    """Create a diagram using the dark theme."""
    
    template = HubSpokeTemplate(theme='dark')
    
    with Diagram(
        "Dark Theme Hub & Spoke Architecture",
        show=False,
        direction="TB",
        filename=os.path.join(OUTPUT_DIR, "dark_theme_hub_spoke")
    ):
        
        with Cluster("Cloud Region", graph_attr=template.get_region_style()):
            
            # Hub
            with Cluster("Central Hub", graph_attr=template.get_hub_style()):
                hub_fw = Firewall("Hub Firewall")
            
            # Security-focused spokes with zones
            with Cluster("Security Spoke", graph_attr=template.get_spoke_style('security')):
                with Cluster("Security Zone", graph_attr=template.get_zone_style()):
                    security_svc = KeyVaults("Security Services")
            
            with Cluster("Data Spoke", graph_attr=template.get_spoke_style('data')):
                with Cluster("Secure Data Zone", graph_attr=template.get_zone_style()):
                    secure_db = SQLDatabases("Secure Database")
            
            with Cluster("Management Spoke", graph_attr=template.get_spoke_style('management')):
                with Cluster("Admin Zone", graph_attr=template.get_zone_style()):
                    admin_vm = VirtualMachines("Admin VM")
        
        # External
        internet = Internet("Internet")
        
        # Dark theme connections
        security_style = template.create_connection('security')
        data_style = template.create_connection('data')
        mgmt_style = template.create_connection('management')
        
        # Connections
        internet >> Edge(**template.create_connection('internet')) >> hub_fw
        hub_fw >> Edge(**security_style) >> security_svc
        hub_fw >> Edge(**data_style) >> secure_db
        hub_fw >> Edge(**mgmt_style) >> admin_vm
        
        # Cross-spoke secure connections
        admin_vm >> Edge(**security_style) >> security_svc
        secure_db >> Edge(**security_style) >> security_svc

if __name__ == "__main__":
    print("Creating Hub & Spoke Architecture Templates...")
    
    examples = [
        ("Basic Template Example", create_example_hub_spoke_diagram),
        ("Advanced Multi-Region", create_advanced_multi_region_diagram), 
        ("Dark Theme Example", create_dark_theme_diagram)
    ]
    
    for name, func in examples:
        try:
            print(f"Creating {name}...")
            func()
            print(f"✓ {name} created successfully!")
            
        except Exception as e:
            print(f"✗ Error creating {name}: {e}")
    
    print(f"\nAll diagrams saved to: {OUTPUT_DIR}/")
    print("Available files:")
    print("- hub_spoke_template_example.png (Basic example)")
    print("- advanced_hub_spoke_template.png (Multi-region)")  
    print("- dark_theme_hub_spoke.png (Dark theme)")
    print("\nMake sure diagrams library is installed: pip install diagrams")