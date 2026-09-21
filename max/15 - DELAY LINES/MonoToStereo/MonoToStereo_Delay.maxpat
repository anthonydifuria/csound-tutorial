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
   468.0
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
     "text": "MonoToStereo_Delay",
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
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      98.0,
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
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "gain",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "Gain",
       "parameter_type": 0
      }
     },
     "varname": "gain"
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend gain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      268.0,
      260.0,
      22.0
     ],
     "text": "csound7~ MonoToStereo_Delay.csd",
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
     "id": "obj-7",
     "maxclass": "ezadc~",
     "patching_rect": [
      320.0,
      208.0,
      45.0,
      45.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "comment",
     "patching_rect": [
      370.0,
      218.0,
      200.0,
      20.0
     ],
     "text": "live input (use headphones)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "ezdac~",
     "patching_rect": [
      20.0,
      318.0,
      45.0,
      45.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "comment",
     "patching_rect": [
      300.0,
      268.0,
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
      "obj-3",
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
      "obj-5",
      0
     ],
     "source": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-6",
      2
     ],
     "source": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-6",
      0
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
      "obj-6",
      1
     ],
     "source": [
      "obj-7",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-9",
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
      "obj-9",
      1
     ],
     "source": [
      "obj-6",
      1
     ]
    }
   }
  ]
 }
}