## bMotion plugins loader: admin
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

set languages [split $bMotionSettings(languages) ","]
foreach language $languages {
  bMotion_putloglev 2 * "bMotion: loading admin plugins language = $language"
  set files [glob -nocomplain "$bMotionPlugins/$language/admin_*.tcl"]
  foreach f $files {
    bMotion_putloglev 1 * "bMotion: loading ($language) admin plugin file $f"
    catch {
      source $f
    }
  }
}

# load default admin stuff regardless
set files [glob -nocomplain "$bMotionPlugins/admin_*.tcl"]
foreach f $files {
  bMotion_putloglev 1 * "bMotion: loading (generic) admin plugin file $f"
  catch {
    source $f
  }
}