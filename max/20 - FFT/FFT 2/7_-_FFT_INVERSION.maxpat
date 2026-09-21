{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 2,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60.0,
   80.0,
   900.0,
   470.0
  ],
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      12.0,
      500.0,
      20.0
     ],
     "text": "7 - FFT INVERSION",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      34.0,
      500.0,
      20.0
     ],
     "text": "Max version. Needs the csound7~ external: see README.md in the max folder of the repository",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      64.0,
      640.0,
      20.0
     ],
     "text": "This lesson plays a sound file: 1) click the button and choose a file from the audio folder of the repository, 2) click start.",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "button",
     "patching_rect": [
      20.0,
      90.0,
      24.0,
      24.0
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "comment",
     "patching_rect": [
      50.0,
      92.0,
      260.0,
      20.0
     ],
     "text": "open file 1: 1 Anechoic orchestra.wav",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      122.0,
      80.0,
      22.0
     ],
     "text": "opendialog",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      152.0,
      200.0,
      22.0
     ],
     "text": "prepend diskinfile audiofile1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      200.0,
      200.0,
      20.0
     ],
     "text": "start (after choosing the file)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "comment",
     "patching_rect": [
      320.0,
      200.0,
      60.0,
      20.0
     ],
     "text": "stop",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "message",
     "patching_rect": [
      20.0,
      222.0,
      260.0,
      22.0
     ],
     "text": "event i 1 0 -1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "message",
     "patching_rect": [
      320.0,
      222.0,
      200.0,
      22.0
     ],
     "text": "event i -1 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      270.0,
      260.0,
      22.0
     ],
     "text": "csound7~ 7_-_FFT_INVERSION.csd",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "ezdac~",
     "patching_rect": [
      20.0,
      320.0,
      45.0,
      45.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "comment",
     "patching_rect": [
      300.0,
      270.0,
      400.0,
      20.0
     ],
     "text": "control messages go to the RIGHTMOST inlet (inlet 2)",
     "numinlets": 1,
     "numoutlets": 0
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-6",
      0
     ],
     "source": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-7",
      0
     ],
     "source": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-12",
      2
     ],
     "source": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-12",
      2
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-12",
      2
     ],
     "source": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-13",
      0
     ],
     "source": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-13",
      1
     ],
     "source": [
      "obj-12",
      1
     ]
    }
   }
  ]
 }
}