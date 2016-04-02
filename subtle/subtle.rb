# -*- encoding: utf-8 -*-
#
# Author::  Christoph Kappel <unexist@subforge.org>
# Version:: $Id$
# License:: GNU GPLv2
#
# = Subtle default configuration
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.
#

#
# == Options
#
# Following options change behaviour and sizes of the window manager:
#

# Window move/resize steps in pixel per keypress
set :increase_step, 5

# Window screen border snapping
set :border_snap, 10

# Default starting gravity for windows. Comment out to use gravity of
# currently active client
set :default_gravity, :center

# Make dialog windows urgent and draw focus
set :urgent_dialogs, false

# Honor resize size hints globally
set :honor_size_hints, false

# Enable gravity tiling for all gravities
set :gravity_tiling, false

# Enable click-to-focus focus model
set :click_to_focus, false

# Skip pointer movement on e.g. gravity change
set :skip_pointer_warp, false

# Skip pointer movement to urgent windows
set :skip_urgent_warp, false

# Set the WM_NAME of subtle (Java quirk)
# set :wmname, "LG3D"

#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and
# sublets screen wise. The default config uses top panel on the first screen
# only, it's up to the user to enable the bottom panel or disable either one
# or both.

# === Properties
#
# [*stipple*]    This property adds a stipple pattern to both screen panels.
#
#                Example: stipple "~/stipple.xbm"
#                         stipple Subtlext::Icon.new("~/stipple.xbm")
#
# [*top*]        This property adds a top panel to the screen.
#
#                Example: top [ :views, :title ]
#
# [*bottom*]     This property adds a bottom panel to the screen.
#
#                Example: bottom [ :views, :title ]

#
# Following items are available for the panels:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used only once)
# [*:keychain*]  Display current chain (Can be used only once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# Empty panels are hidden.
#
# === Links
#
# http://subforge.org/projects/subtle/wiki/Multihead
# http://subforge.org/projects/subtle/wiki/Panel
#

screen 1 do
  top    [ :views, :separator, :title, :spacer, :notify, :mpd, :battery, :clock2 ]
  bottom [ ]
end

# Addons {{{

begin
    require "#{ENV["HOME"]}/.local/share/subtle/addons/selector.rb"
    Subtle::Contrib::Selector.font = "xft:Ohsnap:size=14"
rescue LoadError => error
    puts error
end

begin
    require "#{ENV["HOME"]}/.local/share/subtle/addons/positioner.rb"
    Subtle::Contrib::Positioner.font = "xft:Ohsnap:size=14"
rescue LoadError => error
    puts error
end

# Example for a second screen:
#screen 2 do
#  top    [ :views, :title, :spacer ]
#  bottom [ ]
#end

#
# == Styles
#
# Styles define various properties of styleable items in a CSS-like syntax.
#
# If no background color is given no color will be set. This will ensure a
# custom background pixmap won't be overwritten.
#
# Following properties are available for most the styles:
#
# [*foreground*] Foreground text color
# [*background*] Background color
# [*margin*]     Outer spacing
# [*border*]     Border color and size
# [*padding*]    Inner spacing
# [*font*]       Font string (xftontsel or xft)
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Styles

# Colors
background_1 =  "#151515"
background_2 =  "#353535"

color_above =   "#ebebeb"
color_light =   "#C3143B"
color_medium =  "#545454"
color_dark =    "#303030"

# Style for all style elements
style :all do
  padding     2, 2, 2, 2
  margin      0, 0, 0, 0
  icon        color_light
  font        "xft:Ohsnap:size=14"
end

# Style for the all views
style :views do
  padding      1, 5, 2, 5
  margin       0, 0, 0, 0
  foreground   color_medium
  background   background_1
  icon         color_dark
  font         "xft:Ohsnap:pixelsize=12"

  # Style for the active views
  style :focus do
    padding       1, 5, 2, 5
    margin        0, 0, 0, 0
    foreground    color_above
    background    color_light
    icon          color_light
    font          "xft:Ohsnap:size=12"
  end

  # Style for urgent window titles and views
  style :urgent do
    padding       1, 5, 2, 5
    margin        0, 0, 0, 0
    foreground    color_above
    background    background_1
    icon          color_above
    font          "xft:Ohsnap:size=14"
  end

  # Style for occupied views (views with clients)
  style :occupied do
    padding       1, 5, 2, 5
    margin        0, 0, 0, 0
    fireground    color_above
    background    background_1
    icon          color_medium
    font          "xft:Ohsnap:size=12"
  end
