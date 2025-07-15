import numpy as np

__author__ = "Samuel Beiler"
__email__ = "Samuel.Beiler@rockets.utoledo.edu"

#As reported in Beiler et al. 2023
#NIRSpec
def SolveNirSpecRes(wavelength):
    extend_wavelength = np.hstack(([wavelength[0]*2 - wavelength[1]], wavelength, [wavelength[-1]*2 - wavelength[-2]]))
    pixel_width = (extend_wavelength[2:] - extend_wavelength[:-2]) / 2
    nirRes = wavelength / pixel_width / 2
    return nirRes

# MIRI
#Calculate width of each pixel in wavelength, to do this you need a wl array that is n+1 is length
def SolveMiriRes(wavelength):
    extend_wavelength = np.hstack(([wavelength[0]*2 - wavelength[1]], wavelength, [wavelength[-1]*2 - wavelength[-2]]))
    pixel_width = (extend_wavelength[2:] - extend_wavelength[:-2]) / 2  # in microns
    #Need to calculate the number of pixels covered by FWHM
    #As reported in Beiler et al. 2023
    angularSizeOfFWHM = 1.028*wavelength*1e-6/6.5*206265 #They report FWHM of 0.314*wl/10(um) for MIRI MRS
    numPixOfFWHM = angularSizeOfFWHM/.11 #.11 is the angular size of JWST MIRI LRS pixel (01.96-0.273" for MIRI MRS)
    miriRes = wavelength/pixel_width/numPixOfFWHM
    return miriRes

