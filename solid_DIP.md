##SOLID Principle 5

**DIP - Dependency Inversion Principle: High-level policy should not depend on low-level detail. Low-level detail should depend on high-level policy.**

Uncle Bob first came up with this concept in 1978...one year after Star Wars...

So let's go on a little journey down client code lane and see what typicaly happens when building a program that, over time, needs modification.
And how the Dependency Inversion Principle can help us.

So let's say we have a client who wants a program that copies characters from the keyboard to the printer. We decide on a design like so...

Diagram 01

![Alt text](http://farm9.staticflickr.com/8356/8366076244_2ce0583a36_z.jpg)

Our code looks like so...

	void copy() {
		int c;
		while ((c = readKeyboard()) != EOF) {
			writePrinter(c);
		}
	}

It works yea...it's a masterpeice of software engineering. But now months have past and your client calls you and he wants a new feature.
He needs you to have the program sometimes read from the papertape reader. So you modify your UML.

Diagram 02

![Alt text](http://farm9.staticflickr.com/8368/8365004511_ffbc3fbf8f_z.jpg)

Now our code looks like so...

	bool GptFlag = false;
	// Remember to clear

	void copy() {
		int c;
		while ((c = (GptFlag ? readPt() : readKeyboard()) != EOF) {
			writePrinter(c);
		}
	}

Wonderful, but now months have past and our client wants another addition to the program...He wants it to write to the Paper tape Punch as well.
So we create yet another UML diagram.

Diagram 03

![Alt text](http://farm9.staticflickr.com/8184/8365004503_d0c9ef54d9_z.jpg)

Our code looks like so...

	bool GptFlag = false;
	bool GpunchFlag = false;
	// Remember to clear

	void copy() {
		int c;
		while ((c = (GptFlag ? readPt() : readKeyboard()) != EOF) {
			GpunchFlag ?  writePunch(c) : writePrinter(c);
		}
	}

Welcome to code rot. How will this look in the future as the client keeps asking for more and more additions? 
What will you do?

Remeber our definition for DIP...

DIP - Dependency Inversion Principle - High-level policy should not depend on low-level detail. Low-level detail should depend on high-level policy.

Right now our High-level policy...copy...is depending on our low-level details..keyboard, printer and paper tape reader. Wouldn't it be awesome 
if we could abstract away these dependencies and make it so copy didn't need to know what kind of device it was reading or writing to?
Well we can, and our UML diagram will look like this now. Make note of the red area. This is where our dependency switch occurs.

Diagram 04

![Alt text](http://farm9.staticflickr.com/8370/8366076206_11ac09f4f6_z.jpg)

	void copy(){
		int c;
		while ((c = getchar()) != EOF) {
			putchar(c);
		}
	}

Note the two singular differences in this six lines of code...getchar and putchar. That's the only thing we changed, and yet now we don't 
have the problem we had ealier. Now why is that? Well, first let's talk about getchar and putchar.

getchar and putchar are unix commands that receive and send input to standard output on a unix system. Standard Output can be attached to 
whatever device we see fit. Using these two efectively isolates 'copy' from the devices sending and receiving output acting like a type of
interface for the rest of the system.

Keyboard and Printer now become plugins to the system. 

