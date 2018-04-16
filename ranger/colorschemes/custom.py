# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import green, red, blue, normal, bold, reverse, default, black


class Scheme(Default):
    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.directory:
            attr ^= bold

        elif context.in_titlebar:
            attr ^= bold
            if context.tab and context.good:
                attr |= bold
                bg = blue
                fg = black

        if not context.selected and (context.cut or context.copied):
            fg = red

        return fg, bg, attr
