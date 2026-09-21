# Max version

The Max patches run the same Csound code as the Cabbage version through **`csound7~`**, a Max external that embeds Csound 7 (statically linked, no separate Csound install needed).

## Before you start: get the external

The patches will not work without `csound7~`. It is **not** included in this repository. Get it from:

- <https://github.com/anthonydifuria/csound7-max>

Download the file for your system (`csound7~.mxo` for macOS, `csound7~.mxe64` for Windows) from the *Releases* page of that repository, or build it yourself by following its `README.md`.

Then put it where Max can find it: next to the patches, or in a package/folder listed in Max's *File Preferences* (for example `~/Documents/Max 9/Packages/`). On macOS you may also need to ad-hoc sign it or remove the quarantine flag.

For the message protocol and details, see the [`csound7~` manual](https://github.com/anthonydifuria/csound7-max/blob/main/MANUAL.md).

## How the lessons are organised

`max/` mirrors [`cabbage/`](../cabbage): one folder per lesson, and for every Cabbage example one `.csd` + one `.maxpat` with the same name (spaces in file names became `_`, because `csound7~` takes the file name as an object argument). The `.csd` is the Cabbage code with the `<Cabbage>` block removed: every widget is now a control in the patch (`live.dial`, `live.slider`, `live.toggle`, `umenu`, ...) that sends `<channel> <value>` to `csound7~`, and the code reads it with `chnget` (in Cabbage it was `cabbageGetValue`).

1. Copy `csound7~` where Max can find it (see above) and open a `.maxpat` file.
2. Turn audio on with the **`ezdac~`** button. Controls talk to Csound; the keyboard examples use a `kslider` (or send the same messages from `midiin`).
3. Examples that play a sound file (lessons 18, 20, 21) have an **open file** button: click it, pick a file from the [`audio/`](../audio) folder, then click **start** (and **stop** when you are done). The granulator examples (lesson 14) have their own *open file* button.
4. Examples that use live input (lessons 10 and 15) have an `ezadc~` connected: use headphones.

Notes:

- The `.csd` must stay next to its `.maxpat`.
- In Max the control inlet of `csound7~` is the **rightmost** one (in Pd it is the leftmost).
- Values that Csound sends back to the interface (`outvalue`) are shown in number boxes or moved on the dials.
- The waveform displays of lessons 5 and 11 are drawn with `scope~` on the left output channel.
- A few lessons only print in the Max console (variables, arrays, UDO): open the Max Console to see the output.
- `csound7~` forces the host sample rate: examples about sample rate (lesson 6) behave according to Max's current rate.
