Radix-2 4-Bit Booth's Multiplier
==============

Contents
~~~~~~~~~~~~~

* `Introduction`_
* `Block Diagram & Working Principle`_
* `Pre-Synthesis`_
* `post-Synthesis`_
* `GLS`_
* `STA`_
* `Post Synthesis STA Checks On ss,ff,tt Corner`_
* `Full RTL2GDS Flow`_
    * `Synthesis`_
    * `Floorplanning`_
    * `Placement`_
    * `CTS`_
    * `Routing`_
* `Post placement pre CTS STA checks for your design on ss,ff,tt corners`_
* `Post layout STA checks for your design on ss,ff,tt corners`_

Introduction
~~~~~~~~~~~~~~
Booth's Multiplier is base on Booth's Multiplication algorithm. Booth's multiplication algorithm is a multiplication algorithm that multiplies two signed binary numbers in two's complement notation. The algorithm was invented by Andrew Donald Booth in 1950 while doing research on crystallography at Birkbeck College in Bloomsbury, London. It proposed an efficient way of multiplying two signed binary integers in there 2's complement form such that the number of partial product is reduced which lead to the reduction of number of addition operation requred for generating the final result.

Block Diagram & Working Principle
~~~~~~~~~~~~~~~

.. image:: /project/picture/1.jpg
    :width: 500
    
In the above diagram, we can see that the booth's multiplier is performing iteration of shift, addition adn subtraction operation. Q and M are 4-bit register that store multiplier and multiplicand respectively. MOD-4 counter is used to track of shifting operation. A and Q are 4-bit register. The final result will be a 8-bit register p.

.. image:: /project/picture/2.jpg
    :width: 500

The above diagram are showing the flowchart of the booth's multiplier. Firstly the all the value will be reset to 0. At every posedge clock, the value of Q0 and Q-1 are inspected for determine the operation. where both of the value of Q0 and Q-1 are same, right shift operation will be performed. when Q0 = 0 and Q-1 = 1, addition operation will performed (A=A+M). when Q0 = 1, Q-1 = 0, subtraction operation performed (A=A-M). The program will repeated as many times as the specified bits of booth's multiplier is given.

Pre-Synthesis
~~~~~~~~~~~~~~~

.. code-block:: console

    iverilog iiitb_r2_4bit_bm.v iiitb_r2_4bit_bm_tb.v
    ./a.out
    gtkwave design.vcd
    
.. image:: /project/picture/3.jpg
    :width: 500
    
.. image:: /project/picture/4.jpg
    :width: 500
    
| Initially the M and Q are set to be 4'b1010 and 4'b1011 respectively. 
| The load is set to be 1 in 20ns to load the data from Q and M to Q_temp and M_temp. 
| At 30ns, the first digit of Q_temp is 1 and Q minus is 0, thus option 3 is execute. 

.. image:: /project/picture/5.jpg
    :width: 500
    
At 50ns, the first digit of Q_temp is 1 and Q_minus_one is 1 which both are same value, so option 1 is execute.

.. image:: /project/picture/6.jpg
    :width: 500
    
At 70ns, the first digit of Q_temp is 0 and Q_minus_one is 1 which mean option2 will be execute.

.. image:: /project/picture/7.jpg
    :width: 500
    
All option are tested and work perfectly.

    
post-Synthesis
~~~~~~~~~~~~~~~

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog srv/iiitb_r2_4bit_bm.v 
    hierarchy -check -top iiitb_r2_4bit_bm 
    tribuf
    synth -top iiitb_r2_4bit_bm 
    flatten
    share
    opt
    simplemap
    dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    write_verilog -noattr Netlists/netlist_iiitb_r2_4bit_bmdff.v

    iverilog lib/primitives.v lib/sky130_fd_sc_hd.v netlist/netlist_iiitb_r2_4bit_bm.v srv/iiitb_r2_4bit_bm_tb.v 
    ./a.out
    gtkwave design.vcd

.. image:: /project/picture/10.jpg
    :width: 400
    
.. image:: /project/picture/8.jpg
    :width: 400
    
.. image:: /project/picture/9.jpg
    :width: 400
    
GLS
~~~~~~~~~~~~~

| **fix sky130_fd_sc_hd.v**
| On the behavioral of dfxtp in the sky130_fd_sc_hd.v adding this 2 line will solving the gls problem that did not launch gls correctly

.. image:: /project/picture/13.jpg
    :width: 700
    
    
Compare post and pre synthesize, the output are same

.. image:: /project/picture/12.jpg
    :width: 700
    
STA
~~~~~~~~~~~~~

| sta flow

.. code-block:: console

    sta
    
    OpenSTA> read_liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    OpenSTA> read_verilog Netlists/iiitb_r2_4bit_bm.v
    OpenSTA> link_design iiitb_r2_4bit_bm
    OpenSTA> read_sdc srv/iiitb_r2_4bit_bm.sdc 
    OpenSTA> report_checks

| SDC file 

.. code-block:: console

    create_clock -name clk -period 2.3 [get_ports {clk}]
    set_input_delay -min 0.1 [all_inputs]
    set_input_delay -max 0.4 [all_inputs]
    set_output_delay -min 0.1 [all_outputs]
    set_output_delay -max 0.4 [all_outputs]
    set_clock_transition 0.15 [get_clocks {clk}]
    set_clock_uncertainty 0.25 clk

