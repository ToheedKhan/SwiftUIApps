# Avocados

For imagege in  inspector, resizing Preserve Vector data checkmark,
make sures that our icons won't be pixelated and they will be as sharp as they were designed.

## How to support system wide light or dark appearance with swift UI?
Create adaptive color sets and prepare some specific graphics for dark mode as well.


**To create a color appearance adaptive**
**ColorAppearance Adaptive**
The attributes tab under the appearance, click on the drop down menu by choosing the Any light and
dark option, we tell Xcode that we want our color to adopt in different environments such as light
and dark appearance.
Click on the button option and you will see that in the center there are three slots for our color set.
We will configure the appearance variants we want to modify right now.
In general, we use the any appearance variant to specify the color value to use on older systems that
don't support dark mode.
We will leave it white. Now the light appearance is also white, but in the dark appearance we want it to be black.
