# hestia-latex

latex class and package to make writing notes and starting documents faster

## what even is this?

hestia-latex is not much! hestia and hestia-journal is just a style file to make setting up documents easier (in my opinion) and hestia-symb and hestia-extra provide useful aliases, shortcuts, and commands.

## what can you do with it?

### hestia.cls

`hestia` can take the optional arguments `slate`, `dark`, `landscape`, and `icon`. 

`slate` and `dark` both make the text color white and the backgrounds darker; you can check the file itself for the exact hex codes. dark uses i believe one of the colors that the gnome default profile uses, `#171421`? idk it's just really pretty.

`landscape` does what it says on the tin. it makes it landscape. i've used this to put in graphs and stuff.

`icon` inserts an icon into the upper right header. ive packaged along the icons i personally use, but they can be swapped out pretty easily. `dark` and `slate` both automatically select `icon-dark.png`, so keep that in mind. eventually ill change it so that its more flexible, allowing it in the maketitle definition, but oh well lol.

AN IMPORTANT DISCLAIMER: these icons were created by myself and my good friend [hyacinth](https://www.instagram.com/photocinthasus?igsh=NGp2azJxOXhwNWUz "give them love!"), and i'm using them with attribution. if licensing issues come up, ill take the images down—but the cc-by license is gpl3 compatible so for the time being, they stay up. thanks, cinth! :3

### hestia-journal.cls

`hestia-journal` works like the book class. it pretty much is the same thing with some extra customization options. set the key values `colorone` and `colortwo` with hex codes to get other colors. then, use `\frontmatter\maketitle\colophon\mainmatter` and go hog wild.

in addition to the standard maketitle commands, there's also `\authorsubtitle` (currently unused), `\booksubtitle`, `\publisher`, and `\publisherrtwo`. the names should be changed because i use the last two as location and location subtitle, but for now, they stay for backwards compatibility.

speaking of, this was pulled from my previous notes that i used a while ago to self-study for a calc class. i tried to mimic the look of my professor's book as closely as possible in those and then decided that i wanted to make it more me. so i did!

### hestia-symb.sty

the ailiases are just things ive collected from over the years, needing them for more than a few files, but the inline matrices using the command `\mat` make me very happy.

there's a bunch of new symbols: `\bigcsum` for connect sums, `\bigplus` for a big plus, etc. it also adds my custom rose qed symbol, which i'm honestly so proud about.

### hestia-shorthand.sty

this is the longest file and by far the least important. it started out as a collection of aliases and shorthands much like ~~hestia-utils~~ `hestia-symb`, but eventually i merged the two and retained the dirtiest of dirty things for this file. 

the `\rainbow` command can be used to spice up your typesetting. it loops through the colors of the rainbow! there's also the `\pastelrainbow` command that does much the same thing, but with a different pallete. i still need to add more palletes cos i think itll be cool. prolly pride ones.

it also adds a mysterious little command `\hestiastyle` that does nothing by default. hmmm...

if you pass the `gay` option to it, you unlock the true power: IT MAKES YOU GAY! just kidding, but it does replace `\emph` with one that's bound to the current style and sets `\hestiastyle` to be bound to the rainbow command. passing options like `pastel` will get you the other color palettes. this feature was inspired by the blahaj package on the aur. nifty!

there are also the options `sexualitycrisis` to randomize the gay colors, `garden` to randomize `\flower` and `\flowerqed`, and `chaos` to do both at once.

a fun thing about `\m`: its a mathmode bound to `\hestia-style`!! makes it really fun to type notes.

### deprecated

there are old versions of the files in here, just for backwards compatibility stuff. eventually i'll toss them because they have essentially worse content in worse ways, but for now... sigh.

## thats about it

if you wanna use this, its gpl3 so yea. im gonna ask kindly that you dont use it for nefarious purposes but idk you do you hon
