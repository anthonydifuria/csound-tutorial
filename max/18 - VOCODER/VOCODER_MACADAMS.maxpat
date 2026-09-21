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
   820.0
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
     "text": "VOCODER_MACADAMS",
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
     "text": "open file 1: PAROLAI.WAV",
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
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      224.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "master",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "master",
       "parameter_type": 0
      }
     },
     "varname": "master"
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      198.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0.5",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      276.0,
      110.0,
      22.0
     ],
     "text": "prepend master",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      384.0,
      500.0,
      20.0
     ],
     "text": "MIDI keyboard: click the keys (or use a connected MIDI keyboard through midiin)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "kslider",
     "patching_rect": [
      20.0,
      410.0,
      336.0,
      53.0
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      472.0,
      70.0,
      22.0
     ],
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      502.0,
      130.0,
      22.0
     ],
     "text": "prepend midi 144",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      550.0,
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
     "id": "obj-16",
     "maxclass": "comment",
     "patching_rect": [
      320.0,
      550.0,
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
     "id": "obj-17",
     "maxclass": "message",
     "patching_rect": [
      20.0,
      572.0,
      260.0,
      22.0
     ],
     "text": "event i 2 0 -1, event i 50 0 -1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "message",
     "patching_rect": [
      320.0,
      572.0,
      200.0,
      22.0
     ],
     "text": "event i -2 0 0, event i -50 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      620.0,
      260.0,
      22.0
     ],
     "text": "csound7~ VOCODER_MACADAMS.csd",
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
     "id": "obj-20",
     "maxclass": "ezdac~",
     "patching_rect": [
      20.0,
      670.0,
      45.0,
      45.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "comment",
     "patching_rect": [
      300.0,
      620.0,
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
      "obj-8",
      0
     ],
     "source": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-10",
      0
     ],
     "source": [
      "obj-8",
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
   },
   {
    "patchline": {
     "destination": [
      "obj-14",
      0
     ],
     "source": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-19",
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
      "obj-19",
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
      "obj-19",
      2
     ],
     "source": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-19",
      2
     ],
     "source": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-19",
      2
     ],
     "source": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-20",
      0
     ],
     "source": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-20",
      1
     ],
     "source": [
      "obj-19",
      1
     ]
    }
   }
  ]
 }
}