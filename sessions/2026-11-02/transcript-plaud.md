00:00:00 Speaker 1
And now the question is:

00:00:08 Daniel Chen
We can figure this out.

00:00:29 Daniel Chen
All right.

00:00:31 Daniel Chen
Oh.

00:00:33 Daniel Chen
Sorry about that.

00:00:36 Daniel Chen
It's funny because I was there forty five minutes early. I'm like now I'm late. That's great.

00:00:46 Daniel Chen
Since the.

00:00:49 Daniel Chen
You can't see this.

00:00:51 Daniel Chen
That little dinky thing.

00:00:55 Daniel Chen
Text edit.

00:00:58 Daniel Chen
Nope.

00:01:00 Daniel Chen
There we go.

00:01:02 Daniel Chen
Okay.

00:01:10 Daniel Chen
I think you can see that maybe as one URL. You can take a photo of it.

00:01:16 Daniel Chen
You do have a link to this. So everything you need is there. I'm still working on bits of lecture two, but we'll see how far we get for today.

00:01:30 Daniel Chen
And.

00:01:31 Daniel Chen
You should see the site that's up right here. I'll be presenting out of these slides. One of the things you can do is you don't actually need the slides open to follow along.

00:01:47 Daniel Chen
What I've done is if you just scroll down past the slides, the contents of the slides are just there for you to scroll, so you don't have to tab through it as we go.

00:01:59 Daniel Chen
All right.

00:02:02 Daniel Chen
Now it's the moment of truth. Does this work?

00:02:08 Daniel Chen
This, Cool.

00:02:11 Daniel Chen
Cool.

00:02:13 Daniel Chen
Show of hands. I'm assuming no one's really coded before.

00:02:17 Daniel Chen
Is that true? Yes. If I were to say, go do an analysis in code. Are you? Cool.

00:02:23 Daniel Chen
That's good. We're all starting in the right place.

00:02:28 Daniel Chen
I should have followed my slides.

00:02:31 Daniel Chen
I opened the wrong email. I'm sorry.

00:02:33 Daniel Chen
So we have the lecture. I've been told this is a lecture and lab.

00:02:40 Daniel Chen
Lab is it okay if it's kind of a lecture as well, or are you straight up?

00:02:46 Daniel Chen
So we have two days of talking about data processing in R.

00:02:57 Daniel Chen
We'll go through all of the data cleaning steps today. I think we'll definitely have more than enough time for that, and then anything that spills over, we'll talk about on Thursday. That's why you don't see a lot of the Thursday stuff on there. For Thursday, the plan is to show you and talk about linear regression and logistic regression, which are probably the two most common types of modeling tools you'll use in the medical clinician clinical sciences.

00:03:23 Daniel Chen
And I'll have.

00:03:29 Daniel Chen
Stuff that you can actually work on.

00:03:31 Daniel Chen
The first thing that would be good—you don't need it for today—but since I have this here

00:03:43 Daniel Chen
There's usually a monitor here, so I'm staring at the wrong place. One thing that would be useful if you don't want to install anything on your computer.

00:03:52 Daniel Chen
Which I think you do have R and everything installed from the previous course, but if you don't, you kind of just want to explore on your own, like you don't want to mess something up on your computer.

00:04:02 Daniel Chen
Assuming you have a GitHub account

00:04:06 Daniel Chen
One thing you can do is sign up for the GitHub Student Pack.

00:04:12 Daniel Chen
And what that allows you to do is it gives you a whole bunch of free resources for a lot of things that are typically paid, and you have a number of credits for it.

00:04:25 Daniel Chen
The reason why I bring that up is if you have a GitHub account, sign up for the student pack, and then in this main site you can click on code.

00:04:33 Daniel Chen
And what I've done is set up a GitHub Codespace.

00:04:37 Daniel Chen
So you'll normally see a big green button that says 'Start something on main'

00:04:42 Daniel Chen
And it'll take about 10 minutes to start up. So I'm going to start it up and let it run.

00:04:50 Daniel Chen
But I think there'll be a couple of use cases in this class and I was looking at your syllabus.

00:04:57 Daniel Chen
You are going to get an LLM like specific talk in this particular course

00:05:03 Daniel Chen
And this code space is set up where the right hand side is actually Copilot connected to an actual LLM, so you can actually do agentic coding, and I'll show you a little bit of it on Wednesday's class.

00:05:18 Daniel Chen
But the reason why I bring it up is this way, you're not having to pay like twenty dollars or two hundred dollars a month to get an actual API key.

00:05:27 Daniel Chen
It's good enough to do something in the course.

00:05:29 Daniel Chen
And you'll get a sense of talking to an LLM that's not through the chat interface, like through the web interface or the desktop, where you're copy and pasting stuff. You can literally say, "I need help with this," and it will start doing the work for you.

00:05:49 Daniel Chen
Kind of cool because you know now you're in more of a just confirming that the results are correct versus typing up a lot of this code from scratch. So as long as you can generally follow the process of what's going on

00:06:03 Daniel Chen
You're kind of okay. I guess it's kind of how you use it, like up to date where you're going to type something and then just confirm it.

00:06:10 Daniel Chen
So you're kind of in that mode, which is really nice. You can see it will take a bit of time to load up.

00:06:18 Daniel Chen
Because it has to install everything from scratch, but you will be able to get a code space or an actual agentic platform from there.

00:06:30 Daniel Chen
How to get that to work? Make a GitHub account, sign up for the student pack, and then you'll be good to go.

00:06:39 Daniel Chen
We talked about the course. The slides are there. If you're on the site, you can just scroll down.

00:06:45 Daniel Chen
I know a lot of people like to print to a PDF and then annotate the PDF, so that way it's a little bit easier to do something like that.

00:06:52 Daniel Chen
And you already have the course website in Canvas, so that's good to go. I already did this portion because it'll take some time to load up, but I'll do a little bit of the lecture, come back to it, and then we can hop around.

00:07:10 Daniel Chen
How am I doing? I'm doing good. So today and Wednesday.

00:07:16 Daniel Chen
I am going to try to take you through this entire process of getting data in somewhere, like loaded into R, which you've already done.

00:07:24 Daniel Chen
But we're really going to talk about this tidy transform and a little bit of visualization today.

00:07:32 Daniel Chen
Whatever overflows, we'll put into Wednesday's class on modeling. We'll do a little bit of communicating, which is how you go and generate a report. If you're in the code space, everything is set up for you, so you could, in theory, actually write a report with the data cleaning, your findings, and everything in one particular document that can get exported.

00:07:57 Daniel Chen
And a lot of this stuff is coming from; it's pretty much pulled from a lot of freely available textbooks as well. So feel free to use any of these textbooks, paste it into OpenAI or Anthropic and say, hey, here's the chapter I'm working on. Can you help me process through something? I'm sure it'll do a great job. So a lot of these materials are freely available. At UBC, we use this textbook for our.

00:08:28 Daniel Chen
At UBC, we use this textbook for our intro to data science course. So DSi one hundred. That is our DSi one hundred textbook. The one down here is somewhat less polished visually, but it's my dissertation.

00:08:41 Daniel Chen
Textbook that I made to teach data scientists to clinicians. There are a lot more health-related datasets in there that you can tinker around with.

00:08:51 Daniel Chen
And everything else are just supporting materials around the stuff that we'll be talking about today and tomorrow.

00:08:59 Daniel Chen
Cool.

00:09:00 Daniel Chen
First main topic. First thing that we're really going to be focusing on is this notion of tidy data.

00:09:11 Daniel Chen
And this is important because there are going to be a lot of times where you have a chart in front of you. You're doing a research study, and you're manually curating a data set for whatever research study you're working with.

00:09:28 Daniel Chen
That's fine. I've done it. Manual curation is part of what you have to do.

00:09:33 Daniel Chen
But you'll very quickly have the words for it. There is a format of the data that's easy for you as a human being. It's easy for me to look at the chart, write down the number, and start the data collection. Or it's easy for me to get the data because someone else already has this dataset that they've worked on, and it's in that format.

00:09:56 Daniel Chen
But just because you have a dataset doesn't mean it's necessarily clean, right? So there's actually a formal definition of what a clean or tidy dataset is.

00:10:07 Daniel Chen
And we'll be talking.

00:10:09 Daniel Chen
That particular concept, and hopefully you have not heard about this concept from your last class.

00:10:16 Daniel Chen
So hopefully, what you have heard is of this package called tidyverse. Tidyverse is a meta package.

00:10:26 Daniel Chen
Meaning it's really one thing that you load, and it loads like seven or eight other things in the background.

00:10:32 Daniel Chen
And one of those things is going to be a library called tidyr for tidying our data sets.

00:10:40 Daniel Chen
What does and this ran off the screen? Can I scroll? I can scroll. What is tidy data? If you look up any of the more recent textbooks, especially the R for Data Science textbook, there is literally a chapter called Tidy Data

00:10:59 Daniel Chen
And this is how they define data to be clean.

00:11:02 Daniel Chen
Each variable is a column.

00:11:05 Daniel Chen
And each column is a variable. Each observation is a row.

00:11:09 Daniel Chen
And then each value is an individual cell.

00:11:12 Daniel Chen
Hello, someone found me and brought me in here.

00:11:18 Daniel Chen
So this is what makes a tidy data set. Data sets can be messy in many different ways, but they can only be clean in one particular way.

00:11:30 Daniel Chen
And we'll go through all of these little individual pieces.

00:11:37 Daniel Chen
How a particular dataset might violate one of these particular rules.

00:11:43 Daniel Chen
In the there's a paper from 2014. Hadley Wickham wrote this paper called Tidy Data. Hadley Wickham was the creator of all of the packages that eventually got tied into something called Tidyverse. It's really like one main person who was in control of all of this. In 2014, he wrote this initial paper called Tidy Data, trying to define the same thing.

00:12:04 Daniel Chen
Each variable forms a column. Each observation forms a row. He also had this other line of each type.

00:12:11 Daniel Chen
Each table forms a like

00:12:13 Daniel Chen
Each table is an observational unit. We'll talk about that as well. Essentially, that third line got replaced with a cell contains one thing.

00:12:22 Daniel Chen
What does that mean? A cell. How do you know a cell can contain multiple bits of information? The easiest way is when you open up an Excel sheet and you're using color. You're saying green is good and red is bad.

00:12:36 Daniel Chen
That cell on its own is already there's a number, so that's one bit, and then there's a color, so that's another bit of information

00:12:43 Daniel Chen
And that's probably the most common way where multiple things are being stored in a particular cell.

00:12:49 Daniel Chen
Because you're essentially treating Excel like a dashboard at that point. It's not really storing data. Storing more than just data at that point

00:12:57 Daniel Chen
And that becomes problematic because if you have a cell that's green and you try to load it into R. R has, or any data science language, no concept of a color for a particular cell. So this good and bad status you have is now kind of lost in that process. That's a big reason why you want to.

