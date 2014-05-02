#
# motd module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Haerry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# include motd::puppetmaster on the 
# master before you to any motd::client
# calls. 
# content and generate functions
# are evaluated on the master!
# you can pass additional messages by
# setting $motd_message to some string
