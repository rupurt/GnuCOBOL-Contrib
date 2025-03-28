      *-------------------------------------------------------------------------------*
      * **********************************************************
      *  GCSORT Tests
      * **********************************************************
      * Author:    Sauro Menna
      * Date:      20241131
      * License
      *    Copyright 2024 Sauro Menna
      *    GNU Lesser General Public License, LGPL, 3.0 (or greater)
      * Purpose:   Sort COBOL module
      * *********************************************
      *-------------------------------------------------------------------------------*
      * fsrtsqf01.cpy
       sd file-sort.
      **     record is varying in size
      **     from 31 to 95 characters depending on ws-rec-length.   
       01 sort-data.
           05 srt-lenrec          pic  9(4).
           05 srt-seq-record      pic  9(7).
           05 srt-xx-seq-record redefines srt-seq-record pic  x(07).
           05 srt-ch-field        pic  x(5).
           05 srt-bi-field        pic  9(7) comp.
           05 srt-fi-field        pic s9(7) comp.
           05 srt-fl-field        comp-2.
           05 srt-pd-field        pic s9(7) comp-3.
           05 srt-zd-field        pic s9(7).
           05 srt-xx-zd-field redefines srt-zd-field pic x(7).
           05 srt-fl-field-1        COMP-1.
           05 srt-clo-field       pic s9(7) sign is leading.
           05 srt-cst-field       pic s9(7) sign is trailing separate.
           05 srt-csl-field       pic s9(7) sign is leading separate.
           05 ch-filler           pic  x(25).
      *01 sort-data-record-min01   pic x(45).
      *01 sort-data-record-min02   pic x(70).
       