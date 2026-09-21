<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
    ;sr is set by the host
    ksmps = 16 
    nchnls = 2  
    0dbfs=1 

    instr 1 

        kMasterOut chnget "master" 

        kfreq = 500 
        kamp = 1 

        ;ADDITIVE SYNTHESIS OSCILLATORS - HARMONIC SERIES - TRIANGLE WAVE
        ;TRIANGLE WAVE HARMONICS = (I) + (II * 0) + (III / 3^2) + (IV * 0) + (V / 5^2)
        a1f oscili kamp / 1^2, 1 * kfreq ;FUNDAMENTAL 1F 
        a2f oscili kamp * 0, 2 * kfreq ; 2F  
        a3f oscili kamp / 3^2, 3 * kfreq ; 3F
        a4f oscili kamp * 0, 4 * kfreq ; 4F  
        a5f oscili kamp / 5^2, 5 * kfreq ; 5F

        aOut = ((a1f + a2f + a3f + a4f + a5f) / 5); sum the signals and divide by the number of signals
                                                  ; to avoid signal saturation
        aOutMaster = aOut * kMasterOut

        outs aOutMaster, aOutMaster 

        display	aOutMaster, .1, 1 ;oscilloscope, signal display

        endin

    </CsInstruments>
    
    <CsScore>
        f0 z
        ;instrument 1 starts at 0 and ends at [60*60*24*7]
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
