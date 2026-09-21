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
        gkGliss init 0.25

        gkX init 0.5
        gkY init 0.5

        gaL init 0
        gaR init 0

        gaAML init 0
        gaAMR init 0

        gaFML init 0
        gaFMR init 0

        gaGLISSL init 0
        gaGLISSR init 0

        instr 1;controls and instrument 2 call

            ;FUNDAMENTAL CONTROLS
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

            gkNum chnget "num"
            gkDeno chnget "deno"
            gkGeo chnget "geo"
            gkSpazioFreqGeo chnget "spazioFreqGeo"

            ;AM and FM
            gkfreqModAM chnget "freqModAM"
            gkfreqDevFM chnget "freqDevFM"
            gkfreqModFM chnget "freqModFM"

            ;OUTPUTS
            gkSpreadPan chnget "spreadpan"

            gkSINE chnget "sine"
            gkAMamp chnget "amAmp"
            gkFMamp chnget "fmAmp"
            gkGliss chnget "gliss"

            gkRoom chnget "room"
            gkRev chnget "rev"
            gkOut chnget "out"

            ;PAD
            kONpad chnget "onPAD"
            kX chnget "x"
            kY chnget "y"

            ;VOICE
            gkVoce chnget "voce"

            ;FUNCTION ARRAY
            giFunc[] fillarray 3, 4, 6

            ;DENS RAND and DUR RAND
            kDurRand random -1 * (gkDur * 0.5), (gkDur * 0.5)
            gkDurSum = gkDur + (kDurRand * gkDurRand)

            kDenRand randomh -gkDen * 0.5, gkDen * 0.5, 50
            gkDenSum = gkDen + (kDenRand * gkDenRand)
            ;printk2 gkDurSum

            ;INSTRUMENT 2, 3 and 4 CALL
            ktrig metro  gkDenSum;density
            schedkwhen ktrig,0,0,2,0,gkDurSum ;calls instrument 2 with density gkDen and duration gkDur

            ;PAD
            if (kONpad == 0) then

            gkSine = 1
            gkAM = 1
            gkFM = 1
            gkGLISS_PAD = 1

            elseif (kONpad == 1) then

            gkSine = (1 - kX) * (kY)
            gkAM = (kX) * (kY)
            gkFM = (kX) * (1 - kY)
            gkGLISS_PAD = (1 - kX) * (1 - kY)

            endif

        endin



        ;INSTRUMENT
        instr 2
        print 4*taninv(1.0)

            ;ENVELOPE
            aenv poscil3 1, 1/i(gkDurSum), giFunc[chnget:i("func")-1]

            ;ADDITIVE
            ;HARMONIC SERIES
            irndHarm = (int(rnd(i(gkHarm))) * i(gkSpazioFreqArm)) + 1 

            ;GEOMETRIC SERIES
            iRatio = i(gkNum) / i(gkDeno)
            irndGeo = 1 * iRatio^(int(rnd(i(gkGeo))) * i(gkSpazioFreqGeo))

            ;FREQUENCY SPREAD
            irndSpredFreq = rnd(i(gkSpreadFreq)) - (i(gkSpreadFreq) / 2)

            ;FREQUENCY COMPUTATION
            iFreq = (i(gkFfond) * irndHarm * irndGeo)  + irndSpredFreq 

            ;AMPLITUDE COMPUTATION
            iAmp0 = (i(gkDurSum) * i(gkDenSum))
            if (iAmp0 >= 1) then
            iAmp = iAmp0
            elseif (iAmp0 < 1) then
            iAmp = 1
            endif

            iAmpTot = (1/iAmp) / (irndHarm)

            ;SINE
            aSig oscili iAmpTot, iFreq
            aSig2 oscili iAmpTot * i(gkVoce), iFreq * 2

            ;AMPLITUDE MODULATION
            aModAmp oscili 1,i(gkfreqModAM)
            aSigAM oscili iAmpTot * aModAmp, iFreq
            aSigAM2 oscili iAmpTot * aModAmp * i(gkVoce), iFreq * 2


            ;FREQUENCY MODULATION
            aFreqDEV oscili i(gkfreqDevFM), i(gkfreqModFM)
            aSigFM oscili iAmpTot, iFreq + aFreqDEV
            aSigFM2 oscili iAmpTot * i(gkVoce), (iFreq + aFreqDEV) * 2

            ;GLISSANDO
            ;FREQUENCY COMPUTATION
            iRndGliss = rnd(40) - 20
            aGliss linseg 0, i(gkDurSum), iRndGliss
            iFreqGliss = (i(gkFfond) * irndHarm * irndGeo)  + irndSpredFreq 
            aSigGliss oscili iAmpTot, iFreqGliss + (aGliss * irndHarm * irndGeo)
            aSig2Gliss oscili iAmpTot * i(gkVoce), iFreqGliss * 2

            ;PANNING SPREAD
            irndPan = 0.5 + (((rnd(2) - 1) / 2) * i(gkSpreadPan))

            ;SINE PANNING
            aL,aR pan2 (aSig + aSig2)  * (i(gkSine)) * aenv, irndPan

            ;AM PANNING
            aAML,aAMR pan2 (aSigAM + aSigAM2) * (i(gkAM)) * aenv, irndPan

            ;FM PANNING
            aFML,aFMR pan2 (aSigFM + aSigFM2)  * (i(gkFM)) * aenv, irndPan

            ;AM-FM PANNING
            aGLISSL,aGLISSR pan2 (aSigGliss + aSig2Gliss) * (i(gkGLISS_PAD)) * aenv, irndPan

            ;SEND TO INSTRUMENT 50 - SINE
            gaL = aL + gaL
            gaR = aR + gaR 

            ;SEND TO INSTRUMENT 50 - AM
            gaAML = aAML + gaAML
            gaAMR = aAMR + gaAMR

            ;SEND TO INSTRUMENT 50 - FM
            gaFML = aFML + gaFML  
            gaFMR = aFMR + gaFMR

            ;SEND TO INSTRUMENT 50 - GLISS
            gaGLISSL = aGLISSL + gaGLISSL
            gaGLISSR = aGLISSR + gaGLISSR

        endin




        ;OUTPUT and REV
        instr 50

            aL = gaL 
            aR = gaR

            aAML = gaAML 
            aAMR = gaAMR

            aFML = gaFML 
            aFMR = gaFMR

            aGLISSL = gaGLISSL 
            aGLISSR = gaGLISSR 


            aSumREV_L = (aL * gkSINE) + (aAML * gkAMamp) + (aFML * gkFMamp) + (aGLISSL * gkGliss)
            aSumREV_R = (aR * gkSINE) + (aAMR * gkAMamp) + (aFMR * gkFMamp) + (aGLISSR * gkGliss)

            aRevL, aRevR freeverb aSumREV_L, aSumREV_R, gkRoom, 0.5

            aSumL = (((aL * gkSINE) + (aAML * gkAMamp) + (aFML * gkFMamp) + (aGLISSL * gkGliss)) * gkOut) + (aRevL * gkRev) 
            aSumR = (((aR * gkSINE) + (aAMR * gkAMamp) + (aFMR * gkFMamp) + (aGLISSR * gkGliss)) * gkOut) + (aRevR * gkRev) 

            outs aSumL, aSumR 

            gaL = 0
            gaR = 0

            gaAML = 0
            gaAMR = 0

            gaFML = 0
            gaFMR = 0

            gaGLISSL = 0
            gaGLISSR = 0

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
