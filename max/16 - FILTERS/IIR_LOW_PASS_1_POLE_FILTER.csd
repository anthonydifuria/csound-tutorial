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
        
        setksmps 1
        
            aYn init 0
            aNoise gauss 1

            iTWOPI = 8. * taninv(1.)

            iST = 1.0/sr
            iCutOff = 100
            iOmega = iTWOPI * iST * iCutOff

            iA = cos(iOmega) - 2 + sqrt((2 - cos(iOmega))^2 - 1);LOWPASS
            iB = 1.0 + iA

            print iA
            print iB

            ;y[n] = b0x[n] − a1y[n − 1]

            aXn = (aNoise * iB) 
            aYn delay1 aXn - (aYn * iA)
            
            aOut = aYn

            outs aOut,aOut

        endin


        </CsInstruments>

        <CsScore>
            ;causes Csound to run for about 7000 years...
            f0 z
            ;starts instrument 1 and runs it for a week
            i1 0 [60*60*24*7] 
        </CsScore>
    
</CsoundSynthesizer>