end

# Style for sublets
style :sublets do
  padding      1, 4, 2, 4
  margin       0, 0, 0, 0
  foreground   color_medium
  background   background_1
  icon         color_light
  font         "xft:Ohsnap:size=14"
end

# Style for separator
style :separator do
  padding      1, 2, 2, 2
  margin       0, 0, 0, 0
  foreground   color_light
  background   background_1
  separator    "||"
  font         "xft:Ohsnap:size=14"
end

# Style for focus window title
style :title do
  padding     1, 4, 2, 4
  margin      0, 0, 0, 0
  foreground  color_above
  background  background_1
  font        "xft:Ohsnap:size=14"
end

# Style for active/inactive windows
style :clients do
  padding   0, 0, 0, 0
  margin    4, 4, 4, 4
  active    color_above, 1
  inactive  background_2, 1
  width     75
end

# Style for subtle
style :subtle do
  padding       0, 0, 0, 0
  margin        0, 0, 0, 0
  panel_top     background_1
  panel_bottom  background_1
end

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Gravity
#

# Top left
gravity :tl_a1,     [   0,   0,  33,  33 ]
gravity :tl_a2,     [   0,   0,  50,  33 ]
gravity :tl_a3,     [   0,   0,  67,  33 ]

gravity :tl_b1,     [   0,   0,  33,  50 ]
gravity :tl_b2,     [   0,   0,  50,  50 ]
gravity :tl_b3,     [   0,   0,  67,  50 ]

gravity :tl_c1,     [   0,   0,  33,  67 ]
gravity :tl_c2,     [   0,   0,  50,  67 ]
gravity :tl_c3,     [   0,   0,  67,  67 ]

# Top center
gravity :tc_a1,     [   0,   0, 100,  50 ]
gravity :tc_a2,     [   0,   0, 100,  67 ]
gravity :tc_a3,     [   0,   0, 100,  33 ]

gravity :tc_b1,     [  33,   0,  34,  33 ]
gravity :tc_b2,     [  33,   0,  34,  50 ]
gravity :tc_b3,     [  33,   0,  34,  67 ]

# Top right
gravity :tr_a1,     [  67,   0,  33,  33 ]
gravity :tr_a2,     [  50,   0,  50,  33 ]
gravity :tr_a3,     [  33,   0,  67,  33 ]

gravity :tr_b1,     [  67,   0,  33,  50 ]
gravity :tr_b2,     [  50,   0,  50,  50 ]
gravity :tr_b3,     [  33,   0,  67,  50 ]

gravity :tr_c1,     [  67,   0,  33,  67 ]
gravity :tr_c2,     [  50,   0,  50,  67 ]
gravity :tr_c3,     [  33,   0,  67,  67 ]

# Left
gravity :l_a1,      [   0,  33,  33,  34 ]
gravity :l_a2,      [   0,  33,  50,  34 ]
gravity :l_a3,      [   0,  33,  67,  34 ]

gravity :l_b1,      [   0,   0,  33, 100 ]
gravity :l_b2,      [   0,   0,  50, 100 ]
gravity :l_b3,      [   0,   0,  67, 100 ]

# Center
gravity :ct,        [   0,   0, 100, 100 ]
gravity :ct33,      [  33,  33,  34,  34 ] 
gravity :ct66,      [  25,  25,  50,  50 ], :vert
gravity :ct40,      [  0,  33,  100,  34 ]

# Right
gravity :r_a1,      [  67,  33,  33,  34 ]
gravity :r_a2,      [  50,  33,  50,  34 ]
gravity :r_a3,      [  33,  33,  67,  34 ]

gravity :r_b1,      [  67,   0,  33, 100 ]
gravity :r_b2,      [  50,   0,  50, 100 ]
gravity :r_b3,      [  33,   0,  67, 100 ]

# Bottom left
gravity :bl_a1,     [   0,  67,  33,  33 ]
gravity :bl_a2,     [   0,  67,  50,  33 ]
gravity :bl_a3,     [   0,  67,  67,  33 ]

