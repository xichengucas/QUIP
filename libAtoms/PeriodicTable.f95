!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
!X
!X     libAtoms: atomistic simulation library
!X     
!X     Copyright 2006-2007.
!X
!X     Authors: Gabor Csanyi, Steven Winfield, James Kermode
!X     Contributors: Noam Bernstein, Alessio Comisso
!X
!X     The source code is released under the GNU General Public License,
!X     version 2, http://www.gnu.org/copyleft/gpl.html
!X
!X     If you would like to license the source code under different terms,
!X     please contact Gabor Csanyi, gabor@csanyi.net
!X
!X     When using this software, please cite the following reference:
!X
!X     http://www.libatoms.org
!X
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
!X
!X  Periodic Table module
!X  
!%  This module contains a list of elements, their masses and covalent radii.
!X
!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

!X $Id: PeriodicTable.f95,v 1.8 2007-08-03 00:29:50 ab686 Exp $

!X $Log: not supported by cvs2svn $
!X Revision 1.7  2007/07/17 08:44:55  gc121
!X added ElementName(0) so we can print undefined atoms
!X
!X Revision 1.6  2007/06/28 10:39:00  nb326
!X Parse an integer (passed in as a string) as an atomic number if atomic_number_from_symbol(). Maybe should rename to atomic_number_from_string?
!X
!X Revision 1.5  2007/04/17 09:57:19  gc121
!X put copyright statement in each file
!X
!X Revision 1.4  2007/04/13 15:21:59  saw44
!X Standardified any miscombobulations
!X
!X Revision 1.3  2007/03/12 16:59:24  jrk33
!X Reformatted documentation
!X
!X Revision 1.2  2007/03/01 13:52:09  jrk33
!X Documentation comments reformatted and edited throughout. Anything starting "!(no space)%"
!  is picked up by the documentation generation script
!X
!X Revision 1.1.1.1  2006/12/04 11:11:30  gc121
!X Imported sources
!X
!X Revision 1.9  2006/06/20 17:23:18  gc121
!X added new copyright notice to include James, Gian, Mike and Alessandro
!X
!X Revision 1.8  2006/06/08 13:56:53  saw44
!X Added function to look up the atomic number given the mass, to within a hard-coded tolerance
!X
!X Revision 1.7  2006/02/08 17:53:13  saw44
!X Added atomic symbol -> atomic number lookup function
!X
!X Revision 1.6  2006/01/27 16:12:51  gc121
!X added *MASSCONVERT so that we are in the correct units
!X
!X Revision 1.5  2006/01/24 11:33:06  saw44
!X Made all element names 3 characters long, to compile with PathScale
!X
!X Revision 1.4  2006/01/19 15:02:12  gc121
!X added copyright headers and cvs magic tags to files that were missing them
!X

module periodictable_module

use system_module      ! for definition of real(dp)
use units_module
!
! The Periodic Table
!

implicit none

character(3),parameter,dimension(0:116) :: ElementName =   (/"xx ",                                    &
   "H  ","He ","Li ","Be ","B  ","C  ","N  ","O  ","F  ","Ne ","Na ","Mg ","Al ","Si ","P  ","S  ",    &
   "Cl ","Ar ","K  ","Ca ","Sc ","Ti ","V  ","Cr ","Mn ","Fe ","Co ","Ni ","Cu ","Zn ","Ga ","Ge ",    &
   "As ","Se ","Br ","Kr ","Rb ","Sr ","Y  ","Zr ","Nb ","Mo ","Tc ","Ru ","Rh ","Pd ","Ag ","Cd ",    &
   "In ","Sn ","Sb ","Te ","I  ","Xe ","Cs ","Ba ","La ","Ce ","Pr ","Nd ","Pm ","Sm ","Eu ","Gd ",    &
   "Tb ","Dy ","Ho ","Er ","Tm ","Yb ","Lu ","Hf ","Ta ","W  ","Re ","Os ","Ir ","Pt ","Au ","Hg ",    &
   "Tl ","Pb ","Bi ","Po ","At ","Rn ","Fr ","Ra ","Ac ","Th ","Pa ","U  ","Np ","Pu ","Am ","Cm ",    &
   "Bk ","Cf ","Es ","Fm ","Md ","No ","Lr ","Rf ","Db ","Sg ","Bh ","Hs ","Mt ","Ds ","Rg ","Uub",    &
   "Uut","Uuq","Uup","Uuh" /) !% Mapping of atomic number to element name



! Units: grams per Mole * MASSCONVERT (conforming to eV,A,fs system)

