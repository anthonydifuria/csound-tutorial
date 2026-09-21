<Cabbage>

    form caption("ADDITIVE ARRAY 1") size(400, 300), guiMode("queue") pluginId("def1")
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

            giTableSize = 512 //WRITE BUFFER LENGTH
            giTableCopy ftgen   0, 0, -giTableSize, 2, 0

            iSR = sr//SAMPLING RATE

            iFN = iSR / giTableSize;//NATURAL FREQUENCY 

            iFX = 300;//FREQUENCY TO COMPUTE
            giIncr = iFX / iFN; //INCREMENT

            iPiGreco = 4 * taninv(1) ;compute Pi

            ;table initialization
            giTable[] init giTableSize

            ;TABLE WRITING
            index = 0;array index
            while index < giTableSize do;loop

                giTable[index] = sin(2 * iPiGreco * index / giTableSize) //WRITING TO TABLE
                index += 1  
        
            od
 
            copya2ftab giTable, giTableCopy;Copy the array into an ftgen table
 
            andx phasor giIncr * iFN; frequency 
            aIncr = int(andx * giTableSize) ;increment

            ares tab aIncr, giTableCopy,0 ;table reading

            outs ares * 0.5, ares * 0.5;output


        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;f1 0 4096 10 1 ;SINE
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