00:13:18 Daniel Chen
There's like Excel make your life easier mode, but then there's also how do we get this to work for a computer? What typically ends up happening is if you actually need to flag things, you create a new column that says this is actually good. This is a row that has a good or bad value.

00:13:34 Daniel Chen
Which again

00:13:36 Daniel Chen
There is this difference between what makes it easier for me as a person and what makes it easier for the computer to do analysis, right?

00:13:44 Daniel Chen
So tidy or not?

00:13:50 Daniel Chen
Yes or no? No. Why would it not be tidy?

00:13:58 Daniel Chen
Yeah.

00:14:01 Daniel Chen
Exactly. So you have a rate. Rate is a thing. If you're in an epidemiology class, rate is always the number of counts over some period of time. That's how epidemiologists count rate.

00:14:16 Daniel Chen
This is the number of counts over the total population.

00:14:19 Daniel Chen
Again, this is probably like an Excel formula, but there's no way to separate out or there is a way to separate out. There's a very strategically placed slash there. But there's no way at the moment to say

00:14:32 Daniel Chen
Give me the case count or give me the total population. You have to do some type of work.

00:14:38 Daniel Chen
So next one, tighter or not?

00:14:43 Daniel Chen
No

00:14:45 Daniel Chen
No. Why would you say no?

00:14:52 Daniel Chen
Yes. So that's actually a really good sniff test.

00:14:59 Daniel Chen
Whether or not your dataset is clean or tidy is if you ever see columns, more multiple columns that have a pattern that you can literally say, hey, those are years or they look like years or a subsection of those columns follow a particular pattern.

00:15:16 Daniel Chen
That's when you can say it's violating one of those rules, and there's a function to help you clean that. But again, the first step is identifying the columns, identifying the problems, and then which columns fit into that particular problem.

00:15:32 Daniel Chen
Next one

00:15:33 Daniel Chen
Is this tidy or not?

00:15:42 Daniel Chen
No. Any? It's a little tricky.

00:15:47 Speaker 1
Yes. No. Yes.

00:15:49 Speaker 1
No.

00:15:50 Daniel Chen
It's a little tricky. It's not tidy because each column does contain a variable. But if you look at the count column

00:16:02 Daniel Chen
Any type of calculation you do with that column will not make a lot of sense. If I take the average of the count column, what does it mean when I'm averaging cases with the total population? They're still counts. At least in this example, the unit is still the same, the number of people.

00:16:22 Daniel Chen
So you're not doing something like dealing with the number of people with a blood lab value, right? That's clearly a very different unit. That's your sniff test. But if everything is the same unit, then you might want to think about, hey, if the easiest way for me to do it is if I take the average of this column, does that number make sense?

00:16:41 Daniel Chen
Or if I take the minimum or maximum of that column, does it sort of make sense for the data set? Any one of those typical standards.

00:16:49 Daniel Chen
Statistics summary statistics that give you one number back.

00:16:53 Daniel Chen
If it doesn't make sense in that column, what does it mean to measure that, then you have this other problem. And again, there are functions on how to fix that. What about this one?

00:17:08 Daniel Chen
Maybe.

00:17:13 Daniel Chen
The hint is like this is the last one.

00:17:17 Daniel Chen
So yes, this is a tidy data set because each column is a variable. Each row represents one thing, and it's okay to have cases and population even though they're numbers because now I can say what is the maximum case or the maximum population, and now it pertains to a particular country.

00:17:56 Daniel Chen
You're talking about this one, right? So essentially, you'll see it as the actual function we use. You pivot this column out. You can turn this into that. This into that. You see now instead of a type column and a count column, you have a cases column and a population column. The unique values of this column.

00:18:18 Daniel Chen
Are now individual columns themselves.

00:18:26 Daniel Chen
It's one. It's one table

00:18:28 Daniel Chen
Because you just get a new column for population, and the cell body is the original counts. One column of values becomes the new columns, and then the other column gets used to fill in the main body.

00:18:43 Daniel Chen
And this operation is very literally like in Excel. If you've ever done a pivot table, it is pretty much like drag column. I want this column to be the rows and this column to be the body.

00:18:54 Daniel Chen
If you've used Excel pivot tables before, this operation is pretty much the Excel pivot table way.

00:19:00 Daniel Chen
Again

00:19:01 Daniel Chen
There's a couple of caveats. If, for example, you have multiple observations, like you have two people measuring counts, by default, what it will do is it depends on the language you're working with. I don't remember if it's I think R will take the average, so you might have to pay attention if you ever are in a situation where there is a chance that two people or two rows might have Afghanistan two thousand like rows to it. So that's something you might run into if you're doing something like this.

00:19:33 Daniel Chen
In which case, you might fix it by adding another column for who took this measurement, and then things clear up that way.

00:19:45 Daniel Chen
Why is that all important?

00:19:49 Daniel Chen
It's because again, if I were to say what is a tidy data set, it really is like those three bullet points. That's all. Any tidy data set fits that particular set of rules. But data sets that you get from the wild are going to be messy in all sorts of different ways. You can again find those small patterns and just work through them one piece at a time.

00:20:14 Daniel Chen
Here's how data gets messed up or not messed up. Column headers are values, not variable names. Multiple variables are stored in one column. Variables are stored in both rows and columns. The last two, number four and five, are the multiple types of tables that get needed. The reason why these two are important is if you think about how data is stored in a hospital. It's not one data set.

00:20:44 Daniel Chen
There's an encounters table, there's a patients table, there's a procedures table, et cetera. They're different data sets, and that's why when you make a data request, it's not as simple as hey, I need this data. Someone needs to find all of the other pieces and put them together.

00:21:00 Daniel Chen
The last two tables show how you like why and how you split up one data set into those individual pieces. It's because that way you reduce the amount of duplication that happens.

00:21:13 Daniel Chen
So again, if I'm only one person, there's no reason for my demographics to be duplicated every time there's a new encounter. You just need to know my patient ID number.

00:21:24 Daniel Chen
And then whatever happened in the encounter. I can always look up my demographics from the actual patient information. That's an example of why things might exist in two different tables.

00:21:37 Daniel Chen
So we'll also talk about that. But if we're just thinking about one particular data set

00:21:42 Daniel Chen
This is all of the parts that are involved in that one particular data set.

00:21:49 Daniel Chen
So how I'm going to scroll.

00:21:54 Speaker 1
All right

00:22:01 Daniel Chen
We will do this because I realized really late.

00:22:12 Daniel Chen
This didn't work.

00:22:14 Daniel Chen
So if we go through the tidy data paper

00:22:22 Daniel Chen
We'll literally talk through the examples that they use in the paper, and then on Wednesday I'll give you the Ebola data set, and you'll process and clean it and go through the same thing.

00:22:36 Daniel Chen
So hopefully you've already seen this portion right here, which is how do you read a data set?

00:22:42 Daniel Chen
This part makes sense.

00:22:45 Daniel Chen
A lot of these tutorials will end up using comma separated values. What's nice about Tidyverse is you can actually say read Excel and read an Excel table if you want to as well. CSV files are essentially any computer without installing anything can always open up a CSV file. You're not always guaranteed that an Excel file will open up somewhere.

00:23:11 Daniel Chen
You'll see CSV files in a lot of courses.

00:23:17 Daniel Chen
In your particular use case, you might get an Excel file if you're working on your laptop for a particular piece of work. But the hospital itself, that data is not really just stored into a bunch of CSV files. I'll point to a couple of resources where, if you want to see how things are kind of set up.

00:23:36 Daniel Chen
There's resources for that.

00:23:40 Daniel Chen
So we have this particular dataset. It is coming from the Pew Research Center.

00:23:46 Daniel Chen
And right here, you have a column called religion. For a particular religion and a particular income group, we have an actual count.

00:23:58 Daniel Chen
And so

00:24:00 Daniel Chen
There is if we're thinking about the steps or what makes this data clean or not

00:24:07 Daniel Chen
Like the couple of examples that we've shown before. If we look at the column names

00:24:12 Daniel Chen
What ends up happening is you might actually say, "Hey, those columns look like they follow a particular pattern," and that pattern would be there's a bunch of columns that if I were to give those columns a name, it would be income group like that.

00:24:26 Daniel Chen
So that's the first thing you've noticed, and that essentially is the first thing you're going to fix. The way we do that is we take all of those columns and turn them into individual rows.

00:24:47 Daniel Chen
And in R, the way they do this is you're going from something that has a lot of columns, and you're going to pivot it into something with a lot of rows. The function we use is called pivot longer. You're doing something and turning it longer.

00:25:09 Daniel Chen
I will hold on. Let's R for.

00:25:15 Daniel Chen
I think the R for DS text. This textbook is.

00:25:19 Daniel Chen
Oh gosh.

00:25:24 Daniel Chen
Um.

00:25:28 Daniel Chen
Data tidying.

00:25:31 Daniel Chen
If I remember correctly, I'm hoping they have a

00:25:35 Daniel Chen
Do they have an animation? They don't.

00:25:38 Daniel Chen
Of course they don't. There is no animation, is there?

00:25:44 Daniel Chen
Okay. Okay,

00:25:56 Daniel Chen
There is no animation in there. I am blanking out where the animations came from.

00:26:06 Daniel Chen
If we pivot longer, what you've seen without the animation part is there's just fewer columns. What ends up happening is we used to have a column called less than 10,000 and separate columns for 10 to 12, 12 to 30, 30 to 40, etc.

00:26:24 Daniel Chen
We now have just a lot of essentially agnostic religions duplicated a bunch of times.

00:26:32 Daniel Chen
So went from.

00:26:37 Daniel Chen
A data set that looks like

00:26:39 Daniel Chen
Like this

00:26:41 Daniel Chen
Where agnostic the religion is repeated once with a bunch of columns that represent the count across. But now we're saying, oh no, we're going to pivot the table longer, such that yes, the religion gets repeated a bunch of times, and income now becomes individual rows.

00:27:04 Daniel Chen
This is actually the tidier form of that data set, and you might say to yourself, "Well, that's really annoying because this is actually harder for me as a human to read." And that's kind of the point where there is a form of a data set that is easy for you, right? Like this form of the data set is really easy, especially if you're hand curating a data set. This makes a lot of sense.

00:27:26 Daniel Chen
If you're publishing a paper, this makes a lot of sense. You can see how much information can get stored on a page.

00:27:33 Daniel Chen
And this is how it's useful? This actually makes it worse. You can argue, and I would agree with you. This makes it worse to figure out what is actually happening here.

00:27:43 Daniel Chen
But this is tidy because you can now, if you're thinking about doing analyses or if you're trying to do summary statistics, point to actual columns to do things with. So I can say

00:27:58 Daniel Chen
Which gives me the max frequency, and I can filter by the max frequency to get the religion and the income group.

00:28:06 Daniel Chen
What I could do is now that I'm able to point to individual columns, so each column represents a variable, each row is just one unit, and then there's only one bit of information stored in each cell. Even though income has a lower bound and upper bound, it's still one category.

