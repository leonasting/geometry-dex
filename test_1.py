# -*- coding: utf-8 -*-
"""
Created on Thu Dec 15 18:30:12 2022

@author: Alvi

To check baseversion
"""

import mujoco as mj
import numpy as np
import matplotlib.cm as cm
import matplotlib.pyplot as plt

if __name__ =="__main__":
    frame_count=100
    cam_val=None
    record=True
    xml_path = "manipulate_a_cups.xml"
    
    model = mj.MjModel.from_xml_path(xml_path)
    data = mj.MjData(model)
    
    cam = mj.MjvCamera()
    opt = mj.MjvOption()
    mj.glfw.glfw.init()
    window = mj.glfw.glfw.create_window(1000, 1000, "Demo", None, None)
    mj.glfw.glfw.make_context_current(window)
    mj.glfw.glfw.swap_interval(1)
    
    mj.mjv_defaultCamera(cam)
    mj.mjv_defaultOption(opt)
    
    
    
    scene = mj.MjvScene(model, maxgeom=10000)
    context = mj.MjrContext(model, mj.mjtFontScale.mjFONTSCALE_150.value)
    
    mj.mj_step(model, data)
    
    counter=0
    dict_record={}
    while not mj.glfw.glfw.window_should_close(window):
        if counter<frame_count:    
            mj.mj_step(model, data)
            if not np.all(data.sensordata==0):
            
                counter+=1
                if record:
                    dict_record[counter]=np.copy(data.sensordata)
                
        viewport = mj.MjrRect(0, 0, 1200, 900)
    
        #mj.mjv_updateScene(model, data, opt, None, cam, 0, scene)
        
        mj.mjv_updateScene(model, data, opt, None, cam, mj.mjtCatBit.mjCAT_ALL.value, scene)
        mj.mjr_render(viewport, scene, context)
    
        mj.glfw.glfw.swap_buffers(window)
        mj.glfw.glfw.poll_events()
    
    mj.glfw.glfw.terminate()
    
    
sum(1 for i in dict_record[50] if i!=0)