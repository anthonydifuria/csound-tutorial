 <Cabbage>

    form caption("HARMONIC SERIES") size(400, 300), guiMode("queue") pluginId("def1")
    rslider bounds(296, 202, 100, 100), channel("master"), range(0, 1, 0, 1, .01), text("MASTER"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
    signaldisplay bounds(10, 8, 362, 187), colour("black") displayType("waveform"), backgroundColour(255, 255, 255), zoom(0.5), signalVariable("aOutMaster", "aOutMaster"), channel("display")

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
        -n --displays -+rtmidi=NULL -M0 
    </CsOptions>
    
    <CsInstruments>
    ;sr is set by the host
    ksmps = 16 
    nchnls = 2  
    0dbfs=1 

    instr 1 

        kMasterOut cabbageGetValue "master" 

        kfreq = 500 
        kamp = 1 

        ;ADDITIVE SYNTHESIS OSCILLATORS - HARMONIC SERIES
        a1f oscili kamp, 1 * kfreq ;FUNDAMENTAL 1F 
        a2f oscili kamp, 2 * kfreq ; 2F
        a3f oscili kamp, 3 * kfreq ; 3F
        a4f oscili kamp, 4 * kfreq ; 4F
        a5f oscili kamp, 5 * kfreq ; 5F

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
