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

        ;UDO - additive synth opcode
        opcode SynthAddFM, aaaaa, akkkkkkkkk

              aFM, ka1, ka2, ka3, ka4, ka5, kvelocity, kFreq, kFreqShift, kPitchShift  xin           
  
                aSig1 oscili ka1 * kvelocity, (((kFreq * 1) * kPitchShift) + kFreqShift) + aFM   ;FUNDAMENTAL
                aSig2 oscili ka2 * kvelocity, (((kFreq * 2) * kPitchShift) + kFreqShift) + aFM
                aSig3 oscili ka3 * kvelocity, (((kFreq * 3) * kPitchShift) + kFreqShift) + aFM
                aSig4 oscili ka4 * kvelocity, (((kFreq * 4) * kPitchShift) + kFreqShift) + aFM
                aSig5 oscili ka5 * kvelocity, (((kFreq * 5) * kPitchShift) + kFreqShift) + aFM
  
              xout aSig1, aSig2, aSig3, aSig4, aSig5              
        endop


        instr 2 

            gkamp1 chnget "a1"
            gkamp2 chnget "a2"
            gkamp3 chnget "a3"
            gkamp4 chnget "a4"
            gkamp5 chnget "a5"

            gkFreqShift chnget "fs"
            gkPitchShift chnget "ps"

            gkFMdevMod chnget "FMdevMod"
            gkFMfreqMod chnget "FMfreqMod"

            gkAtt chnget "att"
            gkDec chnget "dec"
            gkSus chnget "sus"
            gkRel chnget "rel"

        endin


        instr 1

            aEnv madsr i(gkAtt), i(gkDec), i(gkSus), i(gkRel)

            kFreqShift = gkFreqShift
            kPitchShift = gkPitchShift

            aFM oscili gkFMdevMod, gkFMfreqMod

            a1,a2,a3,a4,a5 SynthAddFM aFM, gkamp1,gkamp2,gkamp3,gkamp4,gkamp5, p5, p4 , gkFreqShift, gkPitchShift

            aSumFM = ((a1+a2+a3+a4+a5) / 5 ) * aEnv

            outs aSumFM, aSumFM

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i2 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
