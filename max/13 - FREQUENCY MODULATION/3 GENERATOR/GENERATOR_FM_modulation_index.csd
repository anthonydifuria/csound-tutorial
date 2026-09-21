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

        gkrnd init 1
        gaL init 0
        gaR init 0

        instr 1

            ;controls
            gkDur chnget "dur"
            gkDen chnget "den"
            gkFfond chnget "ffond"
            gkSpreadFreq chnget "spreadfreq"
            gkHarm chnget "harm"
            gkSpreadPan chnget "spreadpan"

            gkModindex chnget "FMindex"
            gkFMmod chnget "FMmod"

            gkOut chnget "out"

            gkFMdev = gkFMmod * gkModindex

            ;instrument 2 call
            ktrig metro  gkDen;density
					
            schedkwhen ktrig,0,0,2,0,gkDur ;calls instrument 2 with density gkDen and duration gkDur	

        endin

        instr 2
    
            ;Gaussian envelope
            aenv poscil3 1, 1/i(gkDur), 2 

            ;Harmonics
            irndHarm = int(rnd(i(gkHarm)))+1 

            ;Frequency spread
            irndSpredFreq = rnd(i(gkSpreadFreq)) - (i(gkSpreadFreq) / 2)

            ;MODULATOR SIGNAL
            aFM_DevMod oscili gkFMdev, gkFMmod

            ;CARRIER SIGNAL                                                        
            aSigFM oscili (1/i(gkDen))*(i(gkDen)/2), (((i(gkFfond) + irndSpredFreq + aFM_DevMod) * irndHarm) ) 

            ; panning spread
            irndPan = 0.5 + (((rnd(2) - 1) / 2) * i(gkSpreadPan))

            ; panning
            aL,aR pan2 aSigFM * aenv, irndPan

            ; output to instrument 50
            gaL = aL + gaL
            gaR = aR + gaR

        endin

        instr 50

            aL = gaL * gkOut
            aR = gaR * gkOut

            outs aL,aR

            gaL = 0
            gaR = 0

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        f1 0 1024 10 1

        f2 0 1025 20 2							; A Gauss bell envelope
        f3 0 1025  7 0 128 1 768 1 120 0 8 0		; A trapezoid envelope
        f4 0 1025  16 0 24 2 1  1000 -5 0	; An Exp envelope  
        f5 0 1025  7 0 16 1 256 0.5 256 0.15 220 0 20 0 ; A dual decay envelope
        f6 0 1025 19 2 1 270 1
        f7 0 1024 7 0.000000 121 0.0515 170 0.1515 134 0.269 90 0.415 77 0.587 77 0.787 84 0.966 29 0.993 38 1.0 31 0.948 36 0.793 19 0.6 27 0.369 29 0.184 36 0.057 27 0.0

        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 

        i50 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
