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
    

class Neutrino(object):
    """
    Neutrino class which contains energy, mixing angle, mass differences and vacuum oscillation frequency.
    """
    
    def __init__(self, energy, mixing_angle, mass_difference):
        """Initialize a new neutrino object"""
        self.energy = energy
        self.mixing_angle = mixing_angle
        self.mass_difference = mass_difference
        
    def mixing_matrix(self):
        """Unitary matrix that rotates the state from vacuum basis to flavor basis"""
        return np.array([ [ np.cos(self.mixing_angle), np.sin(self.mixing_angle) ],[ -np.sin(self.mixing_angle),np.cos(self.mixing_angle) ] ])
        
    def omega(self):
        """Frequency omega of the neutrino oscillation in vacuum, 
        
        \omega = \Delta m^2 / 2 E
        """
        return self.mass_differences/(2*self.energy)













# End of module
