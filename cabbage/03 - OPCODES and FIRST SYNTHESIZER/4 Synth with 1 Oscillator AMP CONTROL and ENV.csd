<Cabbage>

    form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")
    keyboard bounds(8, 158, 381, 95)

    ;SINE AMPLITUDE
    rslider bounds(10, 10, 60, 60) channel("amp") range(   0,       1,       0.5,      1,       0.001)     text("Amplitude")
                                                        ;min val, max val, init val, function, resolution
    ;ENVELOPE CONTROLS                                               
    rslider bounds(10, 70, 60, 60) channel("att") range(   0.001,       1,       0.1,      1,       0.001)     text("ATT")
    rslider bounds(70, 70, 60, 60) channel("dec") range(   0.001,       1,       0.1,      1,       0.001)     text("DEC")
    rslider bounds(130, 70, 60, 60) channel("sus") range(   0,       1,       0.5,      1,       0.001)     text("SUS")
    rslider bounds(200, 70, 60, 60) channel("rel") range(   0.001,       1,       0.3,      1,       0.001)     text("REL")
                                                                                                                                                                                                                                        
</Cabbage> 


<CsoundSynthesizer>

    <CsOptions>
    -n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>                        ;p4                 p5

    <CsInstruments>
        ; Initialize the global variables. 
        ksmps = 10
        nchnls = 2
        0dbfs = 1

        instr 2;instrument for controls only (SEE THE SCORE FOR TURNING IT ON)

            ;the cabbageGetValue opcode lets us read values directly from the rotary slider on the graphical interface
            ;the channel is called "amp" (SEE THE GRAPHICAL INTERFACE CODE SECTION)
            gkAmp1 cabbageGetValue "amp"

            gkAtt cabbageGetValue "att"
            gkDec cabbageGetValue "dec"
            gkSus cabbageGetValue "sus"
            gkRel cabbageGetValue "rel"

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

            ;freezing of the global control variables 
            ;the madsr opcode accepts only "i" type variables, so in order to pass the control variables 
            ; we write i(gkVARIABLENAME)
            ; If we think about the reality of an acoustic instrument such as the piano, the dynamic profile is determined 
            ; every time we play a key, so the envelope variables are constant for the whole duration of the sound
            iAtt = i(gkAtt)
            iDec = i(gkDec)
            iSus = i(gkSus)
            iRel = i(gkRel)
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
