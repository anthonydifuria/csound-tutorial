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


        instr 1

            gindex = 0 ;array index instrument 2

            iNyquist = sr / 2;NYQUIST

            giFreqFond = 100;FUNDAMENTAL FREQUENCY

            iPartial = int(iNyquist / giFreqFond) ;NUMBER OF PARTIALS UP TO NYQUIST

            giDur = 5 ; duration
            iPiGreco = 4 * taninv(1) ;compute Pi

            ;arrays initialization
            giFreq[] init iPartial
            giAmp[] init iPartial
            giPhase[] init iPartial
            giTime[] init iPartial

            index = 0;ARRAY INDEX
            while index < iPartial do;LOOP

             schedule 2, 0, giDur ;calls instrument 2 "n" times = giPartial
 
                ;SAW
                ;giFreq[index] = (index + 1)  ;HARMONIC SERIES
                ;giAmp[index] = 1 / (index + 1) ;AMPLITUDES 
    
                ;SQUARE
                giFreq[index] = (2 * index + 1)  ;HARMONIC SERIES
                giAmp[index] = 1 / (2 * index + 1) ;AMPLITUDES 
    
                ;TRIANGLE
                ;giFreq[index] = (2 * index + 1)        ;HARMONIC SERIES
                ;giAmp[index] = 1 / (2 * index + 1) ^ 2 ;AMPLITUDES 
    
                giPhase[index] = iPiGreco * ((index + 1) / iPartial) ;PHASES ;PHASES
    
                giTime[index] = (giDur / 2) * ((iPartial - index) / iPartial);HARMONICS TIMES
    
                index += 1 
        
             od
 
        endin


        instr 2

            ;print giFreq[gindex]
            ;print giAmp[gindex]

            aA oscili 0.1 * giAmp[gindex], giFreqFond * giFreq[gindex]
            aEnv linseg 0, giDur / 2 , 1, giTime[gindex] , 0

            outs aA * aEnv ,aA * aEnv 

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