gravity :bl_b1,     [   0,  50,  33,  50 ]
gravity :bl_b2,     [   0,  50,  50,  50 ]
gravity :bl_b3,     [   0,  50,  67,  50 ]

gravity :bl_c1,     [   0,  33,  33,  67 ]
gravity :bl_c2,     [   0,  33,  50,  67 ]
gravity :bl_c3,     [   0,  33,  67,  67 ]

# Bottom center
gravity :bc_a1,     [   0,  50, 100,  50 ]
gravity :bc_a2,     [   0,  33, 100,  67 ]
gravity :bc_a3,     [   0,  67, 100,  33 ]

gravity :bc_b1,     [  33,  67,  34,  33 ]
gravity :bc_b2,     [  33,  50,  34,  50 ]
gravity :bc_b3,     [  33,  33,  34,  67 ]

# Bottom right
gravity :br_a1,     [  67,  67,  33,  33 ]
gravity :br_a2,     [  50,  67,  50,  33 ]
gravity :br_a3,     [  33,  67,  67,  33 ]

gravity :br_b1,     [  67,  50,  33,  50 ]
gravity :br_b2,     [  50,  50,  50,  50 ]
gravity :br_b3,     [  33,  50,  67,  50 ]

gravity :br_c1,     [  67,  33,  33,  67 ]
gravity :br_c2,     [  50,  33,  50,  67 ]
gravity :br_c3,     [  33,  33,  67,  67 ]

# Special
gravity :sp_br,     [  70,  85,  30,  15 ]
gravity :sp_bl,     [   0,  85,  30,  15 ]
gravity :sp_tr,     [  70,   0,  30,  15 ]
gravity :sp_tl,     [   0,   0,  30,  15 ]

