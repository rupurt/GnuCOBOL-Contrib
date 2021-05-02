*>******************************************************************************
*>  This file is part of cobjapi.
*>
*>  CobjapiFunctions.cpy is free software: you can redistribute it and/or 
*>  modify it under the terms of the GNU Lesser General Public License as 
*>  published by the Free Software Foundation, either version 3 of the License,
*>  or (at your option) any later version.
*>
*>  CobjapiFunctions.cpy is distributed in the hope that it will be useful, 
*>  but WITHOUT ANY WARRANTY; without even the implied warranty of 
*>  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*>  See the GNU Lesser General Public License for more details.
*>
*>  You should have received a copy of the GNU Lesser General Public License 
*>  along with CobjapiFunctions.cpy.
*>  If not, see <http://www.gnu.org/licenses/>.
*>******************************************************************************

*>******************************************************************************
*> Program:      CobjapiFunctions.cpy
*>
*> Purpose:      Functions for the cobjapi wrapper
*>
*> Author:       Laszlo Erdos - https://www.facebook.com/wortfee
*>
*> Date-Written: 2014.12.24
*>
*> Tectonics:    ---
*>
*> Usage:        Use this copy file in GnuCOBOL GUI programs, 
*>               in the CONFIGURATION SECTION.
*>
*>******************************************************************************
*> Date       Name / Change description 
*> ========== ==================================================================
*> 2003.02.26 This comment is only for History. The latest Version (V1.0.6) of 
*>            JAPI was released on 02/26/2003. Homepage: http://www.japi.de 
*>------------------------------------------------------------------------------
*> 2014.12.24 Laszlo Erdos: 
*>            - GnuCOBOL support for JAPI added. 
*>------------------------------------------------------------------------------
*> 2018.03.10 Laszlo Erdos: 
*>            - Small change for JAPI 2.0.
*>------------------------------------------------------------------------------
*> 2020.05.10 Laszlo Erdos: 
*>            - J-FORMATTEDTEXTFIELD added.
*>------------------------------------------------------------------------------
*> 2020.05.21 Laszlo Erdos: 
*>            - J-TABBEDPANE, J-ADDTAB.
*>------------------------------------------------------------------------------
*> 2020.05.23 Laszlo Erdos: proposed changes by Rod Gobby (Deer Valley Software)
*>            - file name changed from "cobjapifn.cpy" to "CobjapiFunctions.cpy"
*>            - function names sorted into alphabetical order.
*>            - "FUNCTION ALL INTRINSIC." commented out so as not to conflict
*>              with existing code.
*>            - "end of file" comment added.
*>------------------------------------------------------------------------------
*> 2020.05.30 Laszlo Erdos: 
*>            - J-ADDTABWITHICON.
*>------------------------------------------------------------------------------
*> 2020.10.03 Laszlo Erdos: 
*>            - J-NODE, J-ADDNODE, J-TREE
*>            - J-ENABLEDOUBLECLICK, J-DISABLEDOUBLECLICK
*>            - J-SETTREEBGNONSELCOLOR  
*>            - J-SETTREEBGNONSELNAMEDCOLOR
*>            - J-SETTREEBGSELCOLOR     
*>            - J-SETTREEBGSELNAMEDCOLOR
*>            - J-SETTREEBORDERSELCOLOR 
*>            - J-SETTREEBORDERSELNAMEDCOLOR
*>            - J-SETTREETEXTNONSELCOLOR
*>            - J-SETTREETEXTNONSELNAMEDCOLOR
*>            - J-SETTREETEXTSELCOLOR   
*>            - J-SETTREETEXTSELNAMEDCOLOR
*>------------------------------------------------------------------------------
*> 2020.12.22 Laszlo Erdos: 
*>            - J-INTERNALFRAME, J-DESKTOPPANE
*>------------------------------------------------------------------------------
*> 2020.12.30 Laszlo Erdos: 
*>            - J-TABLE, J-ADDROW, J-CLEARTABLE, J-SETCOLUMNWIDTHS
*>            - J-SETGRIDNAMEDCOLOR
*>            - J-SETHEADERNAMEDCOLOR
*>            - J-SETHEADERNAMEDCOLORBG
*>            - J-SETGRIDCOLOR
*>            - J-SETHEADERCOLOR
*>            - J-SETHEADERCOLORBG
*>------------------------------------------------------------------------------
*> 2021.03.21 Laszlo Erdos: 
*>            - J-TITLEDCOLORPANEL
*>            - J-TITLEDNAMEDCOLORPANEL
*>------------------------------------------------------------------------------
*> 2021.05.02 Laszlo Erdos: 
*>            - J-INITIALIZE
*>******************************************************************************

 FUNCTION J-ADD
 FUNCTION J-ADDITEM
 FUNCTION J-ADDNODE
 FUNCTION J-ADDROW
 FUNCTION J-ADDTAB
 FUNCTION J-ADDTABWITHICON
 FUNCTION J-ALERTBOX
 FUNCTION J-APPENDTEXT
 FUNCTION J-BEEP
 FUNCTION J-BORDERPANEL
 FUNCTION J-BUTTON
 FUNCTION J-CANVAS
 FUNCTION J-CHECKBOX
 FUNCTION J-CHECKMENUITEM
 FUNCTION J-CHOICE
 FUNCTION J-CHOICEBOX2
 FUNCTION J-CHOICEBOX3
 FUNCTION J-CLEARTABLE
 FUNCTION J-CLIPRECT
 FUNCTION J-COMPONENTLISTENER
 FUNCTION J-CONNECT
 FUNCTION J-DELETE
 FUNCTION J-DESELECT
 FUNCTION J-DESKTOPPANE
 FUNCTION J-DIALOG
 FUNCTION J-DISABLE
 FUNCTION J-DISABLEDOUBLECLICK
 FUNCTION J-DISPOSE
 FUNCTION J-DRAWARC
 FUNCTION J-DRAWCIRCLE
 FUNCTION J-DRAWIMAGE
 FUNCTION J-DRAWIMAGESOURCE
 FUNCTION J-DRAWLINE
 FUNCTION J-DRAWOVAL
 FUNCTION J-DRAWPIXEL
 FUNCTION J-DRAWPOLYGON
 FUNCTION J-DRAWPOLYLINE
 FUNCTION J-DRAWRECT
 FUNCTION J-DRAWROUNDRECT
 FUNCTION J-DRAWSCALEDIMAGE
 FUNCTION J-DRAWSTRING
 FUNCTION J-ENABLE
 FUNCTION J-ENABLEDOUBLECLICK
 FUNCTION J-FILEDIALOG
 FUNCTION J-FILESELECT
 FUNCTION J-FILLARC
 FUNCTION J-FILLCIRCLE
 FUNCTION J-FILLOVAL
 FUNCTION J-FILLPOLYGON
 FUNCTION J-FILLRECT
 FUNCTION J-FILLROUNDRECT
 FUNCTION J-FOCUSLISTENER
 FUNCTION J-FORMATTEDTEXTFIELD
 FUNCTION J-FRAME
 FUNCTION J-GETACTION
 FUNCTION J-GETCOLUMNS
 FUNCTION J-GETCURPOS
 FUNCTION J-GETDANGER
 FUNCTION J-GETFONTASCENT
 FUNCTION J-GETFONTHEIGHT
 FUNCTION J-GETHEIGHT
 FUNCTION J-GETIMAGE
 FUNCTION J-GETIMAGESOURCE
 FUNCTION J-GETINHEIGHT
 FUNCTION J-GETINSETS
 FUNCTION J-GETINWIDTH
 FUNCTION J-GETITEM
 FUNCTION J-GETITEMCOUNT
 FUNCTION J-GETKEYCHAR
 FUNCTION J-GETKEYCODE
 FUNCTION J-GETLAYOUTID
 FUNCTION J-GETLENGTH
 FUNCTION J-GETMOUSEBUTTON
 FUNCTION J-GETMOUSEPOS
 FUNCTION J-GETMOUSEX
 FUNCTION J-GETMOUSEY
 FUNCTION J-GETPARENTID
 FUNCTION J-GETPOS
 FUNCTION J-GETROWS
 FUNCTION J-GETSCALEDIMAGE
 FUNCTION J-GETSCREENHEIGHT
 FUNCTION J-GETSCREENWIDTH
 FUNCTION J-GETSELECT
 FUNCTION J-GETSELEND
 FUNCTION J-GETSELSTART
 FUNCTION J-GETSELTEXT
 FUNCTION J-GETSTATE
 FUNCTION J-GETSTRINGWIDTH
 FUNCTION J-GETTEXT
 FUNCTION J-GETVALUE
 FUNCTION J-GETVIEWPORTHEIGHT
 FUNCTION J-GETVIEWPORTWIDTH
 FUNCTION J-GETWIDTH
 FUNCTION J-GETXPOS
 FUNCTION J-GETYPOS
 FUNCTION J-GRAPHICBUTTON
 FUNCTION J-GRAPHICLABEL
 FUNCTION J-HASFOCUS
 FUNCTION J-HELPMENU
 FUNCTION J-HIDE
 FUNCTION J-HSCROLLBAR
 FUNCTION J-IMAGE
 FUNCTION J-INITIALIZE
 FUNCTION J-INSERT
 FUNCTION J-INSERTTEXT
 FUNCTION J-INTERNALFRAME
 FUNCTION J-ISPARENT
 FUNCTION J-ISRESIZABLE
 FUNCTION J-ISSELECT
 FUNCTION J-ISVISIBLE
 FUNCTION J-KEYLISTENER
 FUNCTION J-KILL
 FUNCTION J-LABEL
 FUNCTION J-LED
 FUNCTION J-LINE
 FUNCTION J-LIST
 FUNCTION J-LOADIMAGE
 FUNCTION J-MENU
 FUNCTION J-MENUBAR
 FUNCTION J-MENUITEM
 FUNCTION J-MESSAGEBOX
 FUNCTION J-METER
 FUNCTION J-MOUSELISTENER
 FUNCTION J-MULTIPLEMODE
 FUNCTION J-NEXTACTION
 FUNCTION J-NODE
 FUNCTION J-PACK
 FUNCTION J-PANEL
 FUNCTION J-PLAY
 FUNCTION J-PLAYSOUNDFILE
 FUNCTION J-POPUPMENU
 FUNCTION J-PRINT
 FUNCTION J-PRINTER
 FUNCTION J-PROGRESSBAR
 FUNCTION J-QUIT
 FUNCTION J-RADIOBUTTON
 FUNCTION J-RADIOGROUP
 FUNCTION J-RANDOM
 FUNCTION J-RELEASE
 FUNCTION J-RELEASEALL
 FUNCTION J-REMOVE
 FUNCTION J-REMOVEALL
 FUNCTION J-REMOVEITEM
 FUNCTION J-REPLACETEXT
 FUNCTION J-SAVEIMAGE
 FUNCTION J-SCROLLPANE
 FUNCTION J-SELECT
 FUNCTION J-SELECTALL
 FUNCTION J-SELECTTEXT
 FUNCTION J-SEPARATOR
 FUNCTION J-SETALIGN
 FUNCTION J-SETBLOCKINC
 FUNCTION J-SETBORDERLAYOUT
 FUNCTION J-SETBORDERPOS
 FUNCTION J-SETCOLOR
 FUNCTION J-SETCOLORBG
 FUNCTION J-SETCOLUMNS
 FUNCTION J-SETCOLUMNWIDTHS
 FUNCTION J-SETCURPOS
 FUNCTION J-SETCURSOR
 FUNCTION J-SETDANGER
 FUNCTION J-SETDEBUG
 FUNCTION J-SETECHOCHAR
 FUNCTION J-SETEDITABLE
 FUNCTION J-SETFIXLAYOUT
 FUNCTION J-SETFLOWFILL
 FUNCTION J-SETFLOWLAYOUT
 FUNCTION J-SETFOCUS
 FUNCTION J-SETFONT
 FUNCTION J-SETFONTNAME
 FUNCTION J-SETFONTSIZE
 FUNCTION J-SETFONTSTYLE
 FUNCTION J-SETGRIDCOLOR
 FUNCTION J-SETGRIDLAYOUT
 FUNCTION J-SETGRIDNAMEDCOLOR
 FUNCTION J-SETHEADERCOLOR
 FUNCTION J-SETHEADERCOLORBG
 FUNCTION J-SETHEADERNAMEDCOLOR
 FUNCTION J-SETHEADERNAMEDCOLORBG
 FUNCTION J-SETHGAP
 FUNCTION J-SETICON
 FUNCTION J-SETIMAGE
 FUNCTION J-SETINSETS
 FUNCTION J-SETMAX
 FUNCTION J-SETMIN
 FUNCTION J-SETNAMEDCOLOR
 FUNCTION J-SETNAMEDCOLORBG
 FUNCTION J-SETNOLAYOUT
 FUNCTION J-SETPORT
 FUNCTION J-SETPOS
 FUNCTION J-SETRADIOGROUP
 FUNCTION J-SETRESIZABLE
 FUNCTION J-SETROWS
 FUNCTION J-SETSHORTCUT
 FUNCTION J-SETSIZE
 FUNCTION J-SETSLIDESIZE
 FUNCTION J-SETSPLITPANELEFT
 FUNCTION J-SETSPLITPANERIGHT
 FUNCTION J-SETSTATE
 FUNCTION J-SETTEXT
 FUNCTION J-SETTREEBGNONSELCOLOR  
 FUNCTION J-SETTREEBGNONSELNAMEDCOLOR
 FUNCTION J-SETTREEBGSELCOLOR     
 FUNCTION J-SETTREEBGSELNAMEDCOLOR
 FUNCTION J-SETTREEBORDERSELCOLOR 
 FUNCTION J-SETTREEBORDERSELNAMEDCOLOR
 FUNCTION J-SETTREETEXTNONSELCOLOR
 FUNCTION J-SETTREETEXTNONSELNAMEDCOLOR
 FUNCTION J-SETTREETEXTSELCOLOR   
 FUNCTION J-SETTREETEXTSELNAMEDCOLOR
 FUNCTION J-SETUNITINC
 FUNCTION J-SETVALUE
 FUNCTION J-SETVGAP
 FUNCTION J-SETXOR
 FUNCTION J-SEVENSEGMENT
 FUNCTION J-SHOW
 FUNCTION J-SHOWPOPUP
 FUNCTION J-SLEEP
 FUNCTION J-SOUND
 FUNCTION J-SPLITPANE
 FUNCTION J-START
 FUNCTION J-SYNC
 FUNCTION J-TABBEDPANE
 FUNCTION J-TABLE
 FUNCTION J-TEXTAREA
 FUNCTION J-TEXTFIELD
 FUNCTION J-TITLEDCOLORPANEL
 FUNCTION J-TITLEDNAMEDCOLORPANEL
 FUNCTION J-TRANSLATE
 FUNCTION J-TREE
 FUNCTION J-VSCROLLBAR
 FUNCTION J-WINDOW
 FUNCTION J-WINDOWLISTENER.
*> intrinsic functions
*> FUNCTION ALL INTRINSIC.  <==== commented out
*>
*>******************************************************************************
*>    end of file:  CobjapiFunctions.cpy
*>******************************************************************************
