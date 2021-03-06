#!/usr/bin/tclsh

proc get_monitors {} {
  return [exec xrandr -q | grep " connected" | cut -d " " -f1]
}

set monitors [get_monitors]
set external [list]
set internal [list]

foreach m $monitors {
  switch -regexp $m {
    eDP* {
      lappend internal $m
    }
    HDMI* -
    DP* -
    default {
      lappend external $m
    }
  }
}

if {[llength $internal] > 0} {
  set default_monitor [lindex $internal 0]
} else {
  set default_monitor [lindex $external 0]
}

set monitor0 $default_monitor

foreach m {1 2} {
  set i [expr {$m - 1}]

  if {[llength $external] > $i} {
    set monitor$m [lindex $external $i]
  } else {
    set monitor$m $default_monitor
  }
}

set fp [open /tmp/monitors w]

puts $fp "*monitor0: $monitor0"
puts $fp "*monitor1: $monitor1"
puts $fp "*monitor2: $monitor2"

close $fp
