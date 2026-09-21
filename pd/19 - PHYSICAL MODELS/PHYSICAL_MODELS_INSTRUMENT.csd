<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>
    
    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
massign 0, 1 ; all MIDI channels -> instr 1 (the MIDI keyboard of the Cabbage version)
        ; Initialize the global variables. 
        ksmps = 32
        nchnls = 2
        0dbfs = 1

        ;instrument will be triggered by keyboard widget
        instr 1
            setksmps 1
    
            aFB init 0
            aPink pinker
    
            iPercAtt = 0.01
            aEnv madsr 0.01,0.1,0.5,1
    
            iHarm = int(rnd(5) + 1)
            iFreq = p4
            iTime = (1 / iFreq) * 1000
    
            ;print iTime
            aDelay vdelay aPink + aFB * 0.99, iTime, 2000
            aFB = aDelay 
    
            aL, aR pan2 (aDelay * aEnv * p5), rnd(1)
    
            outs aL, aR
    
        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
    </CsScore>
    
</CsoundSynthesizer>