.. image:: /project/picture/14.jpg
    :width: 700
    
Post Synthesis STA Checks On ss,ff,tt Corner
~~~~~~~~~~~~~~~~~

script

.. code-block:: console
    
    read_liberty lib/all_lib/sky130_fd_sc_hd__ff_100C_1v65.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ff_100C_1v95.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v56.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v65.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v76.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_100C_1v40.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_100C_1v60.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v35.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v40.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v44.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v76.lib
    read_liberty lib/all_lib/sky130_fd_sc_hd__tt_025C_1v80.lib

    read_verilog Netlists/iiitb_r2_4bit_bm.v
    link_design iiitb_r2_4bit_bm
    read_sdc srv/iiitb_r2_4bit_bm.sdc 
    report_checks
    report_worst_slack -digit 4 -max
    report_worst_slack -digit 4 -min
    report_tns -digit 4
    
PVT Corner Summary at 625MHz

.. image:: /project/picture/17.jpg
    :width: 500
    
.. image:: /project/picture/18.jpg



Full RTL2GDS Flow
~~~~~~~~~~~~~~~~~~~~~~~~~~

| Modified config.json file

.. code-block:: console

  {
    "DESIGN_NAME": "iiitb_r2_4bit_bm",
    "VERILOG_FILES": "dir::src/iiitb_r2_4bit_bm.v",
    "CLOCK_PORT": "clk",
    "CLOCK_NET": "clk",
    "FP_CORE_UTIL": 40,
    "pdk::sky130*": {
        "SYNTH_MAX_FANOUT": 6,
        "CLOCK_PERIOD": 5,
        "scl::sky130_fd_sc_hd": {
            "CLOCK_PERIOD": 5,
            "SYNTH_STRATEGY": "DELAY 0"
         }
     },
    
    "LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
    "LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
    "LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
    "LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",
    "TEXT_EXTERNAL_GLOB": "dir::src/*",
    
    "pdk::gf180*": {
        "CLOCK_PERIOD": 5,
        "PL_TARGET_DENSITY": 0.5
    }
 }

| Execute the openlane by using make mount 

.. code-block:: console

  make mount
  
.. image:: /project/picture/19.jpg
    :width: 500

| run the openlane flow using interactive mode 

.. code-block:: console
  
  ./flow.tcl -interactive
  package require openlane 0.9
  
| prepare the our design

.. code-block:: console

  prep -design iiitb_r2_4bit_bm

| merge sky130_vsdinv lef file into merged.nom.lef

.. code-block:: console

  set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
  add_lefs -src $lefs

.. image:: /project/picture/21.jpg
    :width: 500

.. image:: /project/picture/20.jpg
    :width: 500

Synthesis
------------

.. code-block:: console

  run_synthesis

.. image:: /project/picture/22.jpg
    :width: 500

| sky130_vsdinv 

.. image:: /project/picture/23.jpg


Floorplanning
---------------------

.. code-block:: console

  run_floorplan

.. image:: /project/picture/28.jpg
    :width: 500
    
.. image:: /project/picture/24.jpg

Placement
------------

.. code-block:: console

  run_placement

.. image:: /project/picture/29.jpg
    :width: 500
    
.. image:: /project/picture/25.jpg

.. image:: /project/picture/27.jpg

.. image:: /project/picture/26.jpg

CTS
------------

.. code-block:: console

  run_cts

.. image:: /project/picture/30.jpg
    :width: 500
    
.. image:: /project/picture/32.jpg
    :width: 500
    
Routing
---------------

.. code-block:: console

  run_routing

.. image:: /project/picture/31.jpg
    :width: 500

.. image:: /project/picture/33.jpg

.. image:: /project/picture/34.jpg
    :width: 500

Post placement pre CTS STA checks for your design on ss,ff,tt corners
----------

.. code-block:: console

   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_100C_1v65.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_100C_1v95.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v56.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v65.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v76.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_100C_1v40.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_100C_1v60.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v35.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v40.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v44.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v76.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__tt_025C_1v80.lib

   read_verilog placement/iiitb_r2_4bit_bm.nl.v
   link_design iiitb_r2_4bit_bm
   read_sdc srv/iiitb_r2_4bit_bm.sdc
   report_checks
   report_worst_slack -digit 4 -max
   report_worst_slack -digit 4 -min
   report_tns -digit 4

.. image:: /project/picture/35.jpg
    
.. image:: /project/picture/36.jpg
    
Post layout STA checks for your design on ss,ff,tt corners
------------

.. code-block:: console

   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_100C_1v65.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_100C_1v95.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v56.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v65.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ff_n40C_1v76.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_100C_1v40.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_100C_1v60.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v35.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v40.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v44.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__ss_n40C_1v76.lib
   read_liberty lib/all_lib/sky130_fd_sc_hd__tt_025C_1v80.lib

   read_verilog routing/iiitb_r2_4bit_bm.nl.v
   link_design iiitb_r2_4bit_bm
   read_sdc srv/iiitb_r2_4bit_bm.sdc
   report_checks
   report_worst_slack -digit 4 -max
   report_worst_slack -digit 4 -min
   report_tns -digit 4


.. image:: /project/picture/37.jpg
    
.. image:: /project/picture/38.jpg












































