hole_diameter = 0.5 %mm
trace_width = 10 %mm
safety_margin = 1.30 %30 percent of safety margin
copper_thickness = 0.035 %%mm
trace_area = trace_width * copper_thickness

number_of_vias_needed = (trace_area / ((hole_diameter / 2)^2 * pi)) * safety_margin
number_of_vias_needed