00:28:24 Daniel Chen
But that's nice because I can do something like this, which I can say for each unique value of religion.

00:28:31 Daniel Chen
Give me the total frequency count. What this will give me is that I have all of these people by income group, but let's say I just want to get a total of how many people are from each religion.

00:28:45 Daniel Chen
Right? So I can say

00:28:47 Daniel Chen
I can now see in the code you're literally pointing at individual columns to perform a particular task

00:28:54 Daniel Chen
And that's what makes tidy data. Really nice because now the computer can do those calculations for you.

00:29:01 Daniel Chen
If you were to think about how you would do this problem normally, if I were to do it this way

00:29:07 Daniel Chen
You could. If I was in Excel, the way you would do it is you'll create a new row at the bottom and you'll say equals and then the sum of everything on top, and then you drag the thing across.

00:29:18 Daniel Chen
But if you think about it as a data thing, what you've done is you modified the Excel table. Where now, if I take the sum of any column.

00:29:27 Daniel Chen
You've contaminated it with another value, right?

00:29:33 Daniel Chen
Excel and spreadsheet programs are really good. And again, do I do that sometimes? I absolutely do that sometimes. But when you're thinking about, hey, I'm now trying to produce an analysis that can run from beginning to end without modifying and messing up the original data.

00:29:49 Daniel Chen
This is the process you would have to do it. It's like in Excel, it's really easy to write a formula and drag it across.

00:29:56 Daniel Chen
But that's not the only thing you're going to want to do. You're going to take sums. Maybe you're going to fit a model. Now that column, you've already added a whole bunch of stuff in there. The model you now have to go and delete it and do stuff like that.

00:30:10 Daniel Chen
So that's one example. Or now you can see, it wasn't very useful. Or you can say you can argue that this is a very annoying view for a human to look at. But then I can very easily start getting counts for things.

00:30:29 Daniel Chen
I changed the font last minute, and things started to not fill the screen. We'll do it this way.

00:30:36 Daniel Chen
In the paper, there's another data set.

00:30:41 Daniel Chen
It's slightly more complicated in some sense, but here are the billboard rankings from popular songs in the year two thousand.

00:30:49 Daniel Chen
This used to be a recent data set.

00:30:56 Daniel Chen
But you can see, for each row, we have a particular song.

00:31:00 Daniel Chen
So we have the year, the artist, the track, how long the song is, when it was entered into the Billboard ranking system, and then we have columns that say WK one all the way up to WK. I think it goes up to the 70s.

00:31:18 Daniel Chen
And again, you might look at this and say, Hey, there seems to be a pattern. There is a bunch of columns that represent the week number.

00:31:27 Daniel Chen
This is really similar to what happened during COVID, which was there was a new column for each new day of the pandemic, and you were just inputting new case counts throughout the day. That's kind of how things were reported.

00:31:40 Daniel Chen
That's fine until this is an actual true story. The NHS, out in England, were keeping track of COVID counts that way, where each new day got a new column, et cetera, and they were fitting models based off of the case counts throughout the days of the pandemic.

00:32:01 Daniel Chen
And they were doing it in—I don't know if it's Excel specifically—but they were doing it in a spreadsheet program essentially.

00:32:07 Daniel Chen
And what ended up happening is when you are putting data or adding new data as a column

00:32:13 Daniel Chen
These tools run out of columns. What happened with the NHS was they ran out of columns, so new data was essentially replacing the last column of the pandemic, and then over time you start getting bigger and bigger gaps, and then your models are gonna fall apart because now there's

00:32:32 Daniel Chen
A multi-week, days, or months gap between your counts.

00:32:37 Daniel Chen
So that's another reason why tidy data as a principle is really important. Now you're thinking about, hey, if I'm going to be keep adding data this way, is this like a sustainable way to add data? And in general, it's like probably a multiple of two. It's probably like two hundred fifty six columns or five hundred twelve columns, and then it's out. You can even do something like that in Excel. There is a way to go to the last column and go. Essentially, there is a last row. It's in the billions, but there is a last row in Excel as well.

00:33:09 Daniel Chen
It's much harder to hit the row limit than the column limit, and that's why you want to make sure that each column is a variable. It's very unlikely a data set has 512 variables in one particular data set. Yes, does that exist? Sure, in large surveys, multi-wave surveys, that probably does exist. But as one data set, probably not really. When you're curating data sets

00:33:36 Daniel Chen
Think about how you're adding new data. If you have a system where you just add a new column.

00:33:43 Daniel Chen
I don't know. I'm sure people thought the pandemic was going to end relatively soon.

00:33:49 Daniel Chen
Which is probably why they thought to do that. But again, if you're not paying attention to those problems, especially the tool limitation, then yes, you're going to end up in this problem that the NHS had, where their models are all falling apart because they literally ran out of columns to fit the models.

00:34:06 Daniel Chen
Again, anytime you see patterns. Does it mean you have to fix it right away? Leave yourself knowing that there is a way to get yourself out of that problem, and that's something you would start thinking about.

00:34:22 Daniel Chen
So the way we fix this is we use the same function, except now we say something like, "Hey"

00:34:29 Daniel Chen
We want to select or pivot the week columns. How do we do that? There's a very convenient.

00:34:39 Daniel Chen
The way that the weeks are numbered, it begins with WK and then there's a number. So when you're curating data, even by hand, leave yourself a bunch of breadcrumbs so you can actually start pinpointing and selecting columns based off of a pattern. Whether or not that's a slash somewhere, maybe it's a dash, maybe it's a precursor. In a lot of programming languages, they actually don't let you start a variable with a number.

00:35:05 Daniel Chen
You kind of can. You're kind of forced to say W something one or W something with a number, so keep that in mind.

00:35:13 Daniel Chen
Leave yourself these little breadcrumbs.

00:35:18 Daniel Chen
The other thing that you can do is

00:35:23 Daniel Chen
If we think about what it would take to make this data tidy, like I would say, if this was a big exercise, take out a piece of paper and draw out what the columns would be. You would have a column called year, artist, track, time, date entered. You have a column called week

00:35:41 Daniel Chen
And then in there it will say one, two, three, four, five, all the way up to seventy-six. And then you have another column called ranking from. I think it goes from zero to a hundred like that.

00:35:52 Daniel Chen
Because I think this is the top one hundred songs.

00:35:55 Daniel Chen
The rankings only fit in a particular thing, and that's it. You would have one, two, three, four, five, six, seven columns. Those would be the seven columns that you would have.

00:36:06 Daniel Chen
But you would have a lot more rows. For example, this song by Tupac would essentially have seventy-two rows, because you have a ranking for each particular week, and maybe some of them get dropped because the song fell out of the top one hundred, and so you'll have at most seventy-two. And as little as essentially one, if it was just popular for one week.

00:36:30 Daniel Chen
So how do we go and fix this problem? There is a very convenient

00:36:39 Daniel Chen
There's a very convenient function that we just learned called pivot longer

00:36:42 Daniel Chen
And we can say, hey, instead of saying this range of columns, we can actually say, hey, I want you to pivot the columns that begin with WK. So you can select columns based off of position, like this set of ranges. You can select columns based off of a pattern. Many ways you can do it. Leave yourself those particular breadcrumbs.

00:37:09 Daniel Chen
And then the code will say, hey, when I go and pivot it, what is the new column going to be? I'm going to say I want to call that new column week. There's a lot of things that you can do in our code that do things in multiple steps.

00:37:24 Daniel Chen
What this part is trying to say is, when you pivot it down, it's going to say WK something WK one two three four five six etc. Please get rid of the WK part so you get the number back right away.

00:37:36 Daniel Chen
Whether or not you choose to do this in one step or two steps, that's up to you. I end up doing a lot of these things in two steps because it makes the code a little clearer.

00:37:48 Daniel Chen
A little bit easier for a person to see the individual steps, but it's written here in one giant step just to make space on the slide.

00:37:59 Daniel Chen
Then the code here says, "Hey, when I get rid of the WK

00:38:04 Daniel Chen
What do you want to do to the remaining pieces of it? I'm saying the remaining pieces is an integer, like a number. Can you just turn it into a number? Otherwise, you'll get the string number one, like it's the character one, not the number one.

00:38:20 Daniel Chen
And the easiest way to tell if that's the problem of did you get number one, the actual number or not, is if you try to sort the column and the sorting goes one, ten, eleven, twelve instead of one, two, three, four, five. You've essentially sorted your numbers alphabetically instead of as a number. So that's essentially like a very quick oh okay why is the second number not a two. And the two is like row number eleven. That's because it's treating it like an alphabetical sort, which it begins with one

00:38:51 Daniel Chen
And that's what it did.

00:38:54 Daniel Chen
And then right here, what was the other column that we're going to create a like ranking? And then there's another option to say, hey, if there is no value there, just drop it. Not every song has a ranking for seventy two weeks. I don't think there's probably a couple of songs that have been popular for that long.

00:39:14 Daniel Chen
That might be pretty rare.

00:39:21 Daniel Chen
We'll talk about the rest of it a little bit later. But essentially, after that main pivoting step

00:39:26 Daniel Chen
What's happening here is just filtering down to make the table a little bit prettier.

00:39:31 Daniel Chen
But what you end up with after you pivot it is a data set that looks like this. You have year, artist, track, time. You have week without the WK in it. And then you have the ranking, and then you have the actual date that is actually like a proper date time that the computer understands. And what you can do now is you can say what is the you can start pointing to columns. You can say

00:39:57 Daniel Chen
For every week, what is the average ranking across all of the songs? You can point to a column, say, group by the week, calculate the average rank. You'll get 72 numbers back, and in theory, you can plot a line that essentially will look like it's steadily decreasing because, in general

00:40:14 Daniel Chen
Songs start off really popular if they are popular and they slowly lose popularity over time. A couple of songs might not follow that general pattern, but that's the type of analysis you could do.

00:40:27 Daniel Chen
Or you could do something like, for every artist, what is the maximum rank? And you might be able to say, hey, for a particular artist, how many of them.

00:40:37 Daniel Chen
Hit number one or number one hundred like that.

00:40:40 Daniel Chen
I forget. I think it goes a hundred down to one, which, if I'm looking at this, that kind of looks like it makes sense. It goes higher to lower, so you are at the top, and then you slowly get better.

00:41:01 Daniel Chen
So that's really dealing with that same problem. My variables contain?

00:41:06 Daniel Chen
Do the columns contain variables or are they actually values? So there's two examples of that. Again, main takeaway: leave yourself breadcrumbs, or really, if you can point out a pattern, that's how you know you fix that problem. You have that problem, and again, when you're using LLMs or whatever to help you clean that up, your main thing that you're looking for is pivot longer.

00:41:31 Daniel Chen
Okay.

00:41:35 Daniel Chen
So

00:41:38 Daniel Chen
Problem number two is what happens when multiple variables are stored in one column.

