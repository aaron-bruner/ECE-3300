# ECE-3300 [Signals, Systems & Transformers]
Course material for ECE-3300 at Clemson University for the Fall semester of 2021.

## Course Description
Study of systems models, analysis of signals, Fourier series and transforms, sampling and Z transforms, discrete Fourier transforms.

## Learning Outcomes
- Analyze signals and systems using time-domain techniques including signal transformations and convolution in both continuous and discrete time.
- Analyze signals and linear time-invariant systems using continuous-time and discrete-time Fourier series and Fourier transform techniques.
- Analyze signals and linear time-invariant systems using two-sided Laplace and Z transforms. 

###### Homework 1
This assignment (1) gives an overview of MATLAB’s basic commands, (2) demonstrates how to represent and use simple discrete-time signals in MATLAB, (3) introduces sampling as a way to represent continuous-time signals, (4) shows how to perform signal transformations and combinations, (5) demonstrates how to produce a well-formatted signal plot, (6) illustrates how to determine difference/derivative signals and summation/integral signals.

###### Homework 2
This assignment (1) demonstrates how to work with complex-valued signals and periodic signals in MATLAB, and (2) shows how to obtain energy, power, correlation, and mean-square error.

###### Homework 3
This assignment explains how to use MATLAB to perform the convolution of two signals in discrete time and in continuous time.

###### Homework 4
This assignment gives an overview of matrix manipulation techniques in MATLAB. It then explains how to use MATLAB to determine the Fourier transform of continuous-time and discretetime signals. The approach simply implements sums directly and implements integrals as sums
of rectangles, similar to the approach of previous assignments.

*It should be noted that MATLAB has an implementation of the Fast Fourier Transform (FFT) that is significantly more computationally efficient. We choose not to use the FFT approach because it requires additional theory normally taught in a Digital Signal Processing (DSP) course and because applying the FFT to the Fourier transform requires additional manipulations of the FFT output that are difficult to explain simply. The approach presented in this assignment, although computationally inefficient, works quite satisfactorily and is relatively simple to understand.*

###### Homework 5
As defined in the course notes, a Bode magnitude plot is a straight-line approximation of |H(jω)| in decibles versus ω on a logarithmic scale. Similarly, a Bode phase plot is a straight-line approximation of ∠H(jω) versus ω on a logarithmic scale. The straight-line approximations are useful because they can be hand-drawn easily and help indicate the effects of individual poles and zeroes. Often, however, precise plots of |H(jω)| in decibels and ∠H(jω) versus ω on a logarithmic scale are desired; these are often simply called Bode plots (not approximations). This assignment shows how to plot “exact” Bode plots in MATLAB.

###### Homework 6
In this assignment we explore how to obtain and use dynamic system models in MATLAB. Our focus is particularly on linear time-invariant system models. These models are a part of MATLAB’s Control System Toolbox. (MATLAB calls these representations numeric model objects.) Some of the capabilities described here we have already built out of low-level commands; here, we look at what these higher-level commands can do. The commands have many options; here we simply present the basic forms of the commands, because the “default” settings are adequate for our purposes. Although these commands can be used with both continuous-time and discrete-time systems, our description and focus is on continuous-time systems.
