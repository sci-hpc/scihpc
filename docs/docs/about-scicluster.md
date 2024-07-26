# About Scicluster

## A Linux Cluster - one machine, consisting of many machines

On one hand you can look at large Linux Clusters as rather large and powerful supercomputers,
but on the other hand you can look at them as just a large bunch of servers and some storage system(s)
connected with each other through a (high speed) network.
Both of these views are fully correct, and it's therefore important to be aware of the strengths and the limitations of such a system.

## Rocks Gnu/Linux operating system

Scicluster is build upon [Rocks](http://www.rocksclusters.org/) cluster distrobution.
Rocks is an open-source Linux cluster distribution that enables end users to easily build computational clusters,
grid endpoints and visualization tiled-display walls.
Hundreds of researchers from around the world have used Rocks to deploy their own cluster

## Resource description

Key numbers about the Scicluster: compute nodes, node interconnect,
operating system, and storage configuration.



<table style="width:96%;">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 23%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 16%" />
</colgroup>
<tbody>
<tr>
<td>Model</td>
<td>CPU/GPU</td>
<td>architecture</td>
<td># cores</td>
<td>RAM (GB)</td>
<td>Name</td>
</tr>
<tr>
<td>sci (the head node)</td>
<td>2 x Xeon E5-2420</td>
<td>Ivy Bridge EN (2012)</td>
<td>12</td>
<td>16</td>
<td>Supermicro</td>
</tr>
<tr>
<td rowspan="2">compute-0-0</td>
<td rowspan="2"><p>2 x Xeon E5-2630</p>
<p>Quadro P4000</p></td>
<td rowspan="2"><p>Broadwell (2014)</p>
<p>Pascal (2016)</p></td>
<td rowspan="2"><p>20</p>
<p>1792</p></td>
<td rowspan="2"><p>64</p>
<p>8</p></td>
<td rowspan="2">ML350-Gen9</td>
</tr>
<tr>
</tr>
<tr>
<td>compute-0-1</td>
<td>2 x Xeon E5-2650</td>
<td>Sandy Bridge EP (2011)</td>
<td>16</td>
<td>32</td>
<td>DL380p-Gen8</td>
</tr>
<tr>
<td>compute-0-2</td>
<td>2 x Xeon E5-2690</td>
<td>Haswell (2013)</td>
<td>24</td>
<td>256</td>
<td>DL380-Gen9</td>
</tr>
<tr>
<td rowspan="2">compute-0-3</td>
<td rowspan="2"><p>2 x Xeon E5-2695</p>
<p>Tesla K80</p></td>
<td rowspan="2"><p>Broadwell (2014)</p>
<p>Kepler (2014)</p></td>
<td rowspan="2"><p>36</p>
<p>4992</p></td>
<td rowspan="2"><p>64</p>
<p>24</p></td>
<td rowspan="2">DL380-Gen9</td>
</tr>
<tr>
</tr>
</tbody>
</table>


Currently all nodes in the cluster are connected with a 1 Gb ethernet network as well as a 10 Gb low latency one for message passing.
