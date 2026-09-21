<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>
    
    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
        ; Initialize the global variables. 
        ksmps = 64
        nchnls = 2
        0dbfs = 1

        gkrnd init 1

        ;GLOBAL AUDIO VARIABLES INITIALIZATION
        gaL init 0
        gaR init 0

        ;CONTROLS AND INSTRUMENT 2 CALL
        instr 1

            ;FUNDAMENTAL PARAMETERS
            gkDur0 chnget "dur"
            gkDur = gkDur0 * 0.001
            gkDurRand chnget "durRand"
            gkDen chnget "den"
            gkDenRand chnget "densRand"

            gkFfond chnget "ffond"
            gkSpreadFreq chnget "spreadfreq"

            ;SERIES
            gkHarm chnget "harm"
            gkSpazioFreqArm chnget "spazioFreqArm"

            ;OUTPUTS
            gkSpreadPan chnget "spreadpan"
            gkSINE chnget "sine"
            gkOut chnget "out"

            ;ARRAY OF FUNCTIONS FOR ENVELOPE SELECTION
            giFunc[] fillarray 3, 4, 6

            ;DENS RAND and DUR RAND
            kDurRand random -1 * (gkDur * 0.5), (gkDur * 0.5)
            gkDurSum = gkDur + (kDurRand * gkDurRand);duration rand

            kDenRand randomh -gkDen * 0.5, gkDen * 0.5, 50
            gkDenSum = gkDen + (kDenRand * gkDenRand);density rand

            ;INSTRUMENT 2 CALL
            ktrig metro  gkDenSum ;density
            schedkwhen ktrig,0,0,2,0,gkDurSum ;calls instrument 2 with density gkDen and duration gkDur

        endin


        ;INSTRUMENT
        instr 2

            ;ENVELOPE
            aenv poscil3 1, 1/i(gkDurSum), giFunc[chnget:i("func")-1]

            ;ADDITIVE
            ;HARMONIC SERIES
            irndHarm = (int(rnd(i(gkHarm))) * i(gkSpazioFreqArm)) + 1 

            ;FREQUENCY SPREAD
            ;computes random values in a range above and below the fundamental frequency
            irndSpredFreq = rnd(i(gkSpreadFreq)) - (i(gkSpreadFreq) / 2)

            ;FINAL FREQUENCY COMPUTATION
            iFreq = (i(gkFfond) + irndSpredFreq) * irndHarm

            ;FINAL AMPLITUDE COMPUTATION
            iAmp0 = (i(gkDurSum) * i(gkDenSum))
            if (iAmp0 >= 1) then
            iAmp = iAmp0
            elseif (iAmp0 < 1) then
            iAmp = 1
            endif
            iAmpTot = (1/iAmp) / (irndHarm)

            ;SINE
            aSig oscili iAmpTot, iFreq

            ;PANNING SPREAD FROM CENTER MONO to STEREO
            irndPan = 0.5 + (((rnd(2) - 1) / 2) * i(gkSpreadPan))

            ;SINE PANNING
            aSigOut = aSig * aenv * i(gkSINE) ;apply the envelope
            aL,aR pan2 aSigOut, irndPan

            ;SEND TO INSTRUMENT 50 
            gaL = aL + gaL
            gaR = aR + gaR 

        endin

        ;OUTPUT
        instr 50

            aL = gaL 
            aR = gaR

            aSumL = (aL * gkSINE) * gkOut
            aSumR = (aR * gkSINE) * gkOut

            outs aSumL, aSumR 

            gaL = 0
            gaR = 0

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        f1 0 1024 10 1

        f2 0 1025 20 1 1; Hamming
        f3 0 1025 20 2 1; Hanning
        f4 0 1025 20 3 1; Bartlett
        f5 0 1025 20 7 1; Kaiser
        f6 0 1025 20 6 1; Gaussian

        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 

        i50 0 [60*60*24*7] 
    </CsScore>
</CsoundSynthesizer>
