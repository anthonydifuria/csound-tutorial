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

seed 0

gaL init 0
gaR init 0

opcode VOCODER_MCADAMS, a, aakkkkkii
    aSigCar, aSigMod, kFreq, kBand, kFollow,kA_mcadams, kK_mcadams, iPartials, icnt  xin     
                                 
         icnt  =  icnt + 1 
            
         ;McAdams - F = Fo * n^a + k       
         kFreqMcAdams = kFreq * icnt^ kA_mcadams + kK_mcadams;CENTER FREQUENCY with McAdams   
         
                                                                     
         aSigModOut butbp aSigMod, kFreqMcAdams, kBand;MODULATOR
              
         aEnv follow2 aSigModOut , kFollow , kFollow;MODULATOR ENV FOLLOWER
            
         aSigCarOut butbp aSigCar, kFreqMcAdams, kBand;CARRIER
         
         aOut = aSigCarOut * aEnv ;MODULATION                  
 
         amix init 0                                        
 
         if icnt < iPartials then 
             
             ;will call itself as many times as the number of partials
             ;it means we will have iPartials filters in parallel at the same time
             ;a filter bank                      
             amix VOCODER_MCADAMS aSigCar, aSigMod, kFreq, kBand, kFollow,kA_mcadams, kK_mcadams, iPartials, icnt
             
              
         endif                                                   
                                                  
     xout amix + aOut
     
endop

instr 2
gkmaster chnget "master"
endin

instr 1

    SaudioIn1 chnget "audiofile1"
    aMod diskin2 SaudioIn1, 1, 0, 1;MODULATOR SIGNAL
    ;aMod inch 1

    kFreq = p4 *2; frequency via keyboard
    kBand = 5; bandwidth  - band-pass filter
    iPartials = 20; number of filters i(gkPartias)
    kA_mcadams = 1; McAdams a
    kK_mcadams = 0;McAdams k
    
    icnt init 0; counter initialization for the filter bank computation
        
    kFollow = 0.01;Attack and decay of the vocoder env follower
   
    aCar vco2 p5, p4;CARRIER
    ;aCar inch 2 
                                               
    aOut VOCODER_MCADAMS aCar ,aMod, kFreq, kBand, kFollow,kA_mcadams, kK_mcadams, iPartials, icnt
    
    aEnv madsr 0.01, 0.01,0.5, 0.1;envelope of the resulting sound

    kResizeAmp = 200 / kBand ;recompute amplitude proportional to the filter bandwidth

    aL,aR pan2 (aEnv * aOut) * kResizeAmp, rnd(1);L-R panning


    gaL = aL + gaL
    gaR = aR + gaR

  
endin

instr 50

 aL = gaL
 aR = gaR

 outs aL * gkmaster,aR * gkmaster 
 
 gaL = 0
 gaR = 0

endin



</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
; (started from the patch) i 2 0 [60*60*24*7]
; (started from the patch) i 50 0 [60*60*24*7]

</CsScore>
</CsoundSynthesizer>