00:41:42 Daniel Chen
So this is the WHO tuberculosis data.

00:41:51 Daniel Chen
You have for each row a country and a year, and I don't know why it's all missing.

00:42:00 Daniel Chen
It shouldn't be. That's not true.

00:42:19 Daniel Chen
Where is it?

00:42:23 Daniel Chen
Okay. Yeah.

00:42:25 Daniel Chen
You have tuberculosis count data. For each row, you have country, year, and a count.

00:42:34 Daniel Chen
And for example, this fifty-two represents males age zero to fourteen. You have columns that say the first letter represents the sex.

00:42:45 Daniel Chen
The numbers following it represent some type of age group. You have male zero fourteen to male sixty five and above, and male unknown. And then you have female zero to fourteen all the way to female sixty five and above, and female unknown. That's how this table is set up.

00:42:59 Daniel Chen
So again, the first thing you have is there's a pattern in your column. We've already this is like the third time you're seeing the same function. Pivot longer is going to be the thing you're going to do.

00:43:11 Daniel Chen
The other problem you have here is that instead of color, this 52 again contains two things in it.

00:43:17 Daniel Chen
That 52 is a count of the sex and the age group.

00:43:21 Daniel Chen
Right now, the way that this particular data set is stored, there's no way to separate the sex from the age group. I can't say, give me all of the 0 to 14 counts. Like you, you kind of could if you write a weird Excel formula. But if I were to just say point to the columns for you to make this happen.

00:43:39 Daniel Chen
You kind of have to point the two columns to make that happen. You definitely couldn't say for each age group, give me the total. There's no columns for you to point at.

00:43:49 Daniel Chen
So that's a problem.

00:43:51 Daniel Chen
This fifty-two contains two bits of information, and we have to process it to separate out those two bits of information. This is a little bit different. It's the same problem when you're using color in your dataset, but again, this is what happens when now your column names start containing multiple bits of information, and census data, at least in the United States, is notorious for doing stuff like this, where it's here's like this giant count, and it's just like right, and then you have to go and process it yourself with underscores or capital letters like that.

00:44:25 Daniel Chen
This is an example that has two bits of information, but don't be surprised if it's like income and sex.

00:44:33 Daniel Chen
What else did they ask you? The number of people in your household count.

00:44:38 Daniel Chen
Census data gets really weird really fast.

00:44:40 Daniel Chen
Especially when you're trying to download it.

00:44:43 Daniel Chen
I'll just go through this paper since we already have it.

00:44:48 Daniel Chen
We'll go through the same process and code. But again, fix the easier problem first. So if you look on the left hand side

00:44:56 Daniel Chen
If we do that pivot longer step

00:44:58 Daniel Chen
We get part of the way there. We have a column called country year.

00:45:03 Daniel Chen
This mashed up sex age group. And then account. That's part of the way there. But now, if the question is how do I separate sex and age, it's you can without even writing code. You can use regular English. How would you do it? There's a very strategic first letter you can just remove or use the first letter for sex, and then the rest of it you can format into a number.

00:45:28 Daniel Chen
That's those are the types of breadcrumbs. If you're ever hand curating something, leave those for yourself. Maybe it's a dash. Maybe it's an underscore. I've been in weird places where I put two exclamation marks and said, 'You break on two exclamation marks.'

00:45:46 Daniel Chen
Census data has dashes and underscores and a bunch of other weird symbols, and it's very unlikely they have two exclamation marks. Sometimes you might end up doing a weird trick like that as you're processing data. The main takeaway is that you can see how that data, even though it was really hard originally to separate out that information.

00:46:06 Daniel Chen
There is a little breadcrumb that you could leave yourself to separate the data a little bit easier.

00:46:18 Daniel Chen
And again, there's a function that does this. You can actually do this all in the pivot longer step.

00:46:29 Daniel Chen
You can also do it in two steps. There's a pivot longer, and then there's another function called separate. So you can do it in two steps. But in pivot longer, it's essentially saying, what are the columns that you want to pivot? In this case, I am trying to say it's all of the columns that's not from country to year.

00:46:56 Daniel Chen
Oh.

00:47:00 Daniel Chen
This kind of does it. If we go back to the original dataset, it's saying, 'Hey, here's the columns that I don't want you to select, right? So I want you to pivot everything else.' The first example we showed you, 'Hey, here's the range of columns you can select.' The second example I showed you, you can select columns based off of a pattern.

00:47:18 Daniel Chen
This is an example that, again, it's easier to say, "Here's the ones I want to keep," and then just do everything else. So there's almost any way you can think of using a pattern to select columns. It probably does exist in code in some format, and this saying, "Hey, keep country and year, flip it." That's what the exclamation mark stands for in code. It stands for just do the opposite, or not is the way you pronounce it.

00:47:44 Speaker 1
And why is there a diagnosis?

00:47:50 Daniel Chen
This particular dataset has three things. In the actual slide deck, it has diagnosis, sex and age group. You can see in this particular example, there is a very strategically placed underscore that you can use to separate things. You can say, "Hey, separate on this underscore." There is an underscore you can use to separate. When you separate it, create these three parts: there is diagnosis

00:48:20 Daniel Chen
Gender and age.

00:48:22 Daniel Chen
And then, when you do separate it, there is a body that's happening. There's a count variable that I want you to use as the actual count.

00:48:31 Daniel Chen
And so now you have these three very relatively cleaned up columns with a count. And again, now you can say for each gender, give me the total count, or how are the counts of tuberculosis changing across all of the years across all of the countries? You can now start pointing to actual columns.

00:48:54 Daniel Chen
And you don't have to do this weird thing where you now have to have an Excel formula on the bottom of the row because if you start adding something to the bottom of a row, it's like a new observation and that's not necessarily true.

00:49:09 Daniel Chen
Last example and then we'll go on a little break.

00:49:19 Daniel Chen
Last example borrows from

00:49:23 Daniel Chen
This particular data set.

00:49:25 Daniel Chen
So this particular data set records readings from an expedition out to various points in Antarctica.

00:49:35 Daniel Chen
They have a location when the actual so year month

00:49:41 Daniel Chen
Year, month, and day of a particular reading of the max temperature or the minimum temperature.

00:49:47 Daniel Chen
So again, this data set also has a bunch of missing values because you're not taking.

00:49:53 Daniel Chen
Measurements every day across all of your sites

00:49:57 Daniel Chen
But if we're giving a data set like this again

00:50:01 Daniel Chen
What's the first thing that you notice? There's a column that looks like it has a pattern that represents days of the month, right? So D something. So without knowing that there's other problems happening with your data set, like again, pivot longer is probably the thing you'll be using the most. Fix that problem first. So if we use the same pivot longer function, and this is the fourth time you're seeing it.

00:50:24 Daniel Chen
You might end up in a data set like this, the version on the left.

00:50:29 Daniel Chen
So we have ID. After a little bit of processing, you can put the day of the month back in with year and month to get a proper timestamp.

00:50:41 Daniel Chen
And then what's left is temperature max and the actual value.

00:50:46 Daniel Chen
And again, if we kind of look at this like in passing, it does fulfill a lot of things with tidy data. And again, are there times where I just leave this as my dataset and I just go on because this is enough for what I need to do? Sure. But if we really want to think about what makes this data tidy, then we need the version on the right.

00:51:07 Daniel Chen
Think about what would happen if I take the average value of this column called value. Like if I tell you.

00:51:16 Daniel Chen
If you ask me what the temperature is like today, maybe it makes sense if I just take the minimum and maximum and give you the average and say that's the temperature today.

00:51:28 Daniel Chen
Most likely, that's not very meaningful to you. You actually just care about what the minimum and maximum value is, and so there's this other thing happening here where this data set's kind of weird because if I take minimums or what does it mean if I take the maximum value of this value column then I'm there's no way any of the minimum values are going to be there.

00:51:51 Daniel Chen
It's just going to be the maximum of the maximum value. Like that doesn't make a lot of sense if I'm trying to calculate something with that column.

00:51:59 Daniel Chen
So anytime you start running into those problems, maybe there is something else happening here, and typically that means there is this other function that you have to use. We've been talking about pivot longer this entire time. But there's actually another function called pivot wider where you do it the other way.

00:52:16 Daniel Chen
And so again

00:52:19 Daniel Chen
The code has two things we need to fix. We fix the first problem, which is pivot longer. And how do we pivot? There's a bunch of columns that begin with the letter D. When we do that pivot, please give it a new column called day and remove the letter D.

00:52:38 Daniel Chen
Turn the number into an integer and then create the temperature column next to it.

00:52:45 Daniel Chen
And then there is

00:52:47 Daniel Chen
This is a step that actually turns it into a date time stamp. So you can say, hey, now that I have year, month, and day, turn it into a date time stamp. And then the benefit of that is you can actually start doing date arithmetic. Computers don't know how to do date arithmetic unless you actually convert it into a date time stamp. And if you have time as many people today are figuring out time zones are really important. So there are standard ways of measuring or documenting what time zone you're in.

00:53:19 Daniel Chen
So you get a proper date time stamp.

00:53:21 Daniel Chen
The way computers actually calculate or do date arithmetic is everything gets converted into seconds, and they're just doing math against seconds, and then they convert it back into something that's human understandable.

00:53:35 Daniel Chen
So that's a little bit about under the hood. Most important thing is, if you have a date

00:53:40 Daniel Chen
As far as any programming language is concerned, including Excel, make sure it's a date timestamp. Excel tries to be helpful sometimes to the point where it's not helpful. If you ever have to put in rates, Excel might accidentally start turning things into dates, which is kind of annoying. But that's what it's trying to do. It's trying to make your life easier. By converting things into dates, because that way you can actually subtract two dates and get the number of days in between.

00:54:12 Daniel Chen
Something like that.

00:54:14 Daniel Chen
But the last sort of transformation that we needed to do is this pivot wider. If we go back to the paper.

00:54:29 Daniel Chen
If we go back to this, the problem that we have.

00:54:38 Daniel Chen
How do we do this pivoting step? We first say, "Hey, here's this column."

00:54:44 Daniel Chen
Every unique value in this column, I want to turn it into its own individual column. This is one column.

00:54:52 Daniel Chen
This column has two different values in it. I'm going to create two new columns out of it.

00:54:59 Daniel Chen
And then, now that I have two new columns, I need another column that says

00:55:04 Daniel Chen
'What are the numbers I want to use to fill in the rest of the table?' So you'll end up with a column or a data set with more columns than rows. So the function in R is called pivot wider.

00:55:20 Daniel Chen
Is it this one? Where is it?

00:55:27 Daniel Chen
So this function

00:55:31 Daniel Chen
You're really passing in two parameters. What is the column you want to pivot? And then, when you do the pivot, what is the column that you want to fill in the numbers with?

00:55:41 Daniel Chen
And again, this is if you've ever used a pivot table in Excel, it's literally like drag the variable to the columns, and then that gets pivoted out, and then you drag another variable to the body of the cell, and it will do that calculation for you.

