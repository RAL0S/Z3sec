# Z3sec

Z3sec packaged for RALOS

## Overview

**Z3sec** is an open-source penetration testing framework focused on ZigBee security research. This package includes several command-line tools designed to assess the security of ZigBee-certified devices implementing the ZigBee Light Link (ZLL) and ZigBee 3.0 standards.

### Supported Commands

This package adds the following commands:

- `z3sec_control`: Tracks all ZigBee devices and networks on a specified channel, enabling interaction with devices within the network.
- `z3sec_install_code`: Installs the necessary configuration and code for Z3sec functionality.
- `z3sec_key_extract`: Extracts and decrypts network keys during a legitimate touchlink commissioning procedure.
- `z3sec_show`: Displays information related to connected devices and configurations.
- `z3sec_touchlink`: Manages various touchlink commands to interact with touchlink-enabled ZigBee devices within range.
