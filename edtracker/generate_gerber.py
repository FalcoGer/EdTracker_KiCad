#! /bin/python3

# mostly from here:
# https://gist.github.com/aster94/bd52972ab6dbf13a44fc046b4222f7e7

import sys
import pcbnew
import os

def detect_blind_buried_or_micro_vias(pcb):
    through_vias = 0
    micro_vias = 0
    blind_or_buried_vias = 0

    for track in pcb.GetTracks():
        if track.Type() != pcbnew.PCB_VIA_T:
            continue

        if track.GetShape() == pcbnew.VIA_THROUGH:
            through_vias += 1
        elif track.GetShape() == pcbnew.VIA_MICROVIA:
            micro_vias += 1
        elif track.GetShape() == pcbnew.VIA_BLIND_BURIED:
            blind_or_buried_vias += 1

    if micro_vias or blind_or_buried_vias:
        return True
    else:
        return False


def main():
    if len(sys.argv) <= 1 or len(sys.argv) >= 3:
        print("Usage: " + sys.argv[0] + " <project name>")
        exit(1)

    cwd = os.getcwd()
    projectname = sys.argv[1]
    board = pcbnew.LoadBoard(cwd + "/" + projectname + ".kicad_pcb")
    pc = pcbnew.PLOT_CONTROLLER(board)
    po = pc.GetPlotOptions()
    # Set General Options:
    po.SetOutputDirectory(cwd)
    po.SetPlotFrameRef(False)
    po.SetPlotValue(True)
    po.SetPlotReference(True)
    po.SetPlotInvisibleText(True)
    po.SetPlotViaOnMaskLayer(True)
    po.SetExcludeEdgeLayer(False)
    #po.SetPlotPadsOnSilkLayer(PLOT_PADS_ON_SILK_LAYER)
    #po.SetUseAuxOrigin(PLOT_USE_AUX_ORIGIN)
    po.SetMirror(False)
    #po.SetNegative(PLOT_NEGATIVE)
    #po.SetDrillMarksType(PLOT_DRILL_MARKS_TYPE)
    #po.SetScale(PLOT_SCALE)
    po.SetAutoScale(True)
    #po.SetPlotMode(PLOT_MODE)
    #po.SetLineWidth(pcbnew.FromMM(PLOT_LINE_WIDTH))
    
    # Set Gerber Options
    #po.SetUseGerberAttributes(GERBER_USE_GERBER_ATTRIBUTES)
    #po.SetUseGerberProtelExtensions(GERBER_USE_GERBER_PROTEL_EXTENSIONS)
    #po.SetCreateGerberJobFile(GERBER_CREATE_GERBER_JOB_FILE)
    #po.SetSubtractMaskFromSilk(GERBER_SUBTRACT_MASK_FROM_SILK)
    #po.SetIncludeGerberNetlistInfo(GERBER_INCLUDE_GERBER_NETLIST_INFO)
    
    # plot layers

    dict_layerInfo = ({
        "F_Cu": pcbnew.F_Cu,
        "F_Mask": pcbnew.F_Mask,
        "F_Paste": pcbnew.F_Paste,
        "F_SilkS": pcbnew.F_SilkS,
        "B_Cu": pcbnew.B_Cu,
        "B_Mask": pcbnew.B_Mask,
        "B_Paste": pcbnew.B_Paste,
        "B_SilkS": pcbnew.B_SilkS,
        "Edge_Cuts": pcbnew.Edge_Cuts,
        "Eco1_User": pcbnew.Eco1_User,
        "Eco2_User": pcbnew.Eco2_User
    })
    
    for key in dict_layerInfo :
        val = dict_layerInfo[key]
        pc.SetLayer(val)
        sheetDesc = key
        if val not in [ pcbnew.Edge_Cuts, pcbnew.Eco1_User, pcbnew.Eco2_User ]:
            sheetDesc = sheetDesc.replace("F_", "Front ").replace("B_", "Back ") + " Layer"
        pc.OpenPlotfile(key, pcbnew.PLOT_FORMAT_GERBER, sheetDesc)
        pc.PlotLayer()
        pc.ClosePlot()
    
    # generate drill file
    # options:
    METRIC = True
    ZERO_FORMAT = pcbnew.GENDRILL_WRITER_BASE.DECIMAL_FORMAT
    INTEGER_DIGITS = 3
    MANTISSA_DIGITS = 3
    MIRROR_Y_AXIS = False
    HEADER = True
    OFFSET = pcbnew.wxPoint(0,0)
    MERGE_PTH_NPTH = False
    DRILL_FILE = True
    MAP_FILE = False
    REPORTER = None

    drill_writer = pcbnew.EXCELLON_WRITER(board)
    drill_writer.SetFormat(METRIC, ZERO_FORMAT, INTEGER_DIGITS, MANTISSA_DIGITS)
    drill_writer.SetOptions(MIRROR_Y_AXIS, HEADER, OFFSET, MERGE_PTH_NPTH)
    drill_writer.CreateDrillandMapFilesSet(cwd, DRILL_FILE, MAP_FILE, REPORTER)


main()
