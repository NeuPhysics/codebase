# A module for neutrino oscillations

import numpy as np

## Define neutrino mixing matrix which brings the vacuum energy basis to flavor basis.



def mixing2():  ### 2 flavor case with fixing mixing angles from recent results
    sin2thetav = 0.917
    cos2thetav = 0.4
    return np.array([[cos2thetav,sin2thetav],[-sin2thetav,cos2thetav]])

def mix2(thetav):   ### 2 flavor case
    return np.array([[np.cos(2*thetav),np.sin(2*thetav)],[-np.sin(2*thetav),np.cos(2*thetav)]])
















# End of module
