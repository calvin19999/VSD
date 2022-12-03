=======
VSD
=======

Contents
 * `Day0`_
 
 * `Day1`_
    * `Labs using iverilog and gtkwave`_
    * `Labs using Yosys and Sky130 PDKs`_
 * `Day2`_
    * `Hierarchical vs Flat Synthesis`_
    * `Synthesis Simulation`_
    * `Various Flop Coding Styles and optimization`_
 * `Day3`_



Day0
----------
| Yosys 
.. image:: /picture/yosys.png
    :width: 500
    
| OpenSTA
.. image:: /picture/opensta.png
    :width: 500

| ngspice
.. image:: /picture/ngspice.jpg
    :width: 500
  
Day1
----------
Labs using iverilog and gtkwave
~~~~~~~~~~~~~~~~~
.. code-block:: console

    iverilog good_mux.v tb_good_mux.v
    ./a.out
    gtkwave tb_good_mux.vcd
    
.. image:: /picture/day1_iverilog_1.jpg
    :width: 500
  
Labs using Yosys and Sky130 PDKs
~~~~~~~~~~
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
----------
Hierarchical vs Flat Synthesis
~~~~~~~~~
Hierarchical

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
    
Flat

.. code-block:: console

    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    read_verilog verilog_files/multiple_modules.v
    synth -top multiple_modules
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    flatten
    show multiple_modules
    
.. image:: /picture/day2_yosys_7.jpg
    :width: 800
    
Flat VS Hierarchical

.. image:: /picture/day2_yosys_6.jpg
    :width: 400
    
    
Synthesis Simulation
~~~~~~~~~~~~~

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
~~~~~~~~~~~~
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
----------
