# Multi-Operand-Adder
Trying to Not solve the Multi-Operand-Adder problem on FPGAs

Convolutional Neural Networks (CNNs) are computationally intensive algorithms that currently require dedicated hardware to be executed. In the case of FPGA-Based accelerators, we noticed that a large portion of the instanciated resources are allocated to the Multi-Operand Adders (MOAs).

To reduce the footprint of MOAs, two optimization strategies, that rely on time-multiplexing and approximate computing, are investigated.
At first glance, the two strategies looked promising, but when synthesized on the device, none of them gave the expected results.

In this repo, we make our experiments available and reproductible.
- To evaluate the logic resources, please install a synthesis tool. We've done our experiments with Intel Quartus II v16.1
- To evaluate error rate of approximate adders, the bitset library is required.

More details about this work can be found in the pre-print here: https://arxiv.org/abs/1807.00217
