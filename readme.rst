=======
VSD
=======

Contents
~~~~~~~~~~~~~

`Day0`_
    * `Yosys Installation`_
    * `OpenSTA Installation`_
    * `Ngspice Installation`_
    * `Iverilog Installation`_
    * `Gtkwave Installation`_
`Day1`_
    * `Introduction to iverilog design testbench`_
    * `Labs using iverilog and gtkwave`_
    * `Labs using Yosys and Sky130 PDKs`_
`Day2`_
    * `Understanding .lib`_
    * `Hierarchical vs Flat Synthesis`_
    * `Synthesis Simulation`_
    * `Various Flop Coding Styles and optimization`_
`Day3`_
    * `Introduction to Optimization`_
    * `Combinational Logic Optimization`_
    * `Sequential logic optimizations`_
    * `Sequential optimizations for unused outputs`_
`Day4`_
    * `GLS, Synthesis-Simulation mismatch and Blocking/Non-blocking statements`_
    * `GLS`_
    * `Synthesis-Simulation Mismatch`_
    * `Synth-sim mismatch for blocking statement`_
`Day5`_
    * `Incomplete If Case`_
    * `Incomplete overlapping Case`_
    * `For loop and for generate`_

Day0
~~~~~~~~

Yosys Installation
------------

.. code-block:: console

    git clone https://github.com/YosysHQ/yosys.git
    cd yosys
    sudo apt install make
    sudo apt-get install build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev
    make
    sudo make install
    
   
.. image:: /picture/yosys.png
    :width: 500
    
OpenSTA Installation
------------

https://github.com/The-OpenROAD-Project/OpenSTA
    
.. image:: /picture/opensta.png
    :width: 500

Ngspice Installation
------------

| Download tarball from https://sourceforge.net/projects/ngspice/files/

.. code-block:: console

    tar -zxvf ngspice-37.tar.gz
    cd ngspice-37
    mkdir release
    cd release
    ../configure  --with-x --with-readline=yes --disable-debug
    make
    sudo make install

.. image:: /picture/ngspice.jpg
    :width: 500
    
    
Iverilog Installation
------------
.. code-block:: console

    sudo apt-get install iverilog
    
Gtkwave Installation
------------
  
.. code-block:: console

    sudo apt install gtkwave
    
    
Day1
~~~~~~~~~~~~

Introduction to iverilog design testbench
------------

| Simulator - Tools check for design (RTL)
| Design - Verilog code which has the intend functionality to the specification
| Testbench - Setup to apply stimulus to the design to check its functionality

| Iverilog Flow
| The verilog will process the design and testbench and dump it to vcd file. This file will be use for generate waveforms

.. image:: /picture/day1_intro_1.jpg
    :width: 500

Labs using iverilog and gtkwave
------------

.. code-block:: console

    iverilog good_mux.v tb_good_mux.v
    ./a.out
    gtkwave tb_good_mux.vcd
    
.. image:: /picture/day1_iverilog_1.jpg
    :width: 500
  
Labs using Yosys and Sky130 PDKs
------------

| synthesizer is used to convert behavioral design RTL to a netlist which is gate level connection using technology library. Same testbench can be use in the netlist file.
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_files/good_mux.v
    synth -top good_mux 
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day1_yosys_4.jpg
    :width: 300
    
.. image:: /picture/day1_yosys_3.jpg
    :width: 300
   

.. code-block:: console

    show good_mux
    
.. image:: /picture/day1_yosys_2.jpg
    :width: 500

Day2
~~~~~~~~~~~~

Understanding .lib
------------

Library name: sky130_fd_sc_hd__tt_025C_1v80

* tt - Typical process from (slow, fast , typical)
* 025C - Temperature
* 1V80 - Voltage

Hierarchical vs Flat Synthesis
------------

| Hierarchical
| Hierarchical design is a design which will consist the submodule

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_files/multiple_modules.v
    synth -top multiple_modules
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    show multiple_modules
    
.. image:: /picture/day2_yosys_1.jpg
    :width: 300
   
.. image:: /picture/day2_yosys_3.jpg
    :width: 300
 
.. image:: /picture/day2_yosys_2.jpg
    :width: 400
   
