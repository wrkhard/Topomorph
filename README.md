---
title: "Topomorph"
author: "William Keely"
date: "May 10 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Topomorph is a Processing for Java sketch that creates 3D Supershapes using the Superforula created by Johan Gielis, to provide an interactive intution of natural forms. GUI provides two sets of hidealbe sliders that control inputs to the variables of the Superformula, and controls for 'Point', 'Mesh', and 'Solid' views. Projection to either a spherical or toroidal mapping can also be selected. Inspired by the work of Paul Bourke.


Superformula in poler coords:

$$r(\gamma) = [\vert\frac{1}{a} cos(\frac{m \gamma}{4})\vert^{n_2} + \vert\frac{1}{b}sin(\frac{m\gamma}{4})\vert^{n_{3}} ]^\frac{-1}{n_{1}}$$


Sliders control input to each of these variables. There are two sets of sliders, one for the xy-plane, the other for the yz-plane.


Cartesian coords for Toroidal mapping:
$$S^{1}\times S^{1}$$
$$x = cos(\theta)(r_{1}(\theta)+r_{2}(\phi)cos(\phi))\\
y = sin(\theta)(r_{1}(theta)+r_{2}(\phi)cos(\phi))$$

Cartesian coords for Spherical mapping:
$$S^{1} \times S^{1} \times S^{1}$$
$$x = r_{1}(\theta)cos(\theta)r_{2}(\phi)cos(\phi)\\
y = r_{1}(\theta)sing(\theta)r_{2}(\phi)cos(\phi)\\
z = r_{2}(\phi)sin(\phi)$$


Range for $\theta$ and $\phi$:
$$-\frac{\pi}{2}\leq\phi\leq\frac{\pi}{2}\\
-\pi\leq\theta\leq\pi$$

Examples:

<center>
![](example.png)
</center