00:56:00 Daniel Chen
Really, tidy cleaning up data.

00:56:05 Daniel Chen
The two main functions you're going to be looking for are either doing a big pivot longer step or pivot wider step. Everything else is details.

00:56:15 Daniel Chen
How many? How are you searching for the columns? How are you splitting up particular columns? A lot of those are going to be details that will vary widely given the data set that you have. From a really high level view.

00:56:32 Daniel Chen
The two major transformations that you're doing is this a pivot longer step or a pivot wider step? And if it's, is it only a pivot longer with a separate, or is it a pivot longer and then also a pivot wider, like combining multiple things together? It's never really just one of these functions by itself, but this is usually the first thing that you're going to be doing to get your data set a little bit closer to its final cleaned-up form.

00:57:04 Daniel Chen
Cool. So you can see, a lot of the data sets that I was pulling from were literally from some version of the original twenty fourteen paper.

00:57:14 Daniel Chen
So I believe I have it linked. You have it linked here. You can totally go through that particular paper. I would say if you do use this paper as another reference.

00:57:28 Daniel Chen
You only need to stop reading.

00:57:35 Speaker 1
I think section six is when you stopped reading.

00:57:46 Daniel Chen
Pretty much when it gets to this section here on tidy tools, the paper actually starts using functions that you probably won't be using. Because the paper is from 2014, you pretty much just read up to section four. That goes through all of the same concepts that we just talked about.

00:58:08 Daniel Chen
Let's take a five minute break.

00:58:10 Daniel Chen
Come back at two oh eight

00:58:13 Daniel Chen
And we'll just keep going to the next topic, then we'll start tying all this stuff together.

00:58:29 Speaker 1
I have a question.

00:58:31 Daniel Chen
How do I use this

00:58:34 Daniel Chen
To look like that.

00:58:41 Daniel Chen
This is very different from all the buildings on the UBC campus. You want to close that one.

00:58:47 Daniel Chen
And bring it here.

00:58:48 Daniel Chen
I want to leave it open. I would like those to be all this. I need all of these screens to be that, if possible.

00:58:57 Daniel Chen
So you want to mirror it here. Do you know how to mirror like this?

00:59:12 Daniel Chen
Because those are all zoom controls.

00:59:15 Speaker 1
And 

00:59:19 Daniel Chen
These are all zoom controls. This is not a zoom problem.

00:59:24 Daniel Chen
This is its own computer.

00:59:27 Daniel Chen
Maybe it's not possible.

00:59:28 Speaker 1
But the mouse is my laptop.

00:59:36 Daniel Chen
I tried to. This is a totally separate computer.

00:59:39 Daniel Chen
Which is why I don't know.

00:59:41 Daniel Chen
It probably isn't possible because it's a weird Zoom setup.

00:59:51 Daniel Chen
Also

00:59:53 Daniel Chen
Luckily I'm recording.

01:00:21 Daniel Chen
It's okay. I can fix it. It's supposed to do something with the HDMI. I have no clue what not to use. I've been in enough classrooms to just deal with it.

01:00:36 Speaker 1
Were you in the ITCC?

01:00:41 Daniel Chen
No. I went into the other building. I don't know why. I like.

01:00:47 Daniel Chen
I thought it was on Willow Street. And I was walking to Willow, and then I guess I opened the wrong email because the second

01:00:54 Daniel Chen
The email for the calendar invite for Wednesday was the first email I saw. So then I was like, I guess I was wrong, and I just went there, and I was there for like thirty minutes. I was like, Where is everyone? And then I was like, Oh no, it was Willow, and then nobody like this, and then I couldn't find the room.

01:01:12 Speaker 1
So I actually went all the way.

01:01:15 Daniel Chen
4: 23, and there was already a meeting going on. So that was my. And then somebody else found me walking around because I started asking all of the receptionists.

01:01:29 Daniel Chen
What is 100LT?

01:01:31 Daniel Chen
That's not even a letter I see. And then somebody found me and said it's probably the auditorium, and I was like that's not even. There's no sign for that.

01:01:40 Speaker 1
I know.

01:01:43 Daniel Chen
Um.

01:02:22 Daniel Chen
Oh no.

01:02:53 Daniel Chen
Okay,

01:02:54 Daniel Chen
We will.

01:02:56 Daniel Chen
I was okay.

01:02:58 Daniel Chen
Will I think I was talking too long? This thing timed out, and then I restarted it, so now I have to wait another ten minutes. But that's one of the downsides with Code Spaces. If you close it

01:03:08 Daniel Chen
It does have to restart itself, which takes a while.

01:03:11 Daniel Chen
But the benefit is you get free AI tokens, which I guess is worth something, and then you can decide if you actually want to pay for it.

01:03:23 Daniel Chen
It's one of those things where I didn't think it was worth paying for until you actually pay for it, and then you're trying to get your money's worth, and then you're like, oh wait, this can actually do a lot of cool things outside of your coursework. There are other side things where you're just like, it would be nice if I can automate this little thing on my computer, and it can go and do that. So there are like a lot of benefits to just using it that way, and then you slowly start to learn how these agentic tools work. Which is separate from how to do data analysis.

01:03:53 Daniel Chen
But I think there is something to be said about just playing with a tool to see how it works, and over time it may bleed into the actual work you need for work.

01:04:08 Daniel Chen
This is gonna take a while.

01:04:14 Daniel Chen
So we just talked about cleaning up your data. Now the question is, now that your data is clean.

01:04:22 Daniel Chen
What can you go and do with it now?

01:04:25 Daniel Chen
Again, we're going to be using tidyverse, and now we are going to go through the process of doing calculations and what are the main functions involved with doing some type of calculation.

01:04:39 Daniel Chen
So the first thing is here is our data set, and I need to go fix this after class. But we have our data set.

01:04:48 Daniel Chen
In the data science world, this is also a very popular dataset. If you've never seen it before, that's great. You will get very sick of seeing this dataset if you start doing data science things for a long time.

01:05:00 Daniel Chen
But this is the Palmer Penguins dataset, where we have different measurements of their bill and beak and flipper length and width for different species of penguins in different locations.

01:05:18 Daniel Chen
So we have species, island, bill length, bill depth, flipper length, body mass, sex, and the year that particular measurement was taken, and you can see that there are 344 observations or penguins in this particular dataset across eight columns.

01:05:38 Daniel Chen
And so, use this as a placeholder for a lot of datasets that you might encounter.

01:05:45 Daniel Chen
But one of the things that you might want to do, especially when you're given complex survey data

01:05:52 Daniel Chen
Is your research or the question that you're working with involving working with every single column or question in a survey? You probably only care about this couple of questions in this particular survey. There's no reason to keep all 300 columns if you only need 10 of them.

01:06:11 Daniel Chen
So in R, the main function you work with on selecting particular columns is there's a function called select. There's kind of reasons why they're named this way, but again, over time, you sort of start to learn that select is the function where you use to select columns. If you start using the words that reflect what the function is called, it helps you remember how these functions work. So you can say select.

01:06:43 Daniel Chen
From my penguins dataset, I want to select these three columns and then get those three columns back.

01:06:49 Daniel Chen
It's a really similar process

01:06:53 Daniel Chen
Just like with our tidy data example, you can select columns based off of a pattern.

01:06:59 Daniel Chen
You can say from my penguins data, select all of the columns that begin with Bill, and you can either mix them up a little bit. You can say select penguins species, and then starts with bill, and you can start piecing together your own data set. What I've done in the past, especially with survey data, is you'll select all of the demographic data, and then you'll say something like begins with Q twenty one to Q forty seven, and then you get a data set of just that.

01:07:30 Daniel Chen
Just those questions that are important to you. Or if you're just looking to do free form text. In Qualtrics, a lot of the text data ends with underscore text.

01:07:41 Daniel Chen
When you click other as an option, there's an underscore text column. You can say give me the demographic data and then ends with underscore text, and you can start using those patterns to filter and select the columns that you're looking for.

01:07:58 Daniel Chen
So again, if you can use normal English to describe the pattern you're looking for, there's probably a very simple function and pattern that can come back to you on filtering or selecting those columns.

01:08:18 Daniel Chen
You don't necessarily need to do it all in one go. You can define multiple patterns. You don't have to find the one big pattern that does everything you need.

01:08:28 Daniel Chen
All that will do is with AI and LLMs. You'll get an answer, then you'll step away and look at your answer, and it'll make no sense. You might as well do it in multiple pieces, where each piece makes more sense to you, because you're going to be the one that has to look at this code after the fact anyway. So I would say shorter code doesn't always mean better. Make sure you understand what's happening, because there's always an answer that's really compact, but compact code usually means.

01:09:01 Daniel Chen
It's very dense, and you have to work really hard to piece it all together. And computers are fast enough that the extra microsecond it takes to do that extra calculation is really not a big deal.

01:09:13 Daniel Chen
Next function is and this is why I was very careful with using the word filter

01:09:21 Daniel Chen
Because filter is a function you use to filter the rows. So you don't really filter columns; you select columns and filter rows.

01:09:29 Daniel Chen
Just start using that in your normal day-to-day way of talking about data, and your life will be a little bit better.

01:09:38 Daniel Chen
So filter is now looking at.

01:09:42 Daniel Chen
You're essentially you have a filter, and everything that is true is going to make it pass the filter. So here we can say

01:09:50 Daniel Chen
In my penguins data, I want to look at the flipper length column, and this is why tidy data becomes really important because now you can point to particular columns.

01:10:01 Daniel Chen
I want to point to a column called flipper length, and if that value is greater than 190, so it's greater than, not greater equal than

01:10:08 Daniel Chen
It will go and pass the filter. And then what's left is, if you look at filter length

01:10:13 Daniel Chen
What's left are all of the data sets that match that filter.

01:10:19 Daniel Chen
And you can have very complicated filters where it's greater, a flipper length greater than 190, but also sex is female.

01:10:29 Daniel Chen
Looking only at a Adel, a Daily Penguins, you can do that. So you can have multiple filters in a particular function. You can negate filters, so you can say, 'I want flipper lengths where you're not greater than one hundred ninety.' You can specify that as using the exclamation mark that says the opposite.

01:10:54 Daniel Chen
Or you can say you can flip the actual sign. There's always multiple ways you can handle a lot of these coding problems. I wouldn't necessarily say one is better than the other.

01:11:05 Daniel Chen
So sometimes, for example

01:11:08 Daniel Chen
It might be easier to say where sex is not male versus trying to list all of the other sexes that might be in your dataset. That's really what happens a lot with survey data. Where you are having the user enter their own value

01:11:26 Daniel Chen
Where the survey isn't checking for pre-made like tags like that, where it's just go type whatever you want, or even if you ask the user please type A, B, or C and only A, B, or C, you will be surprised by the number of responses that aren't what you are asking for. So that's just part of what happens when you start asking people to follow instructions.

