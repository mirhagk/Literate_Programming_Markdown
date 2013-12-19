Literate Programming with Markdown
==========

Introduction
-----

Donald Knuth wrote a paper on a concept he called [Literate Programming][literateProgramming]. Basically the concept was to right a program for a human first, with the computer understanding it only as a by-product. The basic idea was great, but it existed before it's time.

The original idea was to create a single document, with a special format, and then use a program to "weave" it into a description of the program and "tangle" it into a source file for a compiler. It was here that most people got confused, because it introduced convoluted syntax and required learning 3 languages to write a program:

1. The documentation language (very often LaTeX, which was not "easy" in and of itself)
2. The programming language (whichever one it was)
3. The syntax for the "web" program (the program that would "weave" and "tangle") 

Very few people are willing to learn 3 languages just to get their program to work, which is probably one of the main reasons very few people used it.

So literate programming came, made a little splash, and then went away never to be heard of again.

Well obviously not quite, coffeescript came around and showed us how we can use the concept of literate programming, and how we can make it fun again. It has a mode that [uses markdown to describe and write your program][literateCoffeescript]. By simply indenting the code within the document, you use markdown's syntax to write code, which will be formatted by any markdown processor. Then the coffeescript compiler can simply extract these code sections out of the markdown document, and into a code file to be compiled.

What happened to weaving?
---

This is different from the initial description of literate programming, which had a complicated weave and tangle process. It removed it for several reasons:


###Less syntax###
The old process introduced new syntax, which made it more difficult to learn, while the new process introduces no extra syntax. Every markdown literate program is 100% valid markdown already, no new syntax to learn.

###Removes "weave" step###
The "weave" step transformed the document into a description of the program, which required an extra processor, as well as an extra build step. Not only that, but the programmer didn't work directly with the documentation, they work with a tangled source file. The goal of literate programming is to get the programmer to work with the documentation, having code only as a by-product, and by using markdown the programmer is forced to view the document as documentation rather than something that "generates" the documentation for them. Generated documentation is something that can already exist, with things like javadoc, and the xml comments within .NET languages, so literate programming can't be seen as just another document generator.

###Easier processor###
Since all the preprocessor needs to do is extract the code from the file, it's just a matter of searching for indented sections, removing one layer of indentation, and then outputting that line. It makes the processor very easy to write, in fact here is the core logic in C#:

	static IEnumerable<string> Process(IEnumerable<string> input)
	{
		foreach(var line in input)
		{
			if (line.StartsWith("    ")||line.StartsWith("\t"))
				yield return line.RemoveStart("    ","\t");
		}
		yield break;
	}

It simply looks at each input line, sees if it is indented, if it is, it removes that indentation and then returns the line. Otherwise it simply skips over it.

###Programming languages are no longer so rigid###

Back when Donald Knuth first made the proposal, C++ was just being created, Fortran, C and Pascal ruled the programming world. Programmers nowadays call this the dark ages, when programming required memorizing large manuals, and was an 


[literateProgramming]: http://literateprogramming.com/knuthweb.pdf
[literateCoffeescript]: http://ashkenas.com/literate-coffeescript/