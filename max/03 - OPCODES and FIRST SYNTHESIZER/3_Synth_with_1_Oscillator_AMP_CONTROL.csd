;min val, max val, init val, function, resolution

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



        instr 2;instrument for controls only (SEE THE SCORE FOR TURNING IT ON)

            ;the cabbageGetValue opcode lets us read values directly from the rotary slider on the graphical interface
            ;the channel is called "amp" (SEE THE GRAPHICAL INTERFACE CODE SECTION)
            gkAmp1 chnget "amp"

        endin

        ;the instrument will be called directly from the MIDI virtual keyboard
        instr 1
            ;p5 and p4 are the variables that interface the virtual keyboard to our instrument
            kAmp = p5 ; p5 for amplitudes
            kFreq = p4 ; p4 for frequencies

            ; to control the amplitude value of kamp = p4 (the value coming from the virtual keyboard)
            ; multiply by the control variable gkAmp1
            kAmpOscili1 = kAmp * gkAmp1

            aSig oscili kAmpOscili1, kFreq

            iAtt = 0.1 ;sound attack time 1/10 of a second - 0.1 seconds
            iDec = 0.1 ;sound decay time 1/10 of a second - 0.1 seconds
            iSus = 0.5 ;sound sustain amplitude 0.5
            iRel = 0.3 ;sound release time 3/10 of a second - 0.3 seconds
            aEnv madsr iAtt, iDec, iSus, iRel; envelope or dynamic profile of the sound

            aSigEnv = aSig * aEnv; applying the envelope to the sine signal through multiplication

            outs aSigEnv, aSigEnv

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        i2 0 [60*60*24*7]; instrument 2 always on for 1 week
    </CsScore>

</CsoundSynthesizer>
