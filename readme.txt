This is the readme for the models associated with:

 A Spatially Extended Model for Macroscopic Spike-Wave Discharges 
 Peter N. Taylor & Gerold Baier                                   
 J. Comp. Neurosci. 2011                                          

This code was contributed by peter.taylor at postgrad.manchester.ac.uk

Descriptions and usage for the scripts and functions are:

==> 1d/taylor_baier_one_dim.m

 This code reproduces the SWD in figure 3b of the manuscript.     
 Usage: At the MATLAB command window type >> taylor_baier_one_dim 

==> 1location/taylor_baier.m

 This code reproduces the SWD in figure 2c of the manuscript.
Usage: At the MATLAB command window type >> taylor_baier

==> 1d/hatbuilder.m

 This code is an easy way to see what the hats look like for given
 parameter values.  Also shows the area under the hat.
Usage: At the  MATLAB command window type >> hatbuilder

==> 1d/mexhat.m

 Returns a set of weights according to a mexican hat function
 distribution.  Requires input parameters (x) which is the location of
 the top of the 'hat', boundary which specifies the range assuming x=0
 (assumed to be symmetrical, and interval to set the resolution.