01:11:53 Daniel Chen
They're going to read the instructions in ways that you didn't expect. Sometimes it is easier to specify the opposite of what you want, and the way you do that is to put an exclamation mark in front of the filter.

01:12:04 Daniel Chen
And again, the way this works is if the row or the thing that you're looking for returns true, then you get that entire row back.

01:12:19 Daniel Chen
So here. As another example, you can say, "I want this the flipper length greater than 190, and where I want the species to be equal to chinstrap."

01:12:30 Daniel Chen
In a lot of coding languages, especially R

01:12:33 Daniel Chen
If you're checking for if two things are the same, like equality, you're using two equal signs, and that's pretty much the case for every programming language except for JavaScript. That whole statement holds true, and when you're working with databases. So double equal sign is saying does this thing

01:12:52 Daniel Chen
Have the same value as the thing on the right?

01:12:55 Daniel Chen
In a lot of programming languages, if you use a single equal sign, it's saying that you want to set one value to another value. For example, in math, you'll say a equals three, and now a becomes the value of three when you do something.

01:13:07 Daniel Chen
Same thing with programming languages. They need to distinguish: Are you comparing these two things, or are you setting one thing to the other? The comparison is using two equal signs.

01:13:19 Daniel Chen
And then here you'll get the flipper length that's greater than 190 and species is equal to chinstrap.

01:13:27 Daniel Chen
You can also have an or operator. The way you do or is you type in the vertical pipe. So on a U.S. keyboard or a North American keyboard, it is shift and then the key above the enter sign. It's a literal vertical line.

01:13:41 Daniel Chen
Unless you're coding, I very doubt that you actually use that character. That's how you say or so you can say something like, 'I need,' where the species is chinstrap or like a daily. You can set multiple filters like that. It doesn't always have to be an and operator.

01:14:05 Daniel Chen
The next big function that you use there is a function called mutate.

01:14:14 Daniel Chen
And mutate is modifying an existing column, you can modify a column or create a new column with it. This is really useful if you need to create a new calculation.

01:14:25 Daniel Chen
Or it's really useful if you want to say that here's a number and I want you to turn it into an integer instead of a character. If you're modifying some column, either the same column or creating a new column, then you end up using the mutate function. This is saying: given my penguins data, I want a new column called body mass kilogram, and it's going to be the body mass, which is measured in grams, divided by a thousand to get kilograms.

01:14:52 Speaker 1
And then what you'll end up with is

01:14:57 Daniel Chen
Did it not print?

01:15:00 Daniel Chen
It didn't fit the screen. But you get a new column called body mass kg, and then you'll see it right here. Before we had eight columns, we now have a ninth column for that.

01:15:10 Daniel Chen
This is the way I typically like to do my data processing. For example, if I do recode

01:15:18 Daniel Chen
For example, let's take bill length and I want to turn it from a character string to a number. I sometimes create a new column that is bill length int or bill length number.

01:15:32 Daniel Chen
Just so I can visually check that this thing actually happened and turned into a number, and then I can prove to myself this worked. Then I might overwrite the original number, but this way I do create more columns.

01:15:45 Daniel Chen
And then what ends up happening is when I'm actually done creating all the new columns, I'll use select to drop the original columns.

01:15:53 Daniel Chen
So a lot of these functions

01:15:55 Daniel Chen
They're not just used once. They're not used in isolation. It's totally okay to select the columns you want, create new columns from them, and then drop the other columns after you're done processing. That's a very common pattern that you end up using.

01:16:13 Daniel Chen
So here's an example where you're doing multiple steps at the same time, and you might have seen this next part in your last class. Let's say I have my penguins data, and I want to convert the body mass into kilograms, and then I want to also filter based off of this parameter and subset the number of columns that I have.

01:16:37 Daniel Chen
The way I've been showing it to you, each one of these functions takes the data set as the first argument, and then the parameters, like what are the new columns we want to create, what are the filters that you want to make, what are the columns you want to select. They're after the first thing that you give the actual function.

01:16:57 Daniel Chen
If we can turn this all into one function call, you can see right now, this took three lines of code. But it also created three intermediate things. You're doing three steps. You're afraid to overwrite the original one. So you create a new variable, etc.

01:17:17 Daniel Chen
And this is one way you can write our code.

01:17:21 Daniel Chen
It's okay if you write our code this way. You just might not see it written this way very often. But that's one way you can write it. The other thing you can do.

01:17:30 Daniel Chen
If you've seen the way mathematicians write their code, it's like you've seen f of g of x of h of x of i of x, etc. You can say I'm going to take this mutate dataset and pass it into filter, and then that whole filter gets passed into this select. You can read it where this mutate call gets passed into this filter call.

01:17:58 Daniel Chen
Then it got passed into this select call, right? It's like this f of g of x of h of i. You have to read it inside out. That's also really annoying too. So in R, the way they've dealt with this problem is you get to use this pipe operator. This is two characters you have to type. It is the vertical bar with the greater than sign. Do not put a space there because then it will treat it as or greater than, and that doesn't make sense. So create like don't put a space and

01:18:28 Daniel Chen
What this allows you to do is avoid fixing the problem of creating multiple variables.

01:18:43 Daniel Chen
Oh percent greater percent. Is there a difference? Why would you use one version?

01:18:49 Daniel Chen
Pretty much, I think after 2023, everyone has migrated to vertical pipe greater than because this didn't exist in. If you are working with clinical trial data where the version of R itself is part of the submission process, and they're on an older version of R, in which case, this pipe operator did not exist back then. If you're writing tidyverse code, you only had percent greater percent.

01:19:20 Daniel Chen
Ever since R 4.0 and above.

01:19:24 Daniel Chen
This is now part of the R base language. Before, you had to install a package to get the pipe. This is just part of the language. And so, if people are still using percent greater percent on a new project, it's probably just out of habit.

01:19:37 Daniel Chen
But there are differences, but those differences at this level really do not matter. You could, and I've done this too, take code from the past and essentially do a find and replace, and it pretty much will work unless you're doing weird things. There are cases where it doesn't work that way. But if you're doing these very basic filter, mutate, select calls, find and replace is essentially the way to think about it.

01:20:10 Daniel Chen
But this is how you can rewrite so you're not looking at it in and out

01:20:15 Daniel Chen
And you're not creating intermediate steps. And the other benefit is if you write your code this way. What I like to do, and if I'm ever given code from anyone or code that I haven't written myself

01:20:30 Daniel Chen
If you do a scan, just like a vertical scan down, you can see penguins mutate filter select. You can get a very quick idea of what is happening.

01:20:40 Daniel Chen
I don't like right now. If I were to look at this code for the first time, I don't necessarily care about what's happening. What are the details? You're creating a new column, you're subsetting the columns, and you're selecting a couple of new columns. That's the thought process, and then I go back to the top. You're creating a new column or you're modifying a column. What are you modifying? Then I read across that way. I would say, especially when you're new to code, you don't have to read each word line by line in that order. You will read it in circles, and that's okay.

01:21:10 Daniel Chen
Don't feel like you have to understand each new word that you're seeing in that particular order.

01:21:21 Daniel Chen
We kind of saw this with our tidy data portion. Why do we need our data to be tidy? It's because now we can do these aggregate statistics.

01:21:30 Daniel Chen
And the key point of that is we are able to go and point to actual columns. So if I have all of these different species

01:21:41 Daniel Chen
And I want to calculate the average like size or mass for each of those species. I can say for each species. So if you ever use like for each unique value of something, group by is the word to think about. For each unique value of species, or group by species, I want you to calculate the mean body mass and give that a new column called average body mass.

01:22:08 Daniel Chen
So if we look at the output

01:22:11 Daniel Chen
We have three species of penguins, and then we get the average body mass for each species. That's what's happening in the code.

01:22:18 Daniel Chen
Why is it called group by and summarize? First, we need to talk about what the summarize function does.

01:22:28 Daniel Chen
It comes a little bit from statistics, where what is a summary function? A summary function is a function that takes in a bunch of numbers as input and returns one number as output. An average or the mean takes in a bunch of numbers and returns one number. A count takes in a whole bunch of numbers and counts it, returning one number back.

01:22:51 Daniel Chen
Mean, median, mode, average, min, max. Those are all summary functions because you give it a bunch of numbers and then what comes back. The most important thing is it gives you one number back.

01:23:06 Daniel Chen
So summarizing all that's doing is taking a summary function and putting it in a table form. That's all it's doing.

01:23:13 Daniel Chen
So the summary function we're using is called mean.

01:23:16 Daniel Chen
And then.

01:23:18 Daniel Chen
We're putting it into a table.

01:23:20 Daniel Chen
The I think we'll talk about this in more detail on Wednesday because my code space is not working.

01:23:34 Daniel Chen
What this allows you to do is that you can actually calculate multiple summary statistics at the same time. That's why you're using this summer summarize function. You can say at the end here, comma, Max body mass equals max of something, comma, Min body mass is min of something, comma, Standard deviation is this

01:23:56 Daniel Chen
It's essentially the same thing around. If you're looking at someone's blood values over time, you can get their average value, their minimum value, their maximum value, and their current value. Those are all different summary statistics for an individual patient, and you can group them all together such that you get a data set back using summarize.

01:24:24 Daniel Chen
Other kind of useful things. There is a function called N that's just counting. So it all it does is count the number of rows. So you can say, hey, I want the number of rows. But then this is a little trick that a lot of computers end up doing where in R and in a lot of programming languages that work with data

01:24:50 Daniel Chen
Just because you have a like missing value where it's an empty string, it's just a character with nothing in it, that doesn't necessarily mean it. The computer understands it as a missing value. So there's a very specific way. A lot of these data science languages have a very specific way of saying no.

01:25:14 Daniel Chen
An empty string could mean that the user just typed in a space or just typed next. But that's different from the user not answering the question at all.

01:25:24 Daniel Chen
You'll see this also a lot in health data sets where they get a data set with no missing values. But what they've done is you'll see ninety nine, and that usually is the code for no, this is the person was there conducting the survey, and they are very explicitly putting this as a missing value code because it differentiates the question of did you forget to ask that question or is that question not applicable or for something else.

01:25:55 Daniel Chen
So there's a way to actually codify what is actually missing. Na is the R and Python way that you'll see missingness

01:26:04 Daniel Chen
And all this is doing is

01:26:07 Daniel Chen
It's taking body mass

01:26:09 Daniel Chen
Seeing if the value for body mass is missing. If I were to say, is this thing missing?

01:26:15 Daniel Chen
Your response to me is probably yes or no. It's a yes or no answer.

01:26:20 Daniel Chen
So what this function is doing is it's coming back as true and false. And the trick that's happening here is true, in as far as the computer is concerned, true has a value of one, and false has a value of zero. So if you are asking how many missing values are here, you get a bunch of true false values.

01:26:42 Daniel Chen
If you add up the true false values, the true is a value of one, and you can get a count of the number of missing by summing up the number of true values.

