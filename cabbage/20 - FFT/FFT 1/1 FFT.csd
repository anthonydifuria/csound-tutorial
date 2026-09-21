<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
    -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>
    <CsInstruments>
    ; Initialize the global variables. 
    ksmps = 32
    nchnls = 2
    0dbfs = 1


    instr 1

        ihopsize = 128   ;OVERLAP SIZE
        ifftsize = 1024  ;FFT SIZE 
        iolaps = ifftsize/ihopsize ;OVERLAPS
        ibw = sr/ifftsize ; BIN BANDWIDTH
        kcnt init 0    ;COUNTER
        krow init 0
    
        kOla[] init ifftsize ;BUFFER OVERLAPS
        kIn[] init ifftsize  ;INPUT BUFFER
        kOut[][] init iolaps, ifftsize ;OUTPUTS BUFFER
 
        Sfile     = "../../audio/1 Anechoic orchestra.wav"  ;FILE PATH
        a1, a2 diskin Sfile, 1, 0, 1    ;FILE PLAYER     

        if kcnt >= ihopsize then
    
            ;/-------FFT-------/
            kWin[] window kIn, krow * ihopsize ;WINDOWS FFT
            kSpec[] rfft kWin ;FFT
 
            ;/-------IFFT-------/
            kRow[] rifft kSpec
            kWin window kRow, krow * ihopsize
   
            ;OUT BUFFER
            kOut setrow kWin, krow

            ;BUFFER OVERLAPS
            kOla = 0
            ;ADD OVERLAPS
            ki = 0
            until ki == iolaps do
                kRow getrow kOut, ki
                kOla = kOla + kRow
                ki += 1
            od
  
            ;COUNTER
            krow = (krow + 1) % iolaps ;OVERLAPS COUNTER
            kcnt = 0 ;FFT COUNTER RETURNS TO 0
        endif

        ;WRITE AND READ ONE-DIMENSIONAL BUFFER
        kIn shiftin a1
        a2 shiftout kOla / iolaps
        out a2

        ;FFT COUNTER INCREMENT
        kcnt += ksmps
 
    endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
