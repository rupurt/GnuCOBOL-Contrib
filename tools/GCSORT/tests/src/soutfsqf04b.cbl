      *-------------------------------------------------------------------------------*
      * *********************************************
      * Author:    Sauro Menna
      * Date:      20160821
      * License
      *    Copyright 2016 Sauro Menna
      *    GNU Lesser General Public License, LGPL, 3.0 (or greater)
      * Purpose:   Sort COBOL module
      * Instruction OUTREC
      * option:
      * cobc -x -t ..\listing\%1.lst -I ..\copy -Wall -fbinary-size=1--8 
      *      -fnotrunc -fbinary-byteorder=big-endian -o ..\bin\%1 ..\src\%1.CBL 
      * **********************************************************
      * *********************************************
      *
      *                                                         pos   len
      *         05 in-seq-record        pic  9(07).              1      7
      *         05 in-ch-field          pic  x(5).               8      5
      *         05 in-bi-field          pic  9(7) comp.         13      3
      *         05 in-fi-field          pic s9(7) comp.         16      4
      *         05 in-fl-field          comp-2.                 20      8
      *         05 in-pd-field          pic s9(7) comp-3.       28      4
      *         05 in-zd-field          pic s9(7).              32      7
      *         05 ch-filler            pic  x(52).             39     52
      *------------------------------------------------------------------------*
      *                                                         pos   len
      *         05 out-seq-record        pic  9(07).             1     7
      *         05 out-zd-field          pic s9(7).              8     7
      *         05 out-fl-field          comp-2.                15     8
      *         05 out-fi-field          pic s9(7) comp.        23     4
      *         05 out-pd-field          pic s9(7) comp-3.      27     4
      *         05 out-bi-field          pic  9(7) comp.        31     3
      *         05 out-ch-field          pic  x(5).             34     5
      *         05 ch-filler             pic  x(52).            39    52
      *------------------------------------------------------------------------*
      *
      *
      *-------------------------------------------------------------------------------*
       identification division.
       program-id. soutfsqf04.
       environment division.
       configuration section.
       repository.
        function all intrinsic.
       input-output section.
       file-control.
      * sinsqf01.cpy
           copy  sinsqf01.
      *sort output file
      * soutsqf01.cpy
           copy soutsqf01.
      *sort file (sd)
      * ssrtsqf01.cpy
           copy ssrtsqf01.
       data division.
       file section.
      * finsqf01.cpy
           copy finsqf01.
      * foutsqf02.cpy
           copy foutsqf02.
      * fsrtsqf01.cpy
           copy fsrtsqf01.
      *
      *
       working-storage section.
       77 fs-infile                      pic xx.
       77 fs-outfile                     pic xx.
       77 fs-sort                        pic xx.
      *  
           copy wktotsum01.
      *
      * ============================= *
       01  save-record-sort              pic x(90).
      * ============================= *
       77 record-counter-in              pic 9(7) value zero.
       77 record-counter-out             pic 9(7) value zero.
       77 bIsFirstTime                   pic 9    value zero.       
       77 bIsPending                     pic 9    value zero.       
       01 current-time.
           05 ct-hours                   pic 99.
           05 ct-minutes                 pic 99.
           05 ct-seconds                 pic 99.
           05 ct-hundredths              pic 99.       
       
      * ============================= *
       procedure division.
      * ============================= *
       master-sort.
           display "*===============================================* "
           display " Sort on ascending  key    srt-ch-field "                 ## on descending key    <modify key>               
           display "*===============================================* "
           
           sort file-sort
                on ascending  key    srt-ch-field                          ## on ascending  key    <modify key>    
                   with duplicates in  order                               ## DUPLICATES
                    input procedure  is input-proc
                    output procedure is output-proc.
                    
           display "*===============================================* "
           display " Record input  : "  record-counter-in
           display " Record output : "  record-counter-out
           display "*===============================================* "
           goback
           .
      *
      * ============================= *
       input-proc.
      * ============================= *
           open input sortin.
           perform inputrec-proc until fs-infile not equal "00"
           close sortin
           .
      *
      * ============================= *
        inputrec-proc.
      * ============================= *
           read sortin
           end-read
           if fs-infile equal "00"
               perform release-record
           end-if
           .
      * ============================= *
       release-record.
      * ============================= *
           add 1 to record-counter-in
      ** filtering input record 
            perform inrec-record
            release sort-data 
           .
      *
      * ============================= *
       inrec-record.
      * ============================= *
      ***     move in-seq-record  to  srt-seq-record 
           move low-value      to outfile-record
      * copy prinrsrt01.cpy
           copy prinrsrt01.
           .
      * ============================= *
       output-proc.
      * ============================= *
           open output sortout.
           perform outrec-proc-dett until fs-sort  
                   not equal "00".
           if (bIsPending = 1)
              perform write-record-out
           end-if
           close sortout.
      *
      * ============================= *
       outrec-proc-dett.
      * ============================= *
      *
           return file-sort at end 
                display " "
                end-return
           if fs-sort equal "00"     
               perform verify-record-out
           end-if
           .
      * ============================= *
       verify-record-out.     
      * ============================= *
      *
      * ## filtering data 
      *
      * ## NO filtering data 
           perform outrec-record
           write outfile-record 
           add 1 to record-counter-out
           .
      * ============================= *
       outrec-record.
      * ============================= *
      ***     move in-seq-record  to  srt-seq-record 
           move low-value      to outfile-record
      * copy prsrtout.cpy
           copy prsrtout.
           .
  
      * ============================= *
       add-totalizer.
      * ============================= *
      * Sum all Fields  
      *  copy   praddsrttot.cpy
           copy  praddsrttot.
           move 1            to bIsPending
           .
      * ============================= *
       reset-totalizer.    
      * ============================= *
      *  copy   przerotot.
           copy   przerotot.
           .
      * ============================= *
       write-record-out.
      * ============================= *
           move low-value           to outfile-record
           add  1                   to record-counter-out
           move srt-seq-record      to outfile-record
           move zero                to bIsPending
           write outfile-record 
           .
      * ============================= *
       view-data.
      * ============================= *
           read sortout at end 
                display " "
           end-read
           if fs-outfile equal "00"
                   display "============== ## ============== "
                   display " sq="   out-seq-record 
                           " ch="   out-ch-field 
                           " bi="   out-bi-field      
                           " fi="   out-fi-field      
                           " pd="   out-pd-field      
                           " zd="   out-zd-field 
                           " fl="   out-fl-field      
           end-if
           .