.. image:: /picture/day2_yosys_4.jpg
    :width: 400
   
.. image:: /picture/day2_yosys_5.jpg
    :width: 400
    
| Flat
| Flat design is a design that will break the submodule and combine it become a module that without submodule

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_files/multiple_modules.v
    synth -top multiple_modules
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    flatten
    show multiple_modules
    
.. image:: /picture/day2_yosys_7.jpg
    :width: 800
    
| Flat VS Hierarchical
| Figure below showing that the difference between flat and hierarchical. 
.. image:: /picture/day2_yosys_6.jpg
    :width: 400
    
    
Synthesis Simulation
------------

Flops are used to eliminate the possible glitches generated by the different propagation delays of the signals in the combinational circuits. So, even the input of the flop will be glitchy the output will be stable.

Asynchronous

.. code-block:: console

    iverilog dff_asyncres.v tb_dff_asyncres.v
    ./a.out
    gtkwave tb_dff_asyncres.vcd
    
.. image:: /picture/day2_synthesis_1.jpg
    :width: 600
    
Asynchronous set

.. code-block:: console

    iverilog dff_async_set.v tb_dff_async_set.v
    ./a.out
    gtkwave tb_dff_async_set.vcd
    
.. image:: /picture/day2_synthesis_2.jpg
    :width: 600
    
Synchronous

.. code-block:: console

    verilog dff_syncres.v tb_dff_syncres.v 
    ./a.out 
    gtkwave tb_dff_syncres.vcd
    
.. image:: /picture/day2_synthesis_3.jpg
    :width: 600
    
Various Flop Coding Styles and optimization
------------
mult2

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_files/mult_2.v 
    synth -top mul2 
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    show

.. image:: /picture/day2_opt_1.jpg
    :width: 400
    
.. image:: /picture/day2_opt_2.jpg
    :width: 400
    
.. image:: /picture/day2_opt_3.jpg
    :width: 400
    
mult8

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_files/mult_8.v 
    synth -top mult8
    show
    
.. image:: /picture/day2_opt_5.jpg
    :width: 400
    
.. image:: /picture/day2_opt_4.jpg
    :width: 400
    
Day3
~~~~~~~~~~~~
Introduction to Optimization
------------

| **Combinational logic optimizations**
| Squeez the logic to get the most optimized design (area & power)
| Method used: constant propagation (direct optimization), boolean logic optimization
| Constant propagation example

.. image:: /picture/day3_combination_4.jpg
    :width: 400
    
| Boolean logic example

.. image:: /picture/day3_combination_5.jpg
    :width: 400
    
.. image:: /picture/day3_combination_6.jpg
    :width: 400
    
| **Sequential logic optimizations**
| Basic: Sequential constant propagation
| Advance: state optimisation, retiming, sequential logic cloning
| state optimisation example
| cloning
| when the flops are far away, flop a can be doubled to eliminate the delay

.. image:: /picture/day3_combination_7.jpg
    :width: 400
    
| Retiming
| Retiming is a technique for optimizing sequential circuits. It repositions the registers in a circuit leaving the combinational portion of circuitry untouched. The central objective of retiming is to find a circuit with the minimum number of registers for a specified clock period.

Combinational Logic Optimization
------------

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/opt_check.v
    synth -top opt_check
    opt_clean -purge
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day3_combination_1.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/opt_check2.v
    synth -top opt_check2
    opt_clean -purge
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day3_combination_2.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/opt_check3.v
    synth -top opt_check3
    opt_clean -purge
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

.. image:: /picture/day3_combination_3.jpg
    :width: 400

Sequential logic optimizations
------------

| The output will go 1 when the reset is 0 as the output will go 0 when reset is 1.
.. code-block:: console

    iverilog dff_const1.v tb_dff_const1.v
    ./a.out
    gtkwave tb_dff_const1.vcd

.. image:: /picture/day3_sequential_1.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/dff_const1.v
    synth -top dff_const1
    dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day3_sequential_3.jpg
    :width: 400
    
| The output will always 1 as the output will go 1 when the reset is 1.
.. code-block:: console

    iverilog dff_const2.v tb_dff_const2.v
    ./a.out
    gtkwave tb_dff_const2.vcd