# Gimp
gravity :gimp_i,    [  10,   0,  80, 100 ]
gravity :gimp_t,    [   0,   0,  10, 100 ]
gravity :gimp_d,    [  90,   0,  10, 100 ]

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one or a list of keys
# and can be used in various ways to trigger an action. In subtle, there are
# two ways to define chains for grabs:
#
#   1. *Default*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Chain*: Define a list of grabs that need to be pressed in order
#
#      *Example*: grab "C-y Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*]  = Button1 (Left mouse button)
# [*B2*]  = Button2 (Middle mouse button)
# [*B3*]  = Button3 (Right mouse button)
# [*B4*]  = Button4 (Mouse wheel up)
# [*B5*]  = Button5 (Mouse wheel down)
# [*...*]
# [*B20*] = Button20 (Are you sure that this is a mouse and not a keyboard?)
#
# ==== Modifiers
#
# [*A*] = Alt key (Mod1)
# [*C*] = Control key
# [*M*] = Meta key (Mod3)
# [*S*] = Shift key
# [*W*] = Super/Windows key (Mod4)
# [*G*] = Alt Gr (Mod5)
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#   grab "C-a c",    "urxvt"
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Grabs
#

    # Cycle between given gravities
    grab "W-KP_9",      [ :tr_a1, :tr_a2, :tr_a3, :tr_b1, :tr_b2, :tr_b3, :tr_c1, :tr_c2, :tr_c3 ]
    grab "W-KP_8",      [ :tc_b1, :tc_b2, :tc_b3, :tc_a3, :tc_a1, :tc_a2                         ]
    grab "W-KP_7",      [ :tl_a1, :tl_a2, :tl_a3, :tl_b1, :tl_b2, :tl_b3, :tl_c1, :tl_c2, :tl_c3 ]
     
    grab "W-KP_6",      [ :r_a1,  :r_a2,  :r_a3,  :r_b1,  :r_b2,  :r_b3                          ]
    grab "W-KP_5",      [ :ct33,  :ct66,  :ct,    :ct40                                          ]
    grab "W-KP_4",      [ :l_a1,  :l_a2,  :l_a3,  :l_b1,  :l_b2,  :l_b3                          ]
     
    grab "W-KP_3",      [ :br_a1, :br_a2, :br_a3, :br_b1, :br_b2, :br_b3, :br_c1, :br_c2, :br_c3 ]
    grab "W-KP_2",      [ :bc_b1, :bc_b2, :bc_b3, :bc_a3, :bc_a1, :bc_a2                         ]
    grab "W-KP_1",      [ :bl_a1, :bl_a2, :bl_a3, :bl_b1, :bl_b2, :bl_b3, :bl_c1, :bl_c2, :bl_c3 ]
     
    grab "W-KP_0",      [ :sp_br, :sp_bl, :sp_tr, :sp_tl                                         ]

    # Naviguate through clients 
    grab "A-F9" do  ## Mouse extra button shortcut
        clients = Subtlext::Client.visible
        clients.last.instance_eval do
            focus
            raise
        end
    end
    grab "A-Tab" do
        clients = Subtlext::Client.visible
        clients.last.instance_eval do
            focus
            raise
        end
    end

    # Scratchpad
    grab "W-Tab" do
       if (c = Subtlext::Client.first("scratchpad"))
         c.toggle_stick
         c.focus
         c.raise
         c.toggle_float
       elsif (c = Subtlext::Subtle.spawn("urxvtc_mod -name scratchpad -e tmux attach"))
         c.tags  = []
         c.flags = [ :stick ]
       end
    end

    # Manually initialize scratchpad
    grab "W-A-Tab" do
      c = Subtlext::Subtle.spawn("urxvtc_mod -name scratchpad -e tmux attach")
         c.tags  = []
         c.flags = [ :stick ]
    end

    # Scratchstack
    scratch_stack   = []
    scratch_current = 0
 
        # Add window to stack
         grab "W-colon" do |c|
            unless scratch_stack.include?(c.win)
                scratch_stack << c.win
                c.tags = []
                c.toggle_stick if c.is_stick?
             end
         end
 
        # Remove window from stack
        grab "W-ugrave" do |c|
            if scratch_stack.include?(c.win)
                c.retag
                scratch_stack.delete(c.win)
            end
        end
 
        # Cycle through stacked windows
        grab "W-exclam" do
            if 0 < scratch_current
                cur_idx = scratch_stack.index(scratch_current)
                cur_client = Subtlext::Client[scratch_current]
                cur_client.toggle_stick
                if cur_idx == scratch_stack.size - 1
                    scratch_current = 0
                    return
                end
                idx = cur_idx + 1
            else
                idx = 0
            end 
            cur = Subtlext::Client[scratch_stack[idx]] 
            scratch_current = cur.win
            cur.toggle_stick
            cur.focus
            cur.raise
        end

    # Go to next non-empty view
    grab "W-KP_Add" do
        vArr = Subtlext::View[:all];
        cindx = vArr.index(Subtlext::View.current);
        for i in 1..vArr.size do
            cV = vArr[(i + cindx) % vArr.size];
            if (!cV.clients.empty? && Subtlext::View.visible.index(cV) == nil) then
                cV.jump;
                break;
            end
        end
    end
 
    # Go to previous non-empty view
    grab "W-KP_Subtract" do
        vArr = Subtlext::View[:all].reverse;
        cindx = vArr.index(Subtlext::View.current);
        for i in 1..vArr.size do
            cV = vArr[(i + cindx) % vArr.size];
            if (!cV.clients.empty? && Subtlext::View.visible.index(cV) == nil) then
                cV.jump;
                break;
            end
        end
    end
    
    # Launch Selector
    grab "W-comma" do
        Subtle::Contrib::Selector.run
    end

    # Launch Positionner 
    grab "W-semicolon" do
        Subtle::Contrib::Positioner.run
    end

    # Subtle actions 
    grab "W-C-r",       :SubtleReload
    grab "W-A-r",       :SubtleRestart
    grab "W-C-q",       :SubtleQuit
     
    # View naviguation
    grab "W-1",         :ViewSwitch1
    grab "W-2",         :ViewSwitch2
    grab "W-3",         :ViewSwitch3
    grab "W-4",         :ViewSwitch4
    grab "KP_Add",      :ViewNext
    grab "KP_Subtract", :ViewPrev
     
    # Window actions
    grab "W-B1",        :WindowMove
    grab "W-Up",        :WindowMoveUp
    grab "W-Right",     :WindowMoveRight
    grab "W-Down",      :WindowMoveDown
    grab "W-Left",      :WindowMoveLeft

    grab "W-B3",        :WindowResize
    grab "W-C-Up",      :WindowResizeUp
    grab "W-C-Right",   :WindowResizeRight
    grab "W-C-Down",    :WindowResizeDown
    grab "W-C-Left",    :WindowResizeLeft

    grab "W-h",         :WindowLeft
    grab "W-j",         :WindowDown
    grab "W-k",         :WindowUp
    grab "W-l",         :WindowRight

    grab "W-r",         :WindowRaise
    grab "W-s",         :WindowLower
    grab "W-q",         :WindowKill
    grab "W-S-f",       :WindowFloat
    grab "W-S-d",       :WindowFull
    grab "W-S-s",       :WindowStick
     
    # Shortcuts
    grab "W-Return",             "urxvt"
    grab "W-C-Return",           "urxvt -e tmux"
    grab "W-space",              'dmenu_run -nb "#151515" -nf "#545454" -sb "#C3143B" -sf "#DDE2D8" -p "run:" -i'
    grab "W-S-Tab",              "pkill urxvt"
    grab "W-w",                  "qutebrowser"
    grab "W-c",                  "urxvt -name wcalc -e wcalc"
    grab "W-f",                  "urxvt -name ranger -e ranger"
