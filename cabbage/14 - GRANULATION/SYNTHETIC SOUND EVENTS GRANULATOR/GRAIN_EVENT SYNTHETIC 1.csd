<Cabbage> bounds(0, 0, 0, 0)
    form caption("SYNTHETIC GRANULATOR 1") size(620, 320), guiMode("queue") pluginId("def1") colour("40,40,40,255")

    groupbox bounds(4, 6, 613, 99) channel("PARAMETRI FONDAMENTALI") text("FUNDAMENTAL PARAMETERS")
    ;Duration and Density
    rslider bounds(9, 25, 63, 60), channel("dur"), range(2, 1000, 200, 1, 1), text("DUR")
    rslider bounds(159, 25, 63, 60), channel("den"), range(1, 100, 50, 1, 0.01), text("DEN")
    rslider bounds(78, 25, 63, 60) channel("durRand") range(0, 1, 0, 1, 0.001) text("RAND DUR")
    rslider bounds(227, 25, 63, 60) channel("densRand") range(0, 1, 0, 1, 0.001) text("RAND DENS")

    ;FUNDAMENTAL FREQUENCY
    rslider bounds(310, 25, 74, 60), channel("ffond"), range(20, 1000, 300, 1, 0.01), text("FUND FREQ")
    ;FREQUENCY SPREAD
    rslider bounds(395, 25, 78, 60), channel("spreadfreq"), range(0, 400, 0, 1, 0.01), text("SPREAD FREQ")

    combobox bounds(496, 48, 109, 20) channel("func"), items("Hanning", "Bartlett (Triangle)", "Gaussian")



    groupbox bounds(4, 110, 613, 99) channel("SERIES") text("SERIES")
    ;HARMONIC SERIES
    rslider bounds(18, 136, 65, 60), channel("harm"), range(1, 6, 1, 1, 1), text("HARMONIC")
    rslider bounds(86, 136, 106, 60) channel("spazioFreqArm") range(0, 1, 1, 1, 0.01) text("HARM FREQ SPACING")




    groupbox bounds(4, 212, 613, 99) channel("MIXER") text("MIXER"){
    ;PANNING SPREAD
    rslider bounds(12, 25, 100, 60), channel("spreadpan"), range(0, 1, 1, 1, 0.01), text("SPREAD PAN")

    ;SINE
    rslider bounds(109, 25, 73, 60), channel("sine"), range(0, 0.75, 0.25, 1, 0.01), text("SINE")

    ;OUTPUT
    rslider bounds(526, 25, 73, 60), channel("out"), range(0, 1, 0.25, 1, 0.01), text("OUTPUT")
    }

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>
    
    <CsInstruments>
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
            gkDur0 cabbageGetValue "dur"
            gkDur = gkDur0 * 0.001
            gkDurRand cabbageGetValue "durRand"
            gkDen cabbageGetValue "den"
            gkDenRand cabbageGetValue "densRand"

            gkFfond cabbageGetValue "ffond"
            gkSpreadFreq cabbageGetValue "spreadfreq"

            ;SERIES
            gkHarm cabbageGetValue "harm"
            gkSpazioFreqArm cabbageGetValue "spazioFreqArm"

            ;OUTPUTS
            gkSpreadPan cabbageGetValue "spreadpan"
            gkSINE cabbageGetValue "sine"
            gkOut cabbageGetValue "out"

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
            aenv poscil3 1, 1/i(gkDurSum), giFunc[cabbageGetValue:i("func")-1]

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
