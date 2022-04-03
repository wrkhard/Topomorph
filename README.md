Topomorph is a Processing for Java sketch that creates 3D Supershapes using the Superformula created by Johan Gielis,
to provide an interactive intution of natural forms. GUI provides two sets of hideable sliders that control inputs to the variables
of the Superformula, and controls for 'Point', 'Mesh', and 'Solid' views. Projection to either a spherical or toroidal mapping
can also be selected. Inspired by the work of Paul Bourke.


Superformula in poler coords:

<img src="https://latex.codecogs.com/gif.latex?$$r(\gamma)&space;=&space;[\vert\frac{1}{a}&space;cos(\frac{m&space;\gamma}{4})\vert^{n_2}&space;&plus;&space;\vert\frac{1}{b}sin(\frac{m\gamma}{4})\vert^{n_{3}}&space;]^\frac{-1}{n_{1}}$$" title="$$r(\gamma) = [\vert\frac{1}{a} cos(\frac{m \gamma}{4})\vert^{n_2} + \vert\frac{1}{b}sin(\frac{m\gamma}{4})\vert^{n_{3}} ]^\frac{-1}{n_{1}}$$" />


Sliders control input to each of these variables. There are two sets of sliders, one for the xy-plane, the other for the yz-plane.


Cartesian coords for Toroidal <img src="https://latex.codecogs.com/gif.latex?$S^{1}\times&space;S^{1}$" title="$S^{1}\times S^{1}$" /> mapping:

<img src="https://latex.codecogs.com/gif.latex?$$x&space;=&space;cos(\theta)(r_{1}(\theta)&plus;r_{2}(\phi)cos(\phi))\\&space;y&space;=&space;sin(\theta)(r_{1}(theta)&plus;r_{2}(\phi)cos(\phi))$$" title="$$x = cos(\theta)(r_{1}(\theta)+r_{2}(\phi)cos(\phi))\\ y = sin(\theta)(r_{1}(theta)+r_{2}(\phi)cos(\phi))$$" />

Cartesian coords for Spherical <img src="https://latex.codecogs.com/gif.latex?$S^{1}&space;\times&space;S^{1}&space;\times&space;S^{1}$" title="$S^{1} \times S^{1} \times S^{1}$" /> mapping:

<img src="https://latex.codecogs.com/gif.latex?$$x&space;=&space;r_{1}(\theta)cos(\theta)r_{2}(\phi)cos(\phi)\\&space;y&space;=&space;r_{1}(\theta)sing(\theta)r_{2}(\phi)cos(\phi)\\&space;z&space;=&space;r_{2}(\phi)sin(\phi)$$" title="$$x = r_{1}(\theta)cos(\theta)r_{2}(\phi)cos(\phi)\\ y = r_{1}(\theta)sing(\theta)r_{2}(\phi)cos(\phi)\\ z = r_{2}(\phi)sin(\phi)$$" />


Range for theta and phi:
<img src="https://latex.codecogs.com/gif.latex?$$-\frac{\pi}{2}\leq\phi\leq\frac{\pi}{2}\\&space;-\pi\leq\theta\leq\pi$$" title="$$-\frac{\pi}{2}\leq\phi\leq\frac{\pi}{2}\\ -\pi\leq\theta\leq\pi$$" />

Examples:


![](images/example.png)