.. image:: /picture/day3_sequential_2.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/dff_const2.v
    synth -top dff_const2
    dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day3_sequential_4.jpg
    :width: 400
    
| dff_const3
.. code-block:: console

    iverilog dff_const3.v tb_dff_const3.v
    ./a.out
    gtkwave tb_dff_const3.vcd

.. image:: /picture/day3_sequential_5.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/dff_const3.v
    synth -top dff_const3
    dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day3_sequential_6.jpg
    :width: 400
    
Sequential optimizations for unused outputs
------------

| q is affected just by count[0] so the circuit will be simple.

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/counter_opt.v
    synth -top counter_opt
    dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day3_sequential_10.jpg
    :width: 400
.. image:: /picture/day3_sequential_7.jpg
    :width: 400
    
| when the counter is replace to 3 bit the circuit will contain 3 flop

.. image:: /picture/day3_sequential_9.jpg
    :width: 400
.. image:: /picture/day3_sequential_8.jpg
    :width: 400
    
Day4
~~~~~~~~~
GLS, Synthesis-Simulation mismatch and Blocking/Non-blocking statements
------------

| GLS(Gate Level Simulation)
* Verify the logic correctness of design after synthesis
* Ensure timing of the design is met

| GLS using iverilog
.. image:: /picture/day4_GLS_1.jpg
    :width: 400
    
| Synthesis-Simulation mismatch
* Missing sensitivity list
* Blocking vs non-blocking Assignment
* Non standard verilog coding

| **Blocking/Non-blocking statements**
| Blocking (=)
* Execute statement in order
| Non blocking (<=)
* Execute in parallel

GLS
------------

| if sel is True then output will be i1 else i0
.. image:: /picture/day4_GLS_3.jpg
    :width: 400
.. image:: /picture/day4_GLS_2.jpg
    :width: 400

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/ternary_operator_mux.v
    synth -top ternary_operator_mux
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day4_GLS_4.jpg
    :width: 400
    
| To do GLS involve iverilog
.. code-block:: console

   iverilog ../my_lib/verilog_model/primitives.v  ../my_lib/verilog_model/sky130_fd_sc_hd.v ternary_operator_mux_net.v tb_ternary_operator_mux.v
   ./a.out
   gtkwave tb_ternary_operator_mux.vcd
   
.. image:: /picture/day4_GLS_5.jpg
    :width: 400
    
Synthesis-Simulation Mismatch
-----------------
| when the sel is active high there is no change on the output when i1 is change in the path of duration, this is due to the  missing sensitivity list

.. image:: /picture/day4_GLS_6.jpg
    :width: 400
.. image:: /picture/day4_GLS_7.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/bad_mux.v
    synth -top bad_mux
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    write_verilog -noattr bad_mux_net.v
    
    verilog ../my_lib/verilog_model/primitives.v  ../my_lib/verilog_model/sky130_fd_sc_hd.v bad_mux_net.v tb_bad_mux.v
    ./a.out
    gtkwave tb_ternary_operator_mux.vcd
.. image:: /picture/day4_GLS_9.jpg
    :width: 400
    
Synth-sim mismatch for blocking statement
------------

| Supposely when A is high X will be high and D will high. However, due to the blocking statement and the according of the code there is mistake happened which the code will execute first line which is **d = x & c** first only execute **x = a | b**. This is happen due to the x is evaluate the previous condition.

.. code-block:: console

    iverilog blocking_caveat.v tb_blocking_caveat.v
    ./a.out
    gtkwave tb_blocking_caveat.vcd
    
.. image:: /picture/day4_caveat_1.jpg
    :width: 400
.. image:: /picture/day4_caveat_2.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/blocking_caveat.v
    synth -top blocking_caveat
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    write_verilog -noattr blocking_caveat_net.v
    
.. image:: /picture/day4_caveat_3.jpg
    :width: 400
    
.. code-block:: console

    verilog ../my_lib/verilog_model/primitives.v  ../my_lib/verilog_model/sky130_fd_sc_hd.v blocking_caveat_net.v tb_blocking_caveat.v
    ./a.out
    gtkwave tb_blocking_caveat.vcd

.. image:: /picture/day4_caveat_4.jpg
    :width: 400
    
