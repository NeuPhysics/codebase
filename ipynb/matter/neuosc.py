# A module for neutrino oscillations

import numpy as np

## Define neutrino mixing matrix which brings the vacuum energy basis to flavor basis.



def mixing2():  ### 2 flavor case with fixing mixing angles from recent results
    """neutrino mixing matrix with : from vacuum basis to flavor basis"""
    
    sin2thetav = 0.917
    cos2thetav = 0.4
    return np.array([[cos2thetav,sin2thetav],[-sin2thetav,cos2thetav]])

def mix2(thetav):   ### 2 flavor case
    """neutrino mixing matrix: from """
    
    return np.array([[np.cos(2*thetav),np.sin(2*thetav)],[-np.sin(2*thetav),np.cos(2*thetav)]])


def pauli_matrices(n):
    """Pauli Matrices"""
    
    matrices = np.array([[ [0,1],[1,0]], [[0,-1j],[1j,0]], [[1,0],[0,-1]] ])
    
    return matrices[n-1]
    














# End of module