01:26:53 Daniel Chen
So that's the little trick that's happening here. So that's why it's na. It comes back as true false, and then you're adding it all together. So if you ever see something like How does adding the sum of body mass with this function? I don't know. How does that count something? You can ask the LLM. Is this returning back true or false? Because what is happening here? Why does this work?

01:27:18 Daniel Chen
It works because true has a value of one. Anything that's not zero will be considered like a value of true, and then you can use the one zero trick to sum up if it's missing.

01:27:32 Daniel Chen
The way you can do this if it's not missing is you can put an exclamation mark right here, and what that will do is take all the true false values.

01:27:42 Daniel Chen
Invert it

01:27:43 Daniel Chen
And then you can sum all of that and then you'll get the how many are not missing question.

01:27:48 Daniel Chen
So that's one of those tricks that end up using not that many pieces of code, but it is a very dense thing that's happening.

01:27:59 Daniel Chen
I would like to say. With the power of LLMs and ChatGPT these days, copy and being like, "What is happening here?" is a totally valid thing to start doing, which is really nice. It does help with learning about what's happening in your code. I'm just gonna skip that example.

01:28:21 Daniel Chen
The next thing. So why do we care about tidy data? Now we can actually start visualizing our data.

01:28:30 Daniel Chen
Visualization relies on you to point to actual columns and tell the plotting system what you want to plot.

01:28:39 Daniel Chen
So in R, there's a package called ggplot two. It's part of tidyverse.

01:28:44 Daniel Chen
So once you library tidyverse, ggplot two already comes up.

01:28:47 Daniel Chen
And the most important thing when you're trying to visualize something is that your data is tidy because ggplot two doesn't work with non-tidy data.

01:28:57 Daniel Chen
But you need to be able to point to the variables that you want to look at.

01:29:03 Daniel Chen
For example

01:29:04 Daniel Chen
I want to look at the flipper length and body mass of our penguins. The first thing that you actually need to know is what type of variable flipper length and what type of variable body mass are. They are essentially continuous numbers; they're just a number.

01:29:26 Daniel Chen
That's very different from a variable, for example, sex, where it's not really a number; it's a group, a category. Not one is better than the other; they're just discrete categories.

01:29:40 Daniel Chen
But that's also different from something like stages of disease, where they are categories, but then there's an order to those categories. So the first thing you really want to pay attention to when you are visualizing your variables is what variables you want, and then from the variables that you're trying to visualize

01:29:57 Daniel Chen
What is the data type that's being stored?

01:30:01 Daniel Chen
If you're looking at two continuous variables, you're typically looking at a scatter plot, and the way the code is written is that we're using ggplot.

01:30:10 Daniel Chen
Here's the data set that we're going to use.

01:30:13 Daniel Chen
There is this little function called aes for aesthetic mapping

01:30:17 Daniel Chen
And all that's trying to tell you is, hey, I want to know which columns you're going to be using in your actual figure.

01:30:25 Daniel Chen
And then the way ggplot works is it's a layering system where you instead of using the pipe operator and this goes into the history of how the language evolved.

01:30:36 Daniel Chen
If you ask Hadley

01:30:39 Daniel Chen
Now he wishes the plus is a pipe operator, but these things were written before tidyverse really came about.

01:30:48 Daniel Chen
So ggplot is a layering system. Here's our base layer, which contains all the data and information we have, and on top of it, we're going to say geom_point because we're trying to draw points. Geom_point is how we make scatter plots. It's not called geom_scatter_plot.

01:31:05 Daniel Chen
It's one of those things that you sort of just learn over time. But as long as you know what a scatter plot is.

01:31:14 Daniel Chen
It's a very searchable thing. How do I make a scatter plot in ggplot2?

01:31:18 Daniel Chen
And then you'll get its geom underscore point. If you forget its geom underscore point, that's okay. The answer is very easy to look up, and it's okay if you don't remember it.

01:31:29 Daniel Chen
It's more important that you know that you're working with two continuous variables, and the way you visualize it is with a scatter plot. If you can say that sentence out loud, an LLM can fill in the rest for you. The code at that point won't really matter.

01:31:45 Daniel Chen
Because you're looking at an actual scatter plot.

01:31:50 Daniel Chen
One of the other things you can do with ggplot is that you can not only specify x and y, but also specify a color.

01:31:59 Daniel Chen
And so color in here we're saying color the points by species. This is again why having a tidy data set is really important because I can point to a column. If you can't point to a column.

01:32:12 Daniel Chen
To do something, you probably have to do some pivot, longer, wider transformation.

01:32:18 Daniel Chen
And again, we get the same scatter plot, but now you can see you can very quickly see there's

01:32:24 Daniel Chen
Our points are colored, and it's kind of nice that it's so zoomed out because you can see a lot of the blue points are here, and then the red and green are mixed together. But if this was a machine learning modeling problem, you can almost draw a straight line down here and it will separate one set of penguins from the other.

01:32:43 Daniel Chen
And again, that's why visualizations can be really powerful because you can say, okay, whatever blue is, which is the Gentoo penguins, so those are just bigger penguins. We can have one model to separate those penguins, and then we can do something else with what's left because this part might be a harder problem. So it's okay to do a lot of these things in steps. You don't have to do everything in one go.

01:33:11 Daniel Chen
In ggplot, there's another layer to add labels, so you can see the labels can be a little bit more human readable.

01:33:19 Daniel Chen
And again, those are things that sort of work towards polishing your figure. You can add themes and get rid of the background like that. Those are all aesthetic themes. The easiest way to deal with that is once you have this code, just have the LLM paste it into ChatGPT and say, I have this code.

01:33:41 Daniel Chen
Get rid of the back, the gray background. Even if you paste that in, there isn't really

01:33:49 Daniel Chen
If you're just pasting it into the chat interface

01:33:53 Daniel Chen
Other than the variable names, there isn't really a data leakage problem because it's all just the code. That's just the column names. Sometimes, depending on the company or workflow, the column names could give something away. But if it's something like the width and length of a tumor

01:34:12 Daniel Chen
Size reading, like that, there's nothing in the actual column name that gives anything away.

01:34:20 Daniel Chen
So you're, I would say there are certain things where data, yes, they always think about data privacy, but if you're just copying and pasting the code itself, there's nothing in this code that will de-identify patients. So that's when I say

01:34:33 Daniel Chen
If you're trying to polish up a figure, copy paste this and just paste things back and forth, or use the agent to help you clean things up. That's kind of how I work now. I get the main figure and then I just talk to the AI to get it polished and ready for final presentation. Or if you're just in data exploration mode, just leave it like this because you just need to get a sense of what's happening. And that's also okay.

01:35:01 Daniel Chen
Different types of variables. So if you're just working with one

01:35:04 Daniel Chen
One particular variable, so I only care about body mass, but maybe I care about another categorical variable.

01:35:11 Daniel Chen
But if it's just body mass that I really care about, that is an example of one variable. It is continuous. You are looking at a histogram.

01:35:23 Daniel Chen
Most of these, like I know, this course right now is talking just mostly about the code. But there

01:35:30 Daniel Chen
Again, fundamentally, you have to know what variable you're working with.

01:35:34 Daniel Chen
What type of information is coded in that variable, and is that in a tidy form that you can work with?

01:35:45 Daniel Chen
When you are working with a categorical variable, island is.

01:35:50 Daniel Chen
A category. So this could be sex, which is a category. It could be stages of disease. Those are going to be categories. You can get a count from it. Typically, what you do when you get a bunch of categorical values is you're trying to count them. And so again, you can count the category. The categories themselves can have a color associated with them. And so you can actually fill the bars by another categorical variable if you want to as well.

01:36:15 Daniel Chen
So this is an example of a stacked bar chart.

01:36:19 Daniel Chen
There's a way where you can

01:36:22 Daniel Chen
It's called a dodged bar chart where you can get another group instead of the bars stacked on top of one another; you can get them next to one another.

01:36:31 Daniel Chen
It is a very one-word change that you make into this code, and then you can sort of get that view as well.

01:36:39 Daniel Chen
Again, the main reason for that is, do you care about the total counts and the rough breakdown, or do you actually care about the counts for each breakdown? It really depends on what you actually care about, and when you're doing the data exploration phase.

01:36:54 Daniel Chen
It's totally viable to just make all of the plots because you're looking at everything. And so it's not—I'm not saying like the stacked bar chart is the only good version of a bar chart.

01:37:08 Daniel Chen
There are many cases where a dodged bar chart is used, where you want the bars next to each other because you want to actually look at the height of each category breakdown, like that's actually important.

01:37:30 Daniel Chen
Yeah.

01:37:30 Speaker 1
I've never used geom call.

01:37:40 Speaker 1
Hold on.

01:37:41 Daniel Chen
Gg plot. Geom call.

01:37:48 Daniel Chen
It might be the same thing. There is a chance that it is the same thing. It is the same thing.

01:37:53 Daniel Chen
Yeah. Um.

01:37:58 Daniel Chen
They both make bar charts. You're right. You're not hallucinating geom_bar.

01:38:08 Daniel Chen
Geom_bar, and this is just because I'm looking at the codeGeombar.

01:38:13 Daniel Chen
Geom_bar, when you give it, what you give it is just one column of values, and it will do the counting for you. So if you give it a column of species, it's going to say, okay. You gave me a things that said Gentoo Adelie Chinstrap, and it's going to say Gentoo three Adelie two chinstrap one.

01:38:34 Daniel Chen
Geom_bar does that calculation for you.

01:38:36 Daniel Chen
And it's right here in this part that says stat equals count.

01:38:40 Daniel Chen
In geom call, it says stat equals identity. So my guess is when you use geom call, you have to give it two columns. You have to already precalculate the counts.

01:38:51 Daniel Chen
And then you use geom call.

01:38:54 Daniel Chen
And the reason why I've never used geom_col is because it sets that equals identity when I use geom_bar. You can overwrite one or the other.

01:39:03 Daniel Chen
So they all again, coding is weird because it does.

01:39:07 Daniel Chen
You can have multiple ways of doing the same thing.

01:39:10 Daniel Chen
I've never used this before, and I can still get the same answer as you. Why might that exist?

01:39:18 Daniel Chen
You kind of.

01:39:22 Daniel Chen
Now the question is, which one of these is my slide?

01:39:26 Daniel Chen
Right.

01:39:27 Daniel Chen
How might you end up in that scenario? Maybe you've already done this step, which is the frequency count. Why are you having the computer recompute everything?

01:39:38 Daniel Chen
If you were given this, this is probably why you would use geom call or geom bar stat equals identity. Because I would say x equals species, y equals n, and then it will just draw the height already because it's already done this calculation.

01:39:55 Daniel Chen
It will manually go and recount everything. If I did it this way, Adelie for species would only get three because there's only three rows. You don't want to use geom bar and recount a table that you've already summarized because then the bars and the counts won't look right.

01:40:18 Daniel Chen
Cool.

