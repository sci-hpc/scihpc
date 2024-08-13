.. _GIZMO:

====================================================================
GIZMO, a flexible, massively-parallel, multi-physics simulation code
====================================================================


General Information
===================

Description
-----------

GIZMO lets you solve the fluid equations using a variety of different methods -- whatever is best for the problem at hand. It introduces new Lagrangian Godunov-type methods that allow you to solve the fluid equations with a moving particle distribution that is automatically adaptive in resolution and avoids the advection errors, angular momentum conservation errors, and excessive diffusion problems that limit the applicability of “adaptive mesh” (AMR) codes, while simultaneously avoiding the low-order errors inherent to simpler methods like smoothed-particle hydrodynamics (SPH). Meanwhile, self-gravity is solved fast, with fully-adaptive gravitational softenings. And the code is massively parallel — it has been run on everything from a Mac laptop to >1 million CPUs on national supercomputers.

.. toctree::
   :maxdepth: 1
   :titlesonly:

   firsttime_gizmo.rst


Online info
-----------------------

* `Homepage <http://www.tapir.caltech.edu/~phopkins/Site/GIZMO.html>`_ 
* `Documentation <http://www.tapir.caltech.edu/~phopkins/Site/GIZMO_files/gizmo_documentation.html>`_


GIZMO on Scicluster:
====================

Usage
-----

TBA

