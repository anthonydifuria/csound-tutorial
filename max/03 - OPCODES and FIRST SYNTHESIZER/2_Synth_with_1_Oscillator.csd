<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>                        ;p4                 p5

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
massign 0, 1 ; all MIDI channels -> instr 1 (the MIDI keyboard of the Cabbage version)
        ; Initialize the global variables. 
        ksmps = 10
        nchnls = 2
        0dbfs = 1

        ;the instrument will be called directly from the MIDI virtual keyboard
        instr 1
            ;p5 and p4 are the variables that interface the virtual keyboard to our instrument
            iAmp = p5 ; p5 for amplitudes
            iFreq = p4 ; p4 for frequencies

            aSig oscili iAmp, iFreq

            iAtt = 0.1 ;sound attack time 1/10 of a second - 0.1 seconds
            iDec = 0.1 ;sound decay time 1/10 of a second - 0.1 seconds
            iSus = 0.5 ;sound sustain amplitude 0.5
            iRel = 3 ;sound release time 3/10 of a second - 0.3 seconds
            aEnv madsr iAtt, iDec, iSus, iRel; envelope or dynamic profile of the sound

            aSigEnv = aSig * aEnv; applying the envelope to the sine signal through multiplication

            outs aSigEnv, aSigEnv

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z        
    </CsScore>

</CsoundSynthesizer>
