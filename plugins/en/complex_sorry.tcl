## bMotion plugin: sorry
#
# $Id$
#

###############################################################################
# This is a bMotion plugin
# Copyright (C) James Michael Seward 2000-2002
#
# This program is covered by the GPL, please refer the to LICENCE file in the
# distribution; further information can be found in the headers of the scripts
# in the modules directory.
###############################################################################

bMotion_plugin_add_complex "sorry1" "(i'm)?( )?(very)?( )?sorry(,)? %botnicks" 100 bMotion_plugin_complex_sorry "en"
bMotion_plugin_add_complex "sorry2" "%botnicks:? sorry" 100 bMotion_plugin_complex_sorry "en"

proc bMotion_plugin_complex_sorry { nick host handle channel text } {
  global bMotionCache
  #user needs to have been evil recently
  if {![regexp -nocase $nick $bMotionCache(lastEvil)]} {return 0}
  set bMotionCache(lastEvil) ""
  #bMotion_putloglev d * "bMotion: Apologised to by $nick on $channel"
  bMotionDoAction $channel [bMotionGetRealName $nick $host] "%VAR{sorryok} %%"
  bMotionGetHappy
  bMotionGetUnLonely
  driftFriendship $nick 3
  return 1
}