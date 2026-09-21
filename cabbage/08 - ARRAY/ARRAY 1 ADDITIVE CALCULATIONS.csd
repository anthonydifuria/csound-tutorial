<Cabbage>

    form caption("ADDITIVE ARRAY 1") size(400, 300), guiMode("queue") pluginId("def1")
    rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>
    
    <CsInstruments>
    ; Initialize the global variables. 
    ksmps = 32
    nchnls = 2
    0dbfs = 1

    instr 1

        gindex = 0 ;array index instrument 2
        giPartial = 20 ;number of partials
        giDur = 5 ; duration
        iPiGreco = 4 * taninv(1) ;computes pi

        ;arrays initialization
        giFreq[] init giPartial
        giAmp[] init giPartial
        giPhase[] init giPartial

        iFreqFond = 100;fundamental frequency
        index = 0;array index
        while index < giPartial do;loop

         schedule 2, 0, giDur ;calls instrument 2 "n" times = giPartial
            giFreq[index] = (index + 1) * iFreqFond;writes integers into the array 
            giAmp[index] = index + 1;writes integers into the array 
            giPhase[index] = iPiGreco / (index + 1)
            index += 1   
         od

    endin

    instr 2

        giAmp[gindex] = gindex * 100
        iAMP = giAmp[gindex]
        print iAMP 
        iFREQ = giFreq[gindex] 
        print giFreq[gindex]
        iPHASE = giPhase[gindex]
        print iPHASE

        gindex = gindex + 1

    endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        f1 0 4096 10 1 ;SINE

        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
