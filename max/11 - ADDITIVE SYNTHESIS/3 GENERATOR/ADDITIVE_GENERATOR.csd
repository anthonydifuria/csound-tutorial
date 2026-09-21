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
        gkOut chnget "out"

        ;instrument 2 call
        ktrig metro  gkDen;density
					
        schedkwhen ktrig,0,0,2,0,gkDur ;calls instrument 2 with density gkDen and duration gkDur	

        endin


        instr 2

        ;Gaussian envelope
        aenv poscil3 1, 1/i(gkDur), 2 

        ;ADDITIVE

        ;Harmonics
        irndHarm = int(rnd(i(gkHarm)))+1 

        ;frequency spread
        irndSpredFreq = rnd(i(gkSpreadFreq)) - (i(gkSpreadFreq) / 2)

        ;oscillator
        iAmp = (1/i(gkDen))*(i(gkDen)/2) ;computes the amplitude with respect to the duration and density of the sound events
        iFreq = (i(gkFfond) * irndHarm)  + irndSpredFreq ;computes the frequency
        aSig oscili iAmp, iFreq; oscillator

        ; panning spread
        irndPan = 0.5 + (((rnd(2) - 1) / 2) * i(gkSpreadPan))

        ; panning
        aL,aR pan2 aSig * aenv, irndPan

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

        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 

        i50 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