01:40:20 Daniel Chen
Are we on time? Fifteen minutes, I think.

01:40:23 Speaker 1
Cool.

01:40:36 Daniel Chen
This will set everything up for our next class.

01:40:40 Daniel Chen
Again, the most important thing that we talked about today was cleaning up your data set because you get to point to actual columns. That's really important for processing your data, visualizing your data and then also doing the modeling for your data because you're essentially going to say, this is the variable I want to predict. These are the variables I want to use as inputs or predictors. And you can't actually point to a column.

01:41:04 Daniel Chen
The model won't know what to do with it. And in R, it makes it even clearer. We're like, if you can't specify that, that's not even how you specify a statistical model. So you have to be able to point to the columns as the inputs or the output. Depending on where you're coming from, inputs are called predictor variables. They're also called independent variables, or the X's. And then the variable that you want to predict is either called a Y.

01:41:36 Daniel Chen
The response variable, or the dependent variable, depending on where you took a stats course in the past. So those all mean the same thing.

01:41:48 Daniel Chen
In R, it's a little bit easier to decide. It's the thing on the left versus the thing on the right, and the thing on the left is what you're trying to predict.

01:41:57 Daniel Chen
In general, there's at least three types of questions. But in general, when you're trying to make a prediction model, you're either predicting a number or you're predicting a group, like a category. So you're either saying, "Is this person going to die? Yes or no."

01:42:16 Daniel Chen
Is this person going to get stage one, two, three, or four of this particular disease? Those are categories. Or you're saying, given this, I think this person is this particular age.

01:42:31 Daniel Chen
I don't know. It's been a while since I've worked with medical data. These sets of inputs, I predict their albumin score is going to be this particular number. It is a continuous variable.

01:42:46 Daniel Chen
It's the same concept with visualization. You have to know what is the data type that's being stored in that number, or in that particular variable, because that goes into what type of model you're trying to predict. If you're thinking about a lab score value, those are not categories. The model will go insane because it's essentially going to say, 'Oh, you have an infinite number of possible categories that I'm trying to predict,' and it's not going to be very happy.

01:43:12 Daniel Chen
It's one of the big first decisions you want to work with when you're trying to do modeling with your data, and again, take it back to some of the tidyverse stuff we talked about: is the data clean? Maybe you select only the columns you care about, and then those are the columns that are going to go into your actual model.

01:43:36 Daniel Chen
It's okay to do all of your data cleaning, do all of your visualization, and then re-filter and select all of your data right before modeling. That's also okay. It's not like all of the data has to be processed in one place. Once it's there, you can't touch it again.

01:43:52 Daniel Chen
It's a very cyclic process when you're working with data.

01:43:58 Daniel Chen
So

01:43:59 Daniel Chen
The way that R essentially takes, you give it information, like when I said the thing on the left and the thing on the right. There's a tilde symbol, so this is shift and then the key to the left of the number one.

01:44:12 Daniel Chen
Again, one of those keys that you probably don't really type in normal

01:44:16 Daniel Chen
Non-coding world.

01:44:18 Daniel Chen
And the thing to the left, that is the variable you're trying to predict. And the thing on the right is those are the inputs that you're trying to use. So in this particular case, I'm trying to predict the price of a house in Sacramento, California, based off of the square footage.

01:44:31 Daniel Chen
And is this a number? Is price a number or a category? It's going to be a number. It's like a dollar amount.

01:44:40 Daniel Chen
The only thing that actually matters is the type of variable on the left-hand side. Because price is a number.

01:44:49 Daniel Chen
Then this is going to be essentially a linear regression problem in this class. We're just drawing a straight line.

01:44:55 Daniel Chen
We're not. It doesn't matter if we add sex of the sales agent. It doesn't matter if anything on the right-hand side is a category. Not everything has to be a number on the right-hand side. The only thing that matters is what is the variable you are trying to predict. And then that determines whether you are doing a categorical type of data modeling or numeric type of data modeling.

01:45:22 Daniel Chen
And so here's our data set. We have it's okay if things like overflow a little bit. We have Sacramento. We have the zip code. We have the number of bedrooms, number of bathrooms, then the square footage, the residential, commercial, the actual price, the latitude and longitude. So in this particular case, we're saying

01:45:42 Daniel Chen
Is there a relationship between square footage and price? And typically, yes. The bigger something is, the more expensive it probably is. You might have some outliers, but in general, that's the process.

01:45:53 Daniel Chen
And so again

01:45:55 Daniel Chen
Don't just start modeling right away. You could make a scatter plot. You have two numeric variables. Draw a scatter plot.

01:46:03 Daniel Chen
And you can kind of see already. If you're working with two variables, it's very easy because if we are three-dimensional beings, we can actually see two dimensions on a flat screen.

01:46:18 Daniel Chen
It gets harder when you start visualizing more variables, but it's still possible. So don't just say, don't get into the realm like what happens with a lot of my undergrad students is, we only can visualize like two things, so I'm only going to put two variables. Like that's not true. There are very there's.

01:46:36 Daniel Chen
You can use all of your CBC values from a lab result to predict something.

01:46:45 Daniel Chen
Again, we'll talk more about this on Wednesday. But essentially, the way that this works when you're fitting a linear regression model, if you remember back in middle school, high school, like y equals mx plus b, like the formula for a straight line.

01:47:02 Daniel Chen
This is essentially y equals mx plus b, but written as a statistician. So we have y is the variable we care about. The thing to the left of the tilde. The mx is now beta one, and then the x is the variable that we care about. So square footage, and then the plus b is this beta zero. Statisticians will write it this way. The reason why they do it this way is because it's essentially y equals.

01:47:31 Daniel Chen
M one x plus M two x plus M three x plus M four x plus b, right? And so, they just write the b first.

01:47:38 Daniel Chen
So that's how this formula allows you to have multiple variables to go and draw a straight line. Once you have a line that's in the fourth dimension, you just can't look at it anymore. But that's okay. You can still fit a model. It still works.

01:47:58 Daniel Chen
The way the code works is

01:48:00 Daniel Chen
Here's your

01:48:02 Daniel Chen
Here's your y

01:48:03 Daniel Chen
And here's your m, one of the m's. The b is part of

01:48:09 Daniel Chen
You essentially let the computer calculate that part of the line.

01:48:13 Daniel Chen
So this part is really important because if your data wasn't tidy, you wouldn't be able to point to the columns that you want as inputs.

01:48:22 Daniel Chen
This is the variable I care about.

01:48:25 Daniel Chen
And we'll talk more about this breakdown.

01:48:29 Daniel Chen
In the next class, this is how you specify what is in your model. Here's my dataset.

01:48:36 Daniel Chen
Called Sacramento.

01:48:37 Daniel Chen
This is the actual variables I care about. Don't worry about the rest of it.

01:48:43 Daniel Chen
We're fitting a linear model.

01:48:45 Daniel Chen
And this is the part that's really important.

01:48:49 Daniel Chen
We're fitting a regression model, which means the thing that we're trying to predict, in this case, price, is a number.

01:48:57 Daniel Chen
The other way this can be done is if that's a classification. That will be an actual category, right?

01:49:04 Daniel Chen
That's sort of why it's really important to know what is the thing that you're trying to measure, even if it's something. And typically, the example you'll see because it's pretty much like the

01:49:17 Daniel Chen
The first biostatistics method that you use.

01:49:21 Daniel Chen
You typically look at a binary outcome as the easiest type of model that's a categorical variable. It's did this person survive, yes or no? Did this person get the disease, yes or no?

01:49:31 Daniel Chen
That yes or no is a binary outcome.

01:49:35 Daniel Chen
And we'll talk about that on Wednesday. The rest of this here is just a bunch of code that says I'm trying to put the model with the data and put it all together and make an actual model. So like all of the machine learning.

01:49:50 Daniel Chen
Model fitting is happening here, and then what you get back is a little table. In this case, it says 138.5

01:50:00 Daniel Chen
And all this is saying is for every increase, every one square footage increase

01:50:06 Daniel Chen
We would expect the price of the house in Sacramento to increase by 138.50.

01:50:13 Daniel Chen
That's how you read these linear regression models.

01:50:15 Daniel Chen
That's why these models get used in healthcare a lot because I can say that sentence. A lot of other fancier machine learning methods, which I believe you have a course on ML models later on.

01:50:28 Daniel Chen
They're essentially like you can't say that sentence. It's just like hey, I'm just gonna look around my the other points near me and take an average, and that's the number I'm gonna predict. Like that's not a very clean sentence that you can create.

01:50:42 Daniel Chen
So that's why linear regression and logistic regression are two very common models in biostatistics.

01:50:48 Daniel Chen
Because you can formulate a sentence that actually makes sense to a human.

01:50:52 Daniel Chen
And the relationship between the variables is actually very clear.

01:50:59 Daniel Chen
So I'll stop there for today.

01:51:05 Daniel Chen
If you open up GitHub Codespaces, wait the ten minutes, you should see something like this. And just for the last four minutes

01:51:15 Daniel Chen
Assuming I still have four minutes.

01:51:20 Daniel Chen
The right-hand side opens up into your little coding agent, and you could just start asking this question here. If you open the example file, you can say, 'Can you make a plot from the dataset that I'm using from the patients data?'

01:51:49 Daniel Chen
From the and I guess like this is hopefully this works

01:51:59 Daniel Chen
It's going to go and think. So far, this is kind of like not doing anything special. It's just like a chatbot that's already open to you.

01:52:08 Daniel Chen
It's using GPT six Luna. So if you're using OpenAI, that's probably something already there.

01:52:14 Daniel Chen
Here's the part that's actually what makes this a coding agent and very different from your normal interaction with AI. You can see it literally like read my file.

01:52:28 Daniel Chen
So this is where data privacy really becomes important, and don't put passwords in your code because it literally read my file and it made an edit to the actual file. I don't have to copy paste what I want. I can just ask it to do something, and it will go back and start doing the thing, and you get a nice little button that says, "Hey, I made some changes to your file. Do you want to keep it or not?" So it really does skip a step from your normal use case. It skips a step, but this is how most people who do agentic coding code.

01:53:02 Daniel Chen
They're telling it to do a task, and then it's just going and modifying the actual code. This is really nice, but it also means that you can ask it something, and then all of a sudden, it just gave you 500 lines of edits, and you're like, 'How do I manage this?' That's sort of the problem we have in AI.

01:53:22 Daniel Chen
But yes, if you use GitHub Codespaces, this is available for you for free through a certain amount. I think it's like 1,500 requests per month, so you get some amount, and then it will rate limit you. But hopefully, this will be enough.

01:53:37 Daniel Chen
To carry you on to the LLM portion of the class that you get with Raymond in a couple weeks.

01:53:44 Daniel Chen
See you in two days in the other building.

01:53:48 Daniel Chen
And the other thing I'll do is I recorded this, so in the site that I have for this lecture, the audio transcript and then the AI summary of it all will be there somewhere. So we'll be back.
