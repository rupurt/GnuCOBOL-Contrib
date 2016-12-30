import sys
from PyQt5.QtGui import QColor
from PyQt5.QtWidgets import qApp, QStyle
from pyqode.core.panels import MarkerPanel, Marker


class BreakpointsPanel(MarkerPanel):
    @property
    def breakpoints(self):
        return self._breakpoints

    @breakpoints.setter
    def breakpoints(self, breakpoints):
        for bp in breakpoints:
            self.__add_breakpoint(int(bp) - 1)

    def __init__(self):
        MarkerPanel.__init__(self)
        self._breakpoints = []
        if qApp.palette().base().color().lightness() < 128:
            self.background = QColor("#3A2323")
        self.add_marker_requested.connect(self.__add_breakpoint)
        self.remove_marker_requested.connect(self.__remove_breakpoint)
        self.maxLine = sys.maxsize

    def __update_markers(self):
        for bp in self._breakpoints:
            self.__add_breakpoint(int(bp) - 1)

    def __add_breakpoint(self, line):
        if line > self.maxLine:
            self._breakpoints.append(str(line + 1))
            icon = qApp.style().standardIcon(QStyle.SP_BrowserStop)
            marker = Marker(line, icon, "Breakpoint")
            self.add_marker(marker)

    def __remove_breakpoint(self, line):
        for m in self.marker_for_line(line):
            self.remove_marker(m)
        self._breakpoints.remove(str(line + 1))