Day5
~~~~~~~~~~
Incomplete If Case
------------
| The RTL design show that if i0 is active high only that the output will equal to i1. There is no else statement in this rtl coding. When i0 go from high to low, the output will maintain the previous until next active high i0.

.. code-block:: console

    iverilog incomp_if.v tb_incomp_if.v
    ./a.out
    gtkwave tb_incomp_if.vcd
    
.. image:: /picture/day5_if_1.jpg
    :width: 400
.. image:: /picture/day5_if_2.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/incomp_if.v
    synth -top incomp_if
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

.. image:: /picture/day5_if_3.jpg
    :width: 400
    
| There is missing else statement. when i0 is high, the output is i1, when i2 is high the output is i3. When i0 and i2 are low, the output will be constant.

.. code-block:: console

    iverilog incomp_if2.v tb_incomp_if2.v
    ./a.out
    gtkwave tb_incomp_if2.vcd
    
.. image:: /picture/day5_if_4.jpg
    :width: 400
.. image:: /picture/day5_if_5.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/incomp_if2.v
    synth -top incomp_if2
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day5_if_6.jpg
    :width: 400
    
    
Incomplete overlapping Case
------------
| **incomplete case**
| The case statement do not have a default statement. When sel=0 y=i0, when sel=1 y=i1. However when the sel=2 or 3, the output will be constant.
.. code-block:: console

    iverilog incomp_case.v tb_incomp_case.v
    ./a.out
    gtkwave tb_incomp_case.vcd
    
.. image:: /picture/day5_case_1.jpg
    :width: 400
.. image:: /picture/day5_case_2.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/incomp_case.v
    synth -top incomp_case
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day5_case_3.jpg
    :width: 400
    
| **complete case**
.. code-block:: console

    iverilog comp_case.v tb_comp_case.v
    ./a.out
    gtkwave tb_comp_case.vcd
    
.. image:: /picture/day5_case_4.jpg
    :width: 400
.. image:: /picture/day5_case_5.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/comp_case.v
    synth -top comp_case
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day5_case_6.jpg
    :width: 400

| **Partial case**
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/partial_case_assign.v
    synth -top partial_case_assign
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day5_case_7.jpg
    :width: 400
.. image:: /picture/day5_case_8.jpg
    :width: 400

| **Bad case**
| when sel = 2 or 3 the case "2'b1? will be execute
.. image:: /picture/day5_case_9.jpg
    :width: 400
.. image:: /picture/day5_case_10.jpg
    :width: 400
    
.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/bad_case_assign.v
    synth -top bad_case
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    
.. image:: /picture/day5_case_11.jpg
    :width: 400

For loop and for generate
------------
| For loop
* Use inside always block
* Evaluating expression
| Generate for loop
* Use outside always block
* Instantiate hardware multiple times

**For**

.. code-block:: console

    iverilog mux_generate.v tb_mux_generate.v
    ./a.out
    gtkwave tb_mux_generate.vcd
    
.. image:: /picture/day5_for_1.jpg
    :width: 400
.. image:: /picture/day5_for_2.jpg
    :width: 400
    
| when the sel is changing from 0 to 7 the output will be go from o1 to o7

.. code-block:: console

    iverilog demux_generate.v tb_demux_generate.v
    ./a.out
    gtkwave tb_demux_generate.vcd
    
.. image:: /picture/day5_for_4.jpg
    :width: 400
.. image:: /picture/day5_for_5.jpg
    :width: 400

**For Generate**

.. code-block:: console

    iverilog rca.v fa.v tb_rca.v
    ./a.out
    gtkwave tb_rca.vcd
    
.. image:: /picture/day5_for_6.jpg
    :width: 400
.. image:: /picture/day5_for_7.jpg
    :width: 400

GLS

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_file/rca.v verilog_file/fa.v
    synth -top rca
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    write_verilog verilog_file/rca_net.v
    
    iverilog ../my_lib/verilog_model/primitives.v  ../my_lib/verilog_model/sky130_fd_sc_hd.v rca_net.v tb_rca.v
    ./a.out
    gtkwave tb_rca.vcd
    
.. image:: /picture/day5_for_8.jpg
    :width: 400
