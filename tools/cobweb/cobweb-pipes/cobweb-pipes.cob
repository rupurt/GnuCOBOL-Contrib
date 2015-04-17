GCobol >>SOURCE FORMAT IS FREE
>>IF docpass NOT DEFINED
      *> ***************************************************************
      *>****R* cobweb/cobweb-pipes
      *> AUTHOR
      *>   Brian Tiffin
      *> DATE
      *>   20150216 and 20150417
      *> LICENSE
      *>   GNU Lesser General Public License, LGPL, 3.0 (or greater)
      *> PURPOSE
      *>   cobweb-pipes program. Read OR Write on most POSIX systems
      *>   pipe-open, pipe-read, pipe-write, pipe-close
      *> TECTONICS
      *>   cobc -x program.cob cobweb-pipes.cob -g -debug
      *> SOURCE
      *> ***************************************************************
       identification division.
       program-id. cobweb-pipes.
       procedure division.

      *> cobcrun default, display the repository
       display "      *> cobweb-pipes function repository" end-display
       display "            function pipe-open"            end-display
       display "            function pipe-read"            end-display
       display "            function pipe-write"           end-display
       display "            function pipe-close"           end-display
       
       goback.
       end program cobweb-pipes.
      *>****
        
       
      *> ***************************************************************
      *>****F* cobweb-pipes/pipe-open
      *> PURPOSE
      *>   Open a pipe channel, Read or Write
      *> INPUTS 
      *>   shell command, pic x any
      *>   pipe open mode, "r" or "w", not both on POSIX, but maybe Mac
      *> OUTPUTS
      *>   pipe record, first field pointer
      *> SOURCE
      *> ***************************************************************
       identification division.
       function-id. pipe-open.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       linkage section.
       01 pipe-command         pic x any length.
       01 pipe-mode            pic x any length.
       01 pipe-record.
          05 pipe-pointer      usage pointer.
          05 filler            usage binary-long.

      *> ***************************************************************
       procedure division using
           pipe-command
           pipe-mode
         returning pipe-record.

       call static "popen" using
           by content concatenate(trim(pipe-command), x"00")
           by content concatenate(trim(pipe-mode), x"00")
         returning pipe-pointer
         on exception
             display "link error: popen" upon syserr end-display
             move 255 to return-code
             goback
       end-call

       if pipe-pointer equal null then
           display "exec error: popen" upon syserr end-display
           move 255 to return-code
           goback
       end-if

       goback.
       end function pipe-open.
      *>****


      *> ***************************************************************
      *>****F* cobweb-pipes/pipe-read
      *> PURPOSE
      *>   Read from a pipe.
      *> INPUTS 
      *>   pipe record, first field pointer
      *>   line buffer, pic x any
      *> OUTPUTS
      *>   pipe record
      *>     c string, pointer, possibly NULL
      *>     length, integer, possibly 0.
      *> SOURCE
      *> ***************************************************************
       identification division.
       function-id. pipe-read.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       working-storage section.
       01 line-buffer-length   usage binary-long.

       linkage section.
       01 pipe-record-in.
          05 pipe-pointer      usage pointer.
          05 filler            usage binary-long.
       01 line-buffer          pic x any length.
       01 pipe-record-out.
          05 pipe-read-status  usage pointer.
          05 characters-read   usage binary-long.

      *> ***************************************************************
       procedure division using
           pipe-record-in
           line-buffer
         returning pipe-record-out.

       move length(line-buffer) to line-buffer-length
       call "fgets" using
           by reference line-buffer
           by value line-buffer-length
           by value pipe-pointer
         returning pipe-read-status
         on exception
             display "link error: fgets" upon syserr end-display
             move 255 to return-code
             goback
       end-call

       goback.
       end function pipe-read.
      *>****


      *> ***************************************************************
      *>****F* cobweb-pipes/pipe-write
      *> PURPOSE
      *>   Write to a pipe channel
      *> INPUTS 
      *>   pipe record, first field pointer
      *>   line buffer
      *> OUTPUTS
      *>   pipe record, first field pointer
      *> SOURCE
      *> ***************************************************************
       identification division.
       function-id. pipe-write.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       working-storage section.
       01 line-buffer-length   usage binary-long.

       linkage section.
       01 pipe-record-in.
          05 pipe-pointer      usage pointer.
          05 filler            usage binary-long.
       01 line-buffer          pic x any length.
       01 pipe-record-out.
          05 filler            usage pointer.
          05 pipe-write-status usage binary-long.

      *> ***************************************************************
       procedure division using
           pipe-record-in
           line-buffer
         returning pipe-record-out.

       call "fputs" using
           by content concatenate(trim(line-buffer), x"00")
           by value pipe-pointer
         returning pipe-write-status
         on exception
             display "link error: fputs" upon syserr end-display
             move 255 to return-code
             goback
       end-call

       goback.
       end function pipe-write.
      *>****


      *> ***************************************************************
      *>****F* cobweb-pipes/pipe-close
      *> PURPOSE
      *>   Close a pipe channel
      *> INPUTS 
      *>   pipe record, first field pointer
      *> OUTPUTS
      *>   pipe close status, integer
      *> SOURCE
      *> ***************************************************************
       identification division.
       function-id. pipe-close.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       working-storage section.

       linkage section.
       01 pipe-record.
          05 pipe-pointer      usage pointer.
          05 filler            usage binary-long.
       01 pclose-status        usage binary-long.

      *> ***************************************************************
       procedure division using pipe-record returning pclose-status.

       call "pclose" using
           by value pipe-pointer
         returning pclose-status
         on exception
             display "link error: pclose" upon syserr end-display
             move 255 to return-code
             goback
       end-call

       goback.
       end function pipe-close.
      *>****

>>ELSE
==================
cobweb-pipes usage
==================

Introduction
------------
POSIX ``popen`` pipes.

Pass a command to the shell, and either read from the result
or write to the pipe line.

Read from a pipe-open(command, "r")
And write to a pipe-open(command, "w") pipe channel

See :manpage:`popen(3)`

Source
------

.. code-include::  cobweb-pipes.cob
   :language: cobol
>>END-IF