#    grab "W-t",                  "urxvt -name newsbeuter -e newsbeuter"
    grab "W-n",                  "urxvt -name ncmpcpp -e ncmpcpp"
    grab "W-v",                  "urxvt -name weechat -e weechat"
#    grab "W-b",                  "urxvt -name rtorrent -e rtorrent"
#    grab "W-m",                  "urxvt -name mutt -e mutt"
#    grab "W-g",                  "magnet"
    grab "W-a",                  "urxvt -name htop -e htop"
    grab "W-x",                  "sh /home/digis/.config/i3lock-fancy/lock"
    grab "W-C-w",                "chromium"

#    grab "XF86Tools",            "mpd"
    grab "XF86MonBrightnessUp"   "light -A 10"
    grab "XF86MonBrightnessDown" "light -U 10"
    grab "XF86AudioPlay",        "mpc toggle"
    grab "XF86AudioPrev",        "mpc prev"
    grab "XF86AudioNext",        "mpc next"
    grab "XF86AudioMute",        "amixer set Master toggle"
    grab "XF86AudioLowerVolume", "amixer set Master 5%-"
    grab "XF86AudioRaiseVolume", "amixer set Master 5%+"

    grab "Print",                "scrot -e 'mv $f ~/Pictures/screenshots/'"
    grab "C-Print",              "scrot -d 5 -e 'mv $f ~/Pictures/screenshots/'"
    grab "Menu",                 ""
    grab "Pause",                "urgentkey"
    grab "Scroll_Lock",          ""

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# === Simple
#
# The simple way just needs a name and a regular expression to just handle the
# placement:
#
# Example:
#
#  tag "terms", "terms"
#
# === Extended
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# Example:
#
#  tag "terms" do
#    match   "xterm|[u]?rxvt"
#    gravity :center
#  end
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# [*borderless*] This property enables the borderless mode for tagged clients.
#
#                Example: borderless true
#                Links:    http://subforge.org/projects/subtle/wiki/Tagging#Borderless
#                          http://subforge.org/projects/subtle/wiki/Clients#Borderless
#
# [*fixed*]      This property enables the fixed mode for tagged clients.
#
#                Example: fixed true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fixed
#                         http://subforge.org/projects/subtle/wiki/Clients#Fixed
#
# [*float*]      This property enables the float mode for tagged clients.
#
#                Example: float true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Float
#                         http://subforge.org/projects/subtle/wiki/Clients#Float
#
# [*full*]       This property enables the fullscreen mode for tagged clients.
#
#                Example: full true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fullscreen
#                         http://subforge.org/projects/subtle/wiki/Clients#Fullscreen
#
# [*geometry*]   This property sets a certain geometry as well as floating mode
#                to the tagged client, but only on views that have this tag too.
#                It expects an array with x, y, width and height values whereas
#                width and height must be >0.
#
#                Example: geometry [100, 100, 50, 50]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Geometry
#
# [*gravity*]    This property sets a certain to gravity to the tagged client,
#                but only on views that have this tag too.
#
#                Example: gravity :center
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Gravity
#
# [*match*]      This property adds matching patterns to a tag, a tag can have
#                more than one. Matching works either via plaintext, regex
#                (see man regex(7)) or window id. Per default tags will only
#                match the WM_NAME and the WM_CLASS portion of a client, this
#                can be changed with following possible values:
#
#                [*:name*]      Match the WM_NAME
#                [*:instance*]  Match the first (instance) part from WM_CLASS
#                [*:class*]     Match the second (class) part from WM_CLASS
#                [*:role*]      Match the window role
#                [*:type*]      Match the window type
#
#                Examples: match instance: "urxvt"
#                          match [:role, :class] => "test"
#                          match "[xa]+term"
#                Link:     http://subforge.org/projects/subtle/wiki/Tagging#Match
#
# [*position*]   Similar to the geometry property, this property just sets the
#                x/y coordinates of the tagged client, but only on views that
#                have this tag, too. It expects an array with x and y values.
#
#                Example: position [ 10, 10 ]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Position
#
# [*resize*]     This property enables the float mode for tagged clients. When set,
#                subtle honors size hints, that define various size constraints like
#                sizes for columns and rows of a terminal.
#
#                Example: resize true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Resize
#                         http://subforge.org/projects/subtle/wiki/Clients#Resize
#
# [*stick*]      This property enables the stick mode for tagged clients. When set,
#                clients are visible on all views, even when they don't have matching
#                tags. On multihead, sticky clients keep the screen they are assigned
#                on.
#
#                Supported values are either true or a number to specify a screen.
#
#                Example: stick true
#                         stick 1
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Stick
#
# [*type*]       This property sets the tagged client to be treated as a specific
#                window type though as the window sets the type itself. Following
#                types are possible:
#
#                [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Desktop
#                [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dock
#                [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Toolbar
#                [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Splash
#                [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dialog
#
#                Example: type :desktop
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Type
#
# [*urgent*]     This property enables the urgent mode for tagged clients. When set,
#                subtle automatically sets this client to urgent.
#
#                Example: urgent true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Urgent
#
# [*zaphod*]     This property enables the zaphod mode for tagged clients. When set,
#                the client spans across all connected screens.
#
#                Example: zaphod true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Zaphod
#                         http://subforge.org/projects/subtle/wiki/Clients#Zaphod
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

    # Simple tags
    tag "terminal", "urxvt|urxvtc|xterm|terminator"
    tag "web",      "luakit|dwb|iceweasel|midori|chromium|icedove|hotot|pidgin|qutebrowser"
    tag "media",    "easytag|sonata|comix|inkscape|VLC|gnome-mplayer|libreoffice|zathura|epdfview|audacity" 
    tag "system",  "thunar|gtk2fontsel|lxappearance|geany|nitrogen|virtualbox|file-roller|gparted|feh|display|bleachbit"

    # Placement
    tag "web_full" do
      match "luakit|dwb|icedove|iceweasel|chromium|midori|qutebrowser"
      gravity :ct
    end

    tag "media_full" do
      match "comix|inkscape|libreoffice|zathura|audacity|easytag"
      gravity :ct
    end

    # Apps definition
    tag "calc" do
      match :instance => "wcalc"
      gravity :br_a1
      stick true
      urgent true
    end

    tag "scratchpad" do
      match :instance => "scratchpad|htop"
      gravity :ct33
      stick true
      urgent true
    end

    tag "terms" do
      match "urxvt"
      exclude :instance => "scratchpad|htop|cli_browser|newsbeuter|mutt|wcalc|ranger|weechat|ncmpcpp|rtorrent"
    end

    tag "cli_browser" do
      match :instance => "lynx|elinks|w3m"
      gravity :ct
    end

    tag "torrent" do
      match :instance => "rtorrent"
      gravity :bl_a1
    end

    tag "mails" do
      match :instance => "newsbeuter|mutt" 
     end

    tag "chat" do
      match :instance => "weechat|irssi"
      gravity :ct33
    end

    tag "files" do
      match :instance => "ranger"
    end

    tag "flash" do
      match "<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin"
    end

    # Modes
    tag "stick" do
      match "mplayer|vlc"
      stick true
    end
     
    tag "float" do
      match "mplayer|nitrogen|file-roller|display|feh"
      float true
    end

    tag "fixed" do
      match "display|feh|gimp_*"
      fixed true
    end

    tag "borderless" do
      match "display|evince|epdfview"
      type :desktop
      borderless true
    end

    tag "urgent" do
      match "feh|display|file-roller"
      urgent true
    end

    tag "full" do
      match "epdfview|vlc"
      full true
    end

    tag "resize" do
      match "vlc|mplayer|virtualbox"
      resize true
    end

    tag "music" do
      match :instance => "ncmpcpp"
      gravity :ct33
    end

    # Gimp
    tag "gimp_image" do
      match   :role => "gimp-image-window"
      gravity :gimp_i
    end
     
    tag "gimp_toolbox" do
      match   :role => "gimp-toolbox$"
      gravity :gimp_t
    end
     
    tag "gimp_dock" do
      match   :role => "gimp-dock"
      gravity :gimp_d
    end

    tag "gimp_scum" do
      match   :role => "gimp-.*|screenshot"
    end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# Like tags views can be defined in two ways:
