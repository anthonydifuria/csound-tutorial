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

            kDryWet chnget "drywet";drywet master

            kTimeDelay0  chnget "time" ;delay time in ms
            kTimeDelayPort portk kTimeDelay0, 0.1 ;value porting
            aTimeDelay interp kTimeDelayPort ;interpolation

            kFeedBack  chnget "feedback" ;feedback

            ;init feedback 
            aFeedBackL init 0
            aFeedBackR init 0

            aL inch 1 ;left
            aR inch 2 ;right

            aDelayL  vdelay aL + (aFeedBackL * kFeedBack), aTimeDelay, 2000 
            aDelayR  vdelay aR + (aFeedBackR * kFeedBack), aTimeDelay, 2000 

            aFeedBackL = aDelayL
            aFeedBackR = aDelayR

            aOutL = (aDelayL * kDryWet) + (aL * (1 - kDryWet))
            aOutR = (aDelayR * kDryWet) + (aR * (1 - kDryWet))
     
            outs aOutL, aOutR

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