real(dp),parameter,dimension(116) :: ElementMass =                                                     &
(/1.00794, 4.00260, 6.941, 9.012187, 10.811, 12.0107, 14.00674, 15.9994, 18.99840, 20.1797, 22.98977,  &
24.3050, 26.98154, 28.0855, 30.97376, 32.066, 35.4527, 39.948, 39.0983, 40.078, 44.95591, 47.867,      &
50.9415, 51.9961, 54.93805, 55.845, 58.93320, 58.6934, 63.546, 65.39, 69.723, 72.61, 74.92160, 78.96,  &
79.904, 83.80, 85.4678, 87.62, 88.90585, 91.224, 92.90638, 95.94, 98.0, 101.07, 102.90550, 106.42,     &
107.8682, 112.411, 114.818, 118.710, 121.760, 127.60, 126.90447, 131.29, 132.90545, 137.327, 138.9055, &
140.116, 140.90765, 144.24, 145.0, 150.36, 151.964, 157.25, 158.92534, 162.50, 164.93032, 167.26,      &
168.93421, 173.04, 174.967, 178.49, 180.9479, 183.84, 186.207, 190.23, 192.217, 195.078, 196.96655,    &
200.59, 204.3833, 207.2, 208.98038, 209.0, 210.0, 222.0, 223.0, 226.0, 227.0, 232.0381, 231.03588,     &
238.0289, 237.0, 244.0, 243.0, 247.0, 247.0, 251.0, 252.0, 257.0, 258.0, 259.0, 262.0, 261.0, 262.0,   &
263.0, 264.0, 265.0, 268.0, 271.0, 272.0, 285.0, 284.0, 289.0, 288.0, 292.0/)*MASSCONVERT 
!% Element mass in grams per Mole $\times$ 'MASSCONVERT' (conforming to eV,\AA,fs unit system).

! Units: Angstroms

real(dp),parameter,dimension(116) :: ElementCovRad =                                                   &
(/0.320,0.310,1.630,0.900,0.820,0.770,0.750,0.730,0.720,0.710,1.540,1.360,1.180,1.110,1.060,1.020,     &
0.990,0.980,2.030,1.740,1.440,1.320,1.220,1.180,1.170,1.170,1.160,1.150,1.170,1.250,1.260,1.220,1.200, &
1.160,1.140,1.120,2.160,1.910,1.620,1.450,1.340,1.300,1.270,1.250,1.250,1.280,1.340,1.480,1.440,1.410, &
1.400,1.360,1.330,1.310,2.350,1.980,1.690,1.650,1.650,1.840,1.630,1.620,1.850,1.610,1.590,1.590,1.580, &
1.570,1.560,2.000,1.560,1.440,1.340,1.300,1.280,1.260,1.270,1.300,1.340,1.490,1.480,1.470,1.460,1.460, &
2.000,2.000,2.000,2.000,2.000,1.650,2.000,1.420,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000, &
2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000,2.000/)
!% Covalent radii in \AA.

integer,parameter,dimension(116) :: ElementValence =  &
(/1,-1, 1, 2, 3, 4, 3, 2, 1,-1, 1, 2, 3, 4, 3, 2,     &
  1,-1, 1, 2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,     &
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,     &
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,     &
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,     &
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,     &
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,     &
 -1,-1,-1,-1/)


interface atomic_number
   !% Do a reverse lookup of atomic number from either symbol or mass
   module procedure atomic_number_from_symbol, atomic_number_from_mass
end interface atomic_number

contains

  !Look up the atomic number for a given atomic symbol
  function atomic_number_from_symbol(atomic_symbol)
    character(*), intent(in) :: atomic_symbol
    integer                  :: atomic_number_from_symbol
    integer                  :: i

    if (verify(trim(adjustl(atomic_symbol)),"0123456789") == 0) then ! an integer
       read (atomic_symbol, *) atomic_number_from_symbol
       if (atomic_number_from_symbol < 1 .or. atomic_number_from_symbol > size(ElementName)) then
	  atomic_number_from_symbol = 0
       endif
       return
    else ! not an integer, hopefully an element abbreviation
       do i = 1, 116
	  if (trim(adjustl(atomic_symbol))==trim(ElementName(i))) then
	     atomic_number_from_symbol = i
	     return
	  end if
       end do
    end if

    !If unsuccessful, return 0
    atomic_number_from_symbol = 0

  end function atomic_number_from_symbol

  !Look up the atomic number for a given atomic mass (IN GRAMS PER MOLE)
  !Note: this may fail for some of the transuranic elements... so put those ununpentium simulations on hold for a while ;-)
  function atomic_number_from_mass(atomic_mass)
    real(dp), intent(in) :: atomic_mass
    integer              :: atomic_number_from_mass
    integer              :: i
    real(dp), parameter  :: TOL = 0.01_dp

    do i = 1, 116
       if (abs(atomic_mass - ElementMass(i)/MASSCONVERT) < TOL) then
          atomic_number_from_mass = i
          return
       end if
    end do

    !If unsuccessful, return 0
    atomic_number_from_mass = 0

  end function atomic_number_from_mass

  !ElementName formatting, used by atoms_read_xyz
  !First leter uppercase, others lowercase
  function ElementFormat(lower_UPPER) result(UPPER_lower)
    character(*), intent(in)             :: lower_UPPER
    character(len=len_trim(lower_UPPER)) :: UPPER_lower
    character(len=*), parameter          :: lc = 'abcdefghijklmnopqrstuvwxyz', &
                                            UC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    integer                              :: i,j

    UPPER_lower = lower_UPPER
    j = index(lc,lower_UPPER(1:1))
    if (j>0) UPPER_lower(1:1) = UC(j:j)
    do i = 2, len_trim(lower_UPPER)
       j = index(UC,lower_UPPER(i:i))
       if (j>0) UPPER_lower(i:i) = lc(j:j)
    enddo

  end function ElementFormat

end module periodictable_module
