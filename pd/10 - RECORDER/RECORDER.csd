<CsoundSynthesizer>

    <CsOptions>
        -n -dm0
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.

        ; sr set by host
        ksmps = 64
        nchnls = 2
        0dbfs = 1

        gkFileRecorded        init    0

        instr    1
         gaL,gaR ins;AUDIO STREAM TO RECORD
         gkrecord    chnget    "record"
         kRecStart   trigger    gkrecord,0.5,0
         gkleft rms gaL
         gkright rms gaR

         if kRecStart == 1  then
                     event     "i",9000,0,-1 ;INSTRUMENT TO CALL FOR RECORDING
         endif
  
        endin

        instr 9000;RECORDING INSTRUMENT
        
         if gkrecord==0 then;STOPS THE RECORDING
            if metro(10) == 1 then
                outvalue "left", portk(0, .25)
            endif
            if metro(10) == 1 then
                outvalue "right", portk(0, .25)
            endif
                     turnoff
         endif
 
         gkFileRecorded        init    1
         itim        date
         Stim        dates     itim
         itim        date
         Stim        dates     itim
         Syear       strsub    Stim, 20, 24
         Smonth      strsub    Stim, 4, 7
         Sday        strsub    Stim, 8, 10
         iday        strtod    Sday
         Shor        strsub    Stim, 11, 13
         Smin        strsub    Stim, 14, 16
         Ssec        strsub    Stim, 17, 19
         Sfilnam     sprintf   "%s_%s_%02d_%s_%s_%s.wav", Syear, Smonth, iday, Shor,Smin, Ssec
         gSname      sprintf   "FileRecorder_%s", Sfilnam

         if gkrecord == 1 then ;RECORDING
             
            if metro(10) == 1 then
                outvalue "left", portk(gkleft*10, .25)
            endif
            if metro(10) == 1 then
                outvalue "right", portk(gkright*10, .25)
            endif
            fout gSname, 8, gaL, gaR ;RECORDING
            
         endif
 
        endin

    </CsInstruments>  

    <CsScore>
        i 1 0 [60*60*24*7]
    </CsScore>

</CsoundSynthesizer>