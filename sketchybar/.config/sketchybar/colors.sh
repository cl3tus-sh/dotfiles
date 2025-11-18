#!/bin/bash

# Base colors inspired by Waybar config
export WHITE=0xffffffff
export FOREGROUND=0xfffdd3cf        # textActive: #fdd3cf
export FOREGROUND_DIM=0x99ebaaa4    # text with more opacity for visibility
export BACKGROUND=0x55c69a8f        # bg: more opaque for better visibility
export BACKGROUND_ACTIVE=0x99c69a8f # bgActive: much more opaque for active state
export BACKGROUND_DARKER=0x33c69a8f # Slightly darker for contrast

# Bar and item colors
export BAR_COLOR=0x00000000         # Transparent like Waybar
export ITEM_BG_COLOR=$BACKGROUND
export ITEM_BG_ACTIVE=$BACKGROUND_ACTIVE
export ACCENT_COLOR=$FOREGROUND

# Workspace colors
export WORKSPACE_BG=$BACKGROUND
export WORKSPACE_BG_ACTIVE=0xff0000ff    # BLUE for testing - should be very visible!
export WORKSPACE_ICON_COLOR=$FOREGROUND_DIM
export WORKSPACE_ICON_ACTIVE=$FOREGROUND

# Border and shadow
export BORDER_COLOR=0x44c69a8f      # Subtle border
export SHADOW_COLOR=0xA0000000
