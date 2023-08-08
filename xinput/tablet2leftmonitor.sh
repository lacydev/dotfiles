#! /usr/bin/env fish

xinput set-prop "HUION PenTablet Pen Pen (0)" --type=float "Coordinate Transformation Matrix" (math "256/448") 0 0 0 1 0 0 0 1