#
# === Simple
#
# The simple way is exactly the same as for tags:
#
# Example:
#
#   view "terms", "terms"
#
# === Extended
#
# The extended way for views is also similar to the tags, but with fewer
# properties.
#
# Example:
#
#  view "terms" do
#    match "terms"
#    icon  "/usr/share/icons/icon.xbm"
#  end
#
# === Properties
#
# [*match*]      This property adds a matching pattern to a view. Matching
#                works either via plaintext or regex (see man regex(7)) and
#                applies to names of tags.
#
#                Example: match "terms"
#
# [*dynamic*]    This property hides unoccupied views, views that display no
#                windows.
#
#                Example: dynamic true
#
# [*icon*]       This property adds an icon in front of the view name. The
#                icon can either be path to an icon or an instance of
#                Subtlext::Icon.
#
#                Example: icon "/usr/share/icons/icon.xbm"
#                         icon Subtlext::Icon.new("/usr/share/icons/icon.xbm")
#
# [*icon_only*]  This property hides the view name from the view buttons, just
#                the icon will be visible.
#
#                Example: icon_only true
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

    view "term" do
      match "terms|gimp_*|default"
    end
     
    view "web" do
      match "web|mail|cli_browser|torrent|flash"
    end
     
    view "media" do
      match "media|music|chat"
    end
     
    view "syst" do
      match "system|files"  
    end

