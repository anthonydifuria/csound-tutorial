<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
        ; Initialize the global variables. 
        ksmps = 32
        nchnls = 2
        0dbfs = 1

        instr GUI; instrument for the graphical interface, always on (see in the score)

        gkDur chnget "dur";duration of each sound event
        gkDen chnget "den";density - sound events / second

        gkFFond chnget "ffond";fundamental frequency
        gkSpreadFreq chnget "spredFreq";frequency spread - frequency interval between gkFFond and gkSpreadFreq

        endin

        instr 1

            ktrig metro gkDen;density - EVENTS PER SECOND     
            schedkwhen ktrig,0,0,2,0,gkDur ;calls / turns on instrument 2 with duration gkDur

        endin

        instr 2

            iSpreadFreq = rnd( i(gkSpreadFreq) );rnd is an operator that randomizes values between 0 and the value of gkSpreadFreq
                                                ;if gkSpreadFreq = 200 the random values will be generated between 0 and gkSpreadFreq

            iFFond = i(gkFFond);control the oscillator frequency
            aSig oscili 0.1, iFFond + iSpreadFreq;if the value of gkSpreadFreq = 200 the oscillator frequency will be controlled
                                                 ;randomly from the value of iFFond = 100 to the value of gkSpreadFreq

            aEnv linseg 0, i(gkDur)/2, 1, i(gkDur)/2, 0;envelope

            aSigEnv = aSig * aEnv ;apply the envelope to the sine signal 

            outs aSigEnv, aSigEnv

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i "GUI" 0 [60*60*24*7] 
        i1 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
