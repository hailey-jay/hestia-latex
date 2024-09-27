# hestia-latex

latex class and package to make writing notes and starting documents faster

## what even is this?

hestia-latex is not much! hestia is just a style file to make setting up documents easier (in my opinion) and hestia-utils and hestia-shorcuts provide useful aliases, shortcuts, and commands.

## what can you do with it?

### hestia.cls

hestia can take the optional arguments `slate`, `dark`, `landscape`, and `icon`. 

`slate` and `dark` both make the text color white and the backgrounds darker; you can check the file itself for the exact hex codes. dark uses i believe one of the colors that the gnome default profile uses, `#171421`? idk it's just really pretty.

`landscape` does what it says on the tin. it makes it landscape. i've used this to put in graphs and stuff.

`icon` inserts an icon into the upper right header. ive packaged along the icons i personally use, but they can be swapped out pretty easily. `dark` and `slate` both automatically select `icon-dark.png`, so keep that in mind. eventually ill change it so that its more flexible, allowing it in the maketitle definition, but oh well lol.

AN IMPORTANT DISCLAIMER: these icons were created by myself and my good friend [hyacinth](https://www.instagram.com/photocinthasus?igsh=NGp2azJxOXhwNWUz "give them love!"), and i'm using them with attribution. if licensing issues come up, ill take the images down—but the cc-by license is gpl3 compatible so for the time being, they stay up. thanks, cinth! :3

### hestia-utils.sty

this is really my favorite part of the whole project. the ailiases are just things ive collected from over the years, needing them for more than a few files, but the inline matrices using the command `\mat` make me very happy.

the `\rainbow` command can be used to spice up your typesetting. it loops through the colors of the rainbow! there's also the `\pastelrainbow` command that does much the same thing, but with a different pallete. i still need to add more palletes cos i think itll be cool. prolly pride ones.

it also adds a mysterious little command `\hestiastyle` that does nothing by default. hmmm...

if you pass the `gay` option to it, you unlock the true power: IT MAKES YOU GAY! just kidding, but it does replace `\emph` with one that's bound to the current style and sets `\hestiastyle` to be bound to the rainbow command. passing options like `pastel` will get you the other color palettes. this feature was inspired by the blahaj package on the aur. nifty!

### hestia-shorthand.sty

this is the shortest file of the three and by far the least important. it started out as a collection of aliases and shorthands much like hestia-utils, but eventually i merged the two and only retained the dirtiest of dirty solutions for this file. 

the idea? 

while in class and typing notes, i want to make it as verbatim as possible so that i can go as fast as possible. the `\m` command to swap to math mode reminds my little brain to think and type in tokens. `\env` replacing environments is the same idea.

but, the truly greatest thing about `\m`: ITS BOUND TO `\hestia-style`!! so whenever im typing in class, my notes automatically become rainbow colored. it makes me very happy.

## thats about it

if you wanna use this, its gpl3 so yea. im gonna ask kindly that you dont use it for nefarious purposes but idk you do you hon