#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# === Example
#
#  sur install clock
#  sur uninstall clock
#  sur list
#
# === Configuration
#
# All sublets have a set of configuration values that can be changed directly
# from the config of subtle.
#
# There are three default properties, that can be be changed for every sublet:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# sur can also give a brief overview about properties:
#
# === Example
#
#   sur config clock
#
# The syntax of the sublet configuration is similar to other configuration
# options in subtle:
#
# === Example
#
#  sublet :clock do
#    interval      30
#    foreground    "#eeeeee"
#    background    "#000000"
#    format_string "%H:%M:%S"
#  end
#
#  === Link
#
# http://subforge.org/projects/subtle/wiki/Sublets
#

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Hooks

sublet :mpd do
  format_string    "%artist% %title%"
  show_icons       false
  show_colors      true
  show_pause       true
  artist_color     color_medium
  title_color      color_light
  pause_color      color_medium
  stop_color       color_medium
  stop_text        "Stop"
  pause_text       "Pause"
  not_running_text "N/A"
end

sublet :battery do
  interval         30
end

sublet :clock2 do
  interval         30
  time_format      "%H:%M | %a %d %b"
  time_color       color_above
  date_format      ""
end

# vim:ts=2:bs=2:sw=2:et:fdm=marker

# Hooks

# Autostart
on :start do
  Subtlext::Subtle.spawn "sh ~/.fehbg"
  Subtlext::Subtle.spawn "mpd"
  Subtlext::Subtle.spawn "sleep 2s && subtler -r"
  Subtlext::Subtle.spawn "numlockx" 
  Subtlext::Subtle.spawn "compton -CGbc -t -8 -l -9 -r 6 -o 0.7 -m 1.0"
  Subtlext::Subtle.spawn "xautolock -time 15 -locker 'sh /home/digis/.config/i3lock-fancy/lock'" 
#  Subtlext::Subtle.spawn "gnome-keyring-daemon --start --components=pkcs11"
end

# Client autofocus
on :client_create do |c|
  c.views.first.jump
  c.focus
  c.raise
end
