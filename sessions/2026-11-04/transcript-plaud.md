00:00:00 Daniel Chen
To like do the work for you. And then, worst case, I'll just demo it. But it just takes time. So a couple of housekeeping things.

00:00:14 Daniel Chen
If you are on the GitHub page

00:00:17 Daniel Chen
You should have a GitHub account.

00:00:19 Daniel Chen
The first thing that you are going to do is click on Code.

00:00:26 Daniel Chen
Click on the CodeSpaces tab. There's going to be a button that says 'Open up CodeSpaces' or 'Open up on Main.' Just click that.

00:00:35 Daniel Chen
And let it load. It'll take ten minutes, and then I'll talk about other stuff. When we are talking about the homework assignment bits, you can copy paste the homework assignment down. I think you already know about cloning things, like downloading things locally on your computer.

00:00:54 Daniel Chen
So you can do that. If there's no actual Git requirement in this particular course, and if you need access to the homework assignment and all this Git stuff doesn't make sense to you, click the download ZIP button right here.

00:01:08 Daniel Chen
And you'll get the actual homework assignment, and then we'll talk about what that looks like. So if Git doesn't make any sense, that's okay.

00:01:22 Daniel Chen
You have RStudio or whatever installed on your computer, then you'll be fine.

00:01:27 Daniel Chen
But yes, following along today, make sure you have code. You click on CodeSpaces and click the little open in main button right here.

00:01:39 Daniel Chen
The other thing. This is the actual course, rendered course site. If you need the link to the GitHub page, it's in the top right hand corner.

00:01:52 Daniel Chen
A couple of things that I've done from last lecture, lecture one. Hopefully, you've already clicked through it. All the slides and all those bits are on the left-hand panel. We'll go over the materials for lecture two. What I have also done is audio record the lecture in advance.

00:02:14 Daniel Chen
Sorry, last class.

00:02:17 Daniel Chen
And so, if you scroll down the left-hand side, there is a section called AI class notes.

00:02:22 Daniel Chen
If you want, here's the transcript of that lecture. If you actually need the transcript

00:02:29 Daniel Chen
If you want the AI summary of the class

00:02:33 Daniel Chen
There's a couple of summaries happening.

00:02:41 Daniel Chen
I have a voice recorder that's right next to my computer. This is what came out of it.

00:02:47 Daniel Chen
But I have access to an Anthropic account, so I also tell Anthropic

00:02:54 Daniel Chen
Given my transcript, can you summarize it? If you care about what's happening in the AI world, this is what Opus 5.5 will give based off the same instructions. I also have a computer at home running local models, so you can actually see some of the other local models. How they behave, how they're performing. I use it for comparison. You can also use it as comparison. What some of my students have used this for in the past was to scroll down and look at all the major headings and see if they understand what's there.

00:03:32 Daniel Chen
And if they don't, then they'll read into it. They've been using as do I understand this main concept? Yes or no. So all the concepts are kind of summarized.

00:03:42 Daniel Chen
The ones that come out of my end are probably going to be a lot longer because there's a section down here on the actual prompt that was used. This is the actual AI prompt that I feed the model, and it's probably a lot more in detail because I tell it to give me a lot more detail about what's happening in the transcript. You'll have that. You'll also have it for today's lecture.

00:04:07 Daniel Chen
Sometime by the end of the day today.

00:04:12 Daniel Chen
And so that's the course materials.

00:04:17 Daniel Chen
There's a section called local setup. So I know we'll be trying to demo things through CodeSpaces today.

00:04:24 Daniel Chen
Just to get you in a position so you can actually run one of the AI models. If you want to use it for your homework assignment, you totally can.

00:04:34 Daniel Chen
It's not that complicated.

00:04:36 Daniel Chen
I believe you should already have a GitHub account. You should already have R and probably RStudio installed. If you want to see the next thing after RStudio, there's an IDE called Positron. It's made by the same people.

00:04:51 Daniel Chen
Essentially, it's VS Code, which is what you see in CodeSpaces, but they put in a lot of the RStudio pieces.

00:05:00 Daniel Chen
So you have VS Code with RStudio kind of in one place. It's nice because if you ever have to work with Python code, it's also.

00:05:08 Daniel Chen
Set up to work with Python and R at the same time, so that's kind of nice.

00:05:12 Daniel Chen
If you are trying to do the homework locally on your computer, like not in CodeSpaces, this is probably the thing you don't have installed.

00:05:18 Daniel Chen
Which is click here

00:05:21 Daniel Chen
And there is a set of instructions for installing Quarto. Once you have Quarto installed on your computer, you can create the HTML and PDF files for your homework assignment.

00:05:35 Daniel Chen
The other thing.

00:05:37 Daniel Chen
For just making sure you have everything that's not on CodeSpaces. In CodeSpaces, I've done all of this for you, so you don't need any of this. But you should have tidyverse installed from last week.

00:05:50 Daniel Chen
Today we'll be talking about tidymodels, the data sets, the medical data sets that you need or come from a package called medicaldata. These other bits are just to make sure that some of the things are working properly. If you want, you can copy and paste this into your own RStudio console and install those packages, and then you'll be ready.

00:06:12 Daniel Chen
So install Quarto; it's a separate install. Copy and paste this. If you already have tidyverse, just copy and paste it anyway. It'll update, or just skip it, and that's totally fine.

00:06:26 Daniel Chen
I talked about.

00:06:28 Daniel Chen
I'm gonna try not to create more changes to the homework assignment.

00:06:35 Daniel Chen
If you are working in CodeSpaces

00:06:39 Daniel Chen
And you know your way around Git, so I'm going to assume no. There's a set of instructions down here for Git. You don't need it.

00:06:50 Daniel Chen
If you want to save the state of today's lecture and class, there is a way to make a copy of the repository into your own account in GitHub.

00:07:03 Daniel Chen
I'm not going to delete it, but on some off chance, if I delete the repository, you still have a copy of it. The only tricky thing is if I make changes, you have to do a little bit of button clicking and work to get those changes in your own copy.

00:07:22 Daniel Chen
But yes, so you can click on Fork. It's this button right here.

00:07:33 Daniel Chen
This will make a copy of the repository into your own account. So instead of my username and MEDI 504A, it'll be your username 504A, and it'll be your account. If I make changes, there will be a button here that will say Sync from Upstream, and if you click that, it'll take my updates and update your repository. I'll try really hard not to touch the homework assignment files, but that's the button you can click to get that all working.

00:08:06 Daniel Chen
Okay,

00:08:09 Daniel Chen
Is everyone's CodeSpaces up by now? Hopefully, it's up by now.

00:08:13 Speaker 2
I saw fork and then the CodeSpaces on my fork.

00:08:17 Daniel Chen
Either one works for today, but if you want to work in your own copy, then it will be open in CodeSpaces in your own fork. You don't need that for today.

00:08:27 Daniel Chen
What is happening here?

00:08:35 Daniel Chen
That's okay. I think mine is probably dying as well. I have others.

00:08:41 Daniel Chen
Mine might be.

00:08:43 Daniel Chen
Do we have to wait for mine?

00:08:46 Daniel Chen
We probably do have to wait for mine as well. I would leave yours open because sometimes it will.

00:08:55 Daniel Chen
What happened here is it will go to sleep and then close itself. Leave yours open so it doesn't do what's happening to me, which is I have to wait for it to load up again. The second time you load it up should be a little bit faster, but I think that'll be okay.

00:09:22 Daniel Chen
Yeah, yeah, okay.

00:09:26 Daniel Chen
Do I need the repository? I do. I do need the repository. We'll just wait for mine to set up.

00:09:54 Speaker 2
Actually, I know what I'm going to do.

00:10:03 Daniel Chen
We're just going to pretend this is CodeSpaces.

00:10:08 Daniel Chen
Okay,

00:10:09 Daniel Chen
This is what Positron looks like. The main difference you'll have is if you've worked in our studio before, you notice that there's a variable viewer that's really common in our studio. Essentially, this is Positron where they put that in VS Code. You won't see this in your code space because it is technically a different tool. But that's what the RStudio folks have done: they took the VS Code base and added a bunch of features that you probably are used to from doing data science work.

00:10:43 Daniel Chen
Give me one second.

00:10:47 Daniel Chen
Yes.

00:10:48 Daniel Chen
Okay.

00:10:50 Daniel Chen
Positron looks the same. There's the console and the terminal. That's what you see in the RStudio side as well. You have a variable viewer on the right hand side. There's a plot viewer on the right hand side, and that's great.

00:11:06 Daniel Chen
If your CodeSpaces is working, there's a file called example.

00:11:13 Daniel Chen
And all we need to do, if you're in Positron, there is a button at the very top that says Preview. That's essentially what our studio gives us.

00:11:22 Daniel Chen
If you're in CodeSpaces and you don't see it, you have to open up the Command Palette, which is Control+Shift+P.

00:11:30 Daniel Chen
Or Command+Shift+P, or Apple+Shift+P

00:11:33 Daniel Chen
And it will open this little drop down. If you forget that keyboard shortcut, you can click this little button right here.

00:11:39 Daniel Chen
If you do click the button, the command palette begins with this greater than symbol. You can see when I type greater than, the options kind of change. If you forget the keyboard shortcut and just remember to click this button to open up the dropdown, make sure you type the greater than so it knows it's in find a command mode.

00:11:58 Daniel Chen
And all you need to do, and you'll need this for your homework assignment, is if you have Quarto installed, there's probably a Quarto extension that you have to install or if you're in, you can also do this in our studio.

00:12:12 Daniel Chen
There's a render or preview button.

00:12:17 Daniel Chen
And when you do that, I have it set up where you have to render the HTML and the PDF.

00:12:25 Daniel Chen
There is an option to say render all, and what this will do is it'll take this particular document

00:12:31 Daniel Chen
And run the code, capture the output.

00:12:35 Daniel Chen
Create the HTML view and the PDF view, and then hopefully those three files exist on your computer, and that's what you will submit for part of your homework assignment. If you are missing one of those files

00:12:49 Daniel Chen
It's okay. We are still mostly going to be grading. There are fallbacks on what to grade, but part of this is to get everything set up. Since this is a research class, base class.

00:13:03 Daniel Chen
If you ever have to write a report or make a whole website or presentation, this is all using a system called Quarto, where we are capturing code and output, and it's reproducible because I can run all the code from top to bottom and write the prose text, like the explanation. It's right next to the code, and it's all together.

00:13:25 Daniel Chen
So that's the sort of example we'll be working with.

00:13:32 Daniel Chen
In that's the example file that has everything working.

00:13:40 Speaker 2
So do we have to download the extension first?

00:13:45 Daniel Chen
If you're in Positron, you don't need the extension because it comes with it.

00:13:49 Daniel Chen
But if you're in VS Code

00:13:52 Daniel Chen
That's not in CodeSpaces.

00:13:54 Daniel Chen
On the left hand side, there is a button called Extensions.

00:13:58 Daniel Chen
And.

00:14:01 Daniel Chen
There is a if you look up Quarto

00:14:07 Daniel Chen
The Quarto extension will be there, and you will click the little install button. I already installed it in CodeSpaces.

00:14:14 Daniel Chen
That all of that's already set up for you. But if you install Positron, I believe it already comes with it. But if you don't have Positron and you're using VS Code, then you have to set it up yourself. But if you're doing this homework assignment through our studio.

00:14:30 Daniel Chen
And you have Quarto installed, then you can click the render button in our studio.

00:14:36 Daniel Chen
As well.

00:14:37 Speaker 2
When I press the Quarto render button, it says there was an error.

00:14:42 Daniel Chen
What error does it say?

00:14:43 Speaker 2
False. I lost it for a second. I'm not sure enough right now. But it was like an error in loading or downloading. Did it download the packages?

00:14:58 Daniel Chen
Is the error message a "can't find a file" or "can't"? When you see it

00:15:09 Speaker 2
Save it. Yes.

00:15:12 Daniel Chen
What is your?

00:15:17 Speaker 2
When I press, what happens?

00:15:20 Speaker 2
And then it stops my code space.

00:15:23 Speaker 2
I think it's already installed. Is there maximum running code space?

00:15:28 Speaker 2
Um.

00:15:29 Daniel Chen
That if you see the maximum code space reached error

00:15:39 Daniel Chen
That is what I ran into. So if you go to GitHub.

00:15:49 Daniel Chen
Dot com slash code spaces

00:15:54 Daniel Chen
You should at least be able to have one open. In a free account, so for me, I have like three right now. So if you end up in a maximum CodeSpace reach portion

00:16:04 Daniel Chen
If you go to github.com/codespaces.

00:16:08 Daniel Chen
In CodeSpaces, you can delete all of your other CodeSpaces, and that should open up how many you're allowed to have in your free account.

00:16:17 Daniel Chen
And that's probably why mine is failing.

00:16:21 Speaker 2
Was the one we are doing today the organic barnacle?

00:16:24 Daniel Chen
The name is randomly picked.

00:16:27 Daniel Chen
So for you it might say organic barnacle. For me it's something fiesta. Fuzzy fiesta.

00:16:33 Daniel Chen
But you'll see at the very top the place that is coming from.

00:16:39 Daniel Chen
So you should only have one of them.

00:16:42 Daniel Chen
And if you have multiple, delete them.

00:16:45 Speaker 2
I have one of them, and now when I click on it, it says stop in CodeSpace instead of setting up CodeSpace.

00:16:54 Daniel Chen
So I would wait for it to restart again.

00:16:59 Daniel Chen
Which is. This is.

00:17:04 Daniel Chen
How do you install Quarto?

00:17:10 Daniel Chen
How do you install Quarto? Install Quarto where?

00:17:12 Daniel Chen
Like on your computer or in CodeSpace? Quarto's already in the CodeSpace.

00:17:19 Daniel Chen
But if you need to install it, there is a like. Here's the Quarto website.

00:17:24 Daniel Chen
You'll go to current release, and then whatever your operating system is, you'll click and download it, and it's a regular program. Install it like you normally would.

00:17:37 Daniel Chen
Yes. I believe our studio actually comes with Quarto already, but I would say just install it so it's totally separate, and your life might be a little bit better that way.

00:17:50 Daniel Chen
But.

00:17:54 Daniel Chen
Quarto is the successor. R Markdown is still supported, but don't expect new features for it.

00:18:06 Daniel Chen
And I did see that five four five is a prerequisite, and you probably learned R Markdown in that course. I would say yes, things take time to update. All of the tooling is going to be really similar. So if you already know about our markdown files, Quarto is really similar. It's the same three backticks and a curly bracket for code cells. You have in our markdown like websites, blogs, documents are all like separate packages. In Quarto, it's all bundled in one giant thing.

00:18:37 Daniel Chen
And it's a little bit faster. And Quarto plays a little bit better with multiple programming languages, not just specifically in R. So that's sort of the really quick go to for that.

00:18:54 Daniel Chen
I'm going to try to move on.

00:18:57 Daniel Chen
We'll we'll we'll try to like

00:19:00 Daniel Chen
If you're trying to debug code spaces, we can talk about that.

00:19:07 Daniel Chen
So we will skip the review from last class.

00:19:23 Daniel Chen
So last class we talked about the tidy data paper and the tidy data chapter in R for data science.

00:19:39 Daniel Chen
There is in the paper they talk about this idea of an observational unit, like each table forms its own observational unit.

00:19:46 Daniel Chen
How does that play a role in

00:19:53 Daniel Chen
In data cleaning, like for your question, why Quarto over R Markdown is this slide deck comes out of Quarto without installing more stuff.

00:20:03 Daniel Chen
So that's kind of why. The way that this all works, we are using tidyverse to set this up. There is this in the original paper. It says each type of observational unit forms a table. That was the original definition. In the newer definition, from that most people talk about with tidy data, that third point is now each cell contains one bit of information, like that.

00:20:32 Daniel Chen
What is this notion of an observational unit? I'll go through a data cleaning process of how

00:20:41 Daniel Chen
If you already have a data set, typically it violates this particular rule. This point is trying to show you how data is actually stored, like how data might be stored in a hospital system. So typically, when you're doing analysis and you already have a data set that's already ready for analysis

00:21:01 Daniel Chen
They've already combined everything together to give it to you.

00:21:04 Daniel Chen
But sometimes you have to know why things or where things need to be combined from if you're really trying to put together your own data set. The other reason why this point is important is sometimes you need to essentially save data back into a database, and this is how you will save data into a database, not just a single CSV file, if that's what you're working with.

00:21:30 Daniel Chen
So we've already seen the in the tidy data examples last class, this billboard dataset, and the way we clean it up was using pivot longer.

00:21:42 Daniel Chen
We fixed out the WK one to WK seven seventy two with the ranking and the tidy form of this data set looks something like this, where each row is the ranking for a particular song for a particular week that song was on the Billboard chart.

00:22:05 Daniel Chen
Okay, so the problem we have here is if you're thinking about how efficient this data is being stored. This information that I have selected—year, artist, track, and time—you can see it's being repeated, almost like it can be repeated 72 times per song. So if you're thinking about data storage

00:22:27 Daniel Chen
That's really inefficient. Why are you storing the same information 72 times?

00:22:31 Daniel Chen
That can all come from data. If you're working and modifying data, that's also kind of scary because if you need to make a change to the spelling of something—that's essentially seventy-two spellings that need to get updated, right? You have to make sure that you're changing the thing correctly seventy-two times.

00:22:57 Daniel Chen
That also means that what happens if you have in a given year two songs that have the same name but they're by different people, right? So that changing of.

00:23:09 Daniel Chen
The track name. If you have to fix a spelling, you could make a mistake there. You might just say all of them are going to be renamed but miss the fact that it's by an artist.

00:23:19 Daniel Chen
So that's going to be a problem that you might want to think about if you're thinking about storing data. But this data set that we have now, if you're thinking about doing analysis and fitting models, this is the form of data that you need for doing any type of analysis. We're now sort of leaving the realm of what tidy data means for an analyst and what tidy data means for storage purposes.

00:23:45 Daniel Chen
So

00:23:47 Daniel Chen
The way we essentially break this up is we see that this information is duplicated. Without thinking about code, the way I would do this is to reduce the duplication. I just want a data set that says song ID number one, and then this is all of the information associated with song ID number one. If I can replace all of this duplication with song ID one, then my analysis data set becomes a lot smaller.

00:24:18 Daniel Chen
And there's less duplication, almost no duplication. The only duplication is song ID.

00:24:23 Daniel Chen
So when you are breaking this data set apart, you need an ID column, and then the rankings, the ID data set, and a rankings data set. It's really similar in hospitals where you have a patient's data set and then whatever happened in an encounter.

00:24:41 Daniel Chen
All of the demographics for the patient should exist in one place. So if you have to change their birthday because it was a mistake, you don't have to worry about changing it across all of the other encounters.

00:24:53 Daniel Chen
It's already synced to the patient ID number. So whatever is happening in the patient's data set should update everywhere else. That's essentially the problem we have.

00:25:06 Daniel Chen
So the first thing that we need to do is

00:25:08 Daniel Chen
Let's take that tidy data set, and for artist, track, year, and time, let's just make sure that we drop all the rows where those are not unique. And then what we could do is we can add a new column that is like the easiest way to do it is like whatever row number you are, like that's going to be your new ID. Essentially, it's a really similar thing that happens in a hospital. A new patient comes in, you probably have a medical, like an MRN or a medical record number.

00:25:40 Daniel Chen
And it probably just increments by one, and that's the new patient that this hospital has seen. And then MRN fifty three forty seven is now associated with this particular person.

00:25:52 Daniel Chen
And that's why MRNs are considered very private. With that information, you can pretty much identify all the other demographics and what's happening to that particular person.

00:26:05 Daniel Chen
But in here, what you can see is instead of seventy-two or ten versions of Tupac song, I can essentially say song ID one represents all of this information. If I need to make a change to the timestamp, then I can change it in one place and essentially reassemble the previous data set and do your analysis with updated timestamps.

00:26:33 Daniel Chen
So the first thing is to create the song ID table. That's the same thing as creating the patients table.

00:26:39 Daniel Chen
And then once you're done with that, you essentially join the tables back together. So there is I'm skipping a few steps here, but essentially you have a song ID. You're going to join all of that information back to the original table.

00:26:55 Daniel Chen
So you can see here, song ID just gets duplicated.

00:26:59 Daniel Chen
In this case, seven times. But what's not being, and then what we can do is all of this artist, track, year, time information. We can just delete.

00:27:12 Daniel Chen
So at the end of the day, did I finish this? I guess I didn't. At the end of the day, we would end up with a data set that's just.

00:27:22 Daniel Chen
Those one two three like those four columns, which is we have a song ID, we have a week, we have a date and a rank, and that would be our rankings dataset. And so, with our rankings dataset, we could, if we wanted to, join those two tables together based off of this ID to get this original table back.

00:27:45 Daniel Chen
So again, there's a dataset that you need for analysis because when you're doing the analysis, you care about the artists. You can say group by artist or group by track name, etc. But if you're thinking about data storage or how things are stored in a database, then you pretty much someone is going through this process of breaking up, finding all the duplicates, creating separate tables

00:28:11 Daniel Chen
Creating IDs for those tables so they can be stitched together later on. That has to do a lot with data storage and efficiency of storage because you're reducing the number of duplicates that's happening in your data.

00:28:25 Daniel Chen
So essentially, this is the same problem that you have in hospitals. There's like a patients data set with all the patients' their MRN number with all of their demographics. There's an encounters data set. Typically, that might what that would look like is you only have the MRN for a particular patient, and then whatever encounter happened, like they went into this department, like radiology, to take an X-ray, and here's their actual X-ray image, right? And that would be All that's needed in a particular encounter, and if you need to go back and figure out the person's age

00:28:57 Daniel Chen
You can combine the patients and encounters data sets together and then get the average age of people coming into this particular department getting an X-ray.

00:29:07 Daniel Chen
So that's all of the behind-the-scenes stuff that probably happens when you're just given a data set. But there are going to be many times when you need to stitch this stuff together.

00:29:18 Daniel Chen
A couple places you can play around with this on your own. There's this project called Synthea.

00:29:26 Daniel Chen
And what Synthea is, it's synthetic hospital datasets. It comes in CSV form as well, so you can actually just work with the structure of everything.

00:29:42 Daniel Chen
I guess my internet is really slow.

00:29:49 Daniel Chen
Okay,

00:29:51 Daniel Chen
I don't know why that's taking a long time.

00:29:54 Daniel Chen
Yeah

00:29:55 Daniel Chen
Maybe that's why CodeSpaces is kind of like half dying

00:29:58 Daniel Chen
Which is okay. I can still demo stuff, and the homework assignment is really easy. It's not that bad.

00:30:04 Daniel Chen
I promise you don't need IT.

00:30:07 Daniel Chen
But Synthea is really nice because it has different sizes.

00:30:13 Daniel Chen
Data sets that mimic what something might look like in a hospital. There are versions that have a hundred patients. It goes up to versions that have two hundred thousand or a million patients. So if you really want to simulate an actual hospital

00:30:26 Daniel Chen
You can. You have the CSV form of it.

00:30:29 Daniel Chen
I bring that up because Synthea also has HL7, FHIR, and CDA, CCDA formats, and those are the actual formats that get dumped and saved from the hospital. So if you want, you can actually load an HL7 form of the same data set. Essentially, that's how hospital systems, when they're exporting data, have the format that things are installed in.

00:30:53 Daniel Chen
Things are saved in CSV mode. We work with CSVs a lot in these intro courses, so you can still tinker around in CSV mode.

00:31:01 Daniel Chen
Which is a really nice way to just

00:31:03 Daniel Chen
If you're curious how a hospital might store data, not every hospital stores data this way, but that's a pretty common approach. Those are some standards.

00:31:12 Daniel Chen
The other thing you can use is.

00:31:16 Daniel Chen
There is from the OHDSI community. They have this project called the OMOP Common Data Model

00:31:23 Daniel Chen
And this is a project that tries. If your hospital follows the OMOP data model

00:31:34 Daniel Chen
What this allows you to do is your code that you write will do all of the analysis on this particular database that is using this particular data model.

00:31:46 Daniel Chen
And what you can do is then, if you can literally just send your code, like without all of the data, because patient data is really protected, like you can't just be emailing it around

00:31:56 Daniel Chen
But you can give your code to another hospital that follows this data model and run it, and they can run your exact analysis on their hospital system. This is how

00:32:06 Daniel Chen
This is one way a lot of multi-site metadata analysis can be done, but it requires that every hospital has its own data saved in its own way. This is one of the standards that people are agreed upon.

00:32:21 Daniel Chen
That includes standardizing. Are you using SNOMED or ICD nine and ICD ten codes? Not every country follows those codes, and so the OMOP Common Data Model has essentially a dictionary where if you have this particular ICD ten code, it maps to this particular code that they use in China. And you can actually do these international multi-site analyses.

00:32:47 Daniel Chen
That's that's coming from that particular project, which is really cool. So, the reason for showing all of this is it's it's nice to work in R or another language, and because now you can actually just email code to other people, and they can in theory run your code.

00:33:11 Daniel Chen
On another dataset without having to deal with this data privacy problem between hospitals.

00:33:20 Daniel Chen
All right.

00:33:26 Daniel Chen
This is Synthea. There is if you scroll down somewhere

00:33:31 Daniel Chen
There is a button for download somewhere.

00:33:36 Daniel Chen
You can download the files directly here. I think there's also an actual downloads page somewhere.

00:33:42 Daniel Chen
But yes, you can download the CSV files.

00:33:47 Daniel Chen
It's like here that this website does exist, and I'm guessing that if the internet was a little bit faster, I would dare to click around a little bit more. But that is a really nice place for tinkering with that. And I would say one thing that I've done is one of the reference materials that I have here is literally my dissertation project.

00:34:13 Daniel Chen
But in here I have a walkthrough for 30-day hospital readmissions. This is finding patients that came into the hospital with a heart attack or some version of a myocardial infarction.

00:34:31 Daniel Chen
And seeing if they come back to the emergency department within 30 days. This uses Synthea. You can see I'm using the encounters data.

00:34:38 Daniel Chen
I'm also finding somewhere in here. I'm also getting the patient data, finding the code that represents a heart attack, and then doing some analysis around that. So this is like a walkthrough of how you would put things together if you were given access to a hospital data set or a hospital database. That's how all of those pieces work together.

00:35:05 Daniel Chen
Okay.

00:35:08 Daniel Chen
How are we doing on time? I think we're doing okay on time.

00:35:15 Daniel Chen
Does linear regression?

00:35:19 Daniel Chen
Okay.

00:35:25 Daniel Chen
You're not using Synthea for your homework assignment because I'm not. I was like, I'm not going to try to give you a giant data set, but that is something you can definitely just tinker around with.

00:35:34 Daniel Chen
Again, those data sets are going to be in a separated view, so it might not be useful right away for immediate analysis. Because you might just work with the encounters data set, which is fine. But as soon as you're trying to say what is the population demographics given the people who are coming back within thirty days of a heart attack, then you're going to have to go find the patients data and combine that together.

00:36:03 Daniel Chen
So that's why I went through that previous slide deck. It's just a lot of these things are going to be separate data sets, even though you might be used to being given here's a full data set with everything put together. But that's usually because someone put that data set together for you, and that may or may not be the case that you have.

00:36:22 Daniel Chen
So I want to talk about linear regression and two really common modeling models that you'll be. This is like the first pass, the first model you'll try. I know you'll be taking a machine learning course, that's all fine.

00:36:42 Daniel Chen
The linear regression model and logistic regression models that we'll be talking about today

00:36:49 Daniel Chen
Those are a pretty good set of models to just if you ever are in a modeling phase

00:36:55 Daniel Chen
Those are pretty good models to try as your very first model. The reason for that is because when you go into machine learning, the whole point of machine learning is trying to find the best model of something.

00:37:06 Daniel Chen
Best is always in relationship to something else, so you need something to compare it to. These are very fundamental models that you can always compare and improve, like other models too. There are pluses and minuses to every single model you use.

00:37:19 Daniel Chen
Linear regression and logistic regression are very simple. They run very quickly, which is really good for you, especially if you have a lot of data. But it's also extreme. The interpretation is very easy to understand, and as you get into more complicated models, your ability to form a sentence that describes what is happening becomes really harder. And in a hospital context, sometimes that matters because if you can't explain it

00:37:43 Daniel Chen
Why are you changing some hospital policy or treatment plan?

00:37:47 Daniel Chen
In health analytics, the thing that really and also in financial markets.

00:37:55 Daniel Chen
Sometimes you're just not allowed to use some of the really nice models that startup companies get to use because you have to explain why your treatment is going to change for a patient. Same with financial markets, they have a lot of regulation around them too because they can only use certain models. If the market crashes, someone's responsible for that, and you better be able to explain what that is. Not just the computer made some random guesses, and this was the best guess.

00:38:27 Daniel Chen
And then so that's why the model is the way it is. I'm sorry, someone died. Like that is not a appropriate sequence of a rationale. So

00:38:36 Daniel Chen
So, linear regression, logistic regression, you'll see you can form very concrete, simple sentences that are interpretable.

00:38:45 Daniel Chen
And use that as a baseline for any other type of analysis that you work with.

00:38:50 Daniel Chen
We'll be talking about your homework assignment. We'll work on an actual medical data set, but I'm just going to use the examples that come out of the textbooks.

00:39:01 Daniel Chen
So one of the things that I mentioned at the end of last class, I think, was the single most important thing of figuring out which type of modeling technique you're using is what is the thing you're trying to measure or what is the thing you're trying to predict? Those are the same term. And then once you know that thing, can you point to a variable in the code and say, 'this is the thing you're trying to measure'? So that's why tidy data is really important, because if you're trying to form a model around something.

00:39:27 Daniel Chen
That thing you're trying to measure should be a column. If it's not, you can't point to it, which also means that your data is not tidy. So then you have to go through the process of cleaning up the data.

00:39:36 Daniel Chen
So in our case, we're trying to say I want to predict the price of a house

00:39:42 Daniel Chen
And price of the house is a column I can point to. The next question you ask yourself is what is the type of information stored in that column? Price is going to be a continuous value. It's going to be like a number.

00:39:56 Daniel Chen
Maybe it's a number with a big enough range where you can say yes, it's essentially like a decimal number.

00:40:03 Daniel Chen
It's sometimes you'll see studies where maybe they'll treat stages of a disease as a number when it's really not really a number. But you'll see something like that.

00:40:17 Daniel Chen
Things to keep in mind: like try to ask yourself, why are they doing it that way? They probably shouldn't be doing it that way, but there might be reasons. But that's the first important thing. What is the variable? Can I point to it? What is the information being stored?

00:40:29 Daniel Chen
So here, we want to look at price

00:40:34 Daniel Chen
And then everything else is going to be the predictors for that variable. So we can say, hey, I want to see how square footage relates to the price of a model. The other thing that we can do is we can actually put in categorical variables. So your inputs to a model or a predictor or the independent variables

00:40:55 Daniel Chen
They can be continuous or categorical. That doesn't affect the fact that you're using linear regression. So it's literally the only thing to the left, which is what are you measuring. That is the only thing that decides if you're using a logistic regression or a linear regression model.

00:41:12 Daniel Chen
If we're looking at type, you can see it is a categorical variable. There are three categories: is the house a condo, a multifamily, or residential? Here are some frequency counts around it. You can do bar graphs or whatever you need to figure that piece out.

00:41:26 Daniel Chen
This is also really useful. We're not talking about we're just trying to fit a model right now. But if you're thinking about whether this is a good model or how we can improve models, this is probably something you'll cover in a machine learning course.

00:41:41 Daniel Chen
This is problematic. In the sense that you can see that not all the frequency counts are remotely the same; it's imbalanced.

00:41:50 Daniel Chen
So that's also going to play a role in the quality of the data you have.

00:41:54 Daniel Chen
In healthcare, that's really important because if your entire study is around rare diseases.

00:42:00 Daniel Chen
You're going to have a problem because you're dealing with rare diseases. Your frequency counts are going to be very low.

00:42:11 Daniel Chen
Your rare disease is going to have a really low frequency count. For example, if your research question is, "I want to predict whether someone has this particular disease given all of these," like you come into the ER

00:42:23 Daniel Chen
I want to see what disease you have. Do you have this disease? Yes or no.

00:42:28 Daniel Chen
If it's a rare disease, you have this problem of the model can just say no, and it probably will get ninety nine percent of it right. But your whole point is, can you get the one percent right?

00:42:39 Daniel Chen
So that's one of the things you'll probably have to do in a machine learning course, around this class imbalance.

00:42:45 Daniel Chen
So keep in mind that's why we do exploratory data analysis. It's because you're trying to find where data could be imbalanced. The same thing with your emails and spam. If I get 99 emails, and 99 of them are not spam, and one email is spam. I can have a model that says everything. Just give you all the emails, and it will be ninety nine percent correct.

00:43:10 Daniel Chen
The accuracy of that model is ninety nine percent. But my whole point is writing a good spam filter, and you had one job and you couldn't do it. For that one email that actually mattered, you got a zero percent. A lot of machine learning courses will show you other ways of calculating how well something is doing.

00:43:28 Daniel Chen
But it's also highly tied to the frequency counts of what you have.

00:43:33 Daniel Chen
So we're not going to talk about that in this particular class. We're just going to tell you about how to fit a model, not how good this particular model is. That's why these things are really important.

00:43:42 Daniel Chen
When you are working with categorical variables

00:43:46 Daniel Chen
Regardless of whether you're using linear regression or logistic regression, you're going to hear this term called a dummy variable.

00:43:56 Daniel Chen
Essentially, what happens is

00:44:02 Daniel Chen
Categorical variables need to be compared to a reference because it's not an actual number. You can't say one unit increase of something is going to change the outcome by this many units. It's a category. There is no one unit increase. With categorical variables, yes, you can have it in your model. There is an extra step that you have to do. Luckily, a lot of the tidy models tooling will do this for you automatically. If you have a categorical variable that has five different levels, you might want to consider using a different approach.

00:44:35 Daniel Chen
And all of a sudden you're looking at the results of the model and you're like, why? Why all of a sudden do I have four numbers or five numbers? This is what's happening. It's your categorical variables that have been turned into dummy variables.

00:44:47 Daniel Chen
And when we look at the output, you'll see what this means.

00:44:50 Daniel Chen
Statistics folks will use dummy variables as the term that you see.

00:44:55 Daniel Chen
Computer science people will call this one-hot encoding. So if you hear or see any of those two words, they literally mean the same thing.

00:45:05 Daniel Chen
It's just who you're coming from.

00:45:08 Daniel Chen
So what is dummy variable encoding? In this particular case, the type of house has three different categories.

00:45:17 Daniel Chen
What's going to happen is we have three categories.

00:45:24 Daniel Chen
So we essentially do n minus one. We're going to create two new columns based off of those three categories. Those two columns are going to be

00:45:33 Daniel Chen
In this particular case, like the first one, the condo. You'll notice the condo is the first one that shows up. That will be treated as the reference variable.

00:45:44 Daniel Chen
And then every other new category becomes its own new variable.

00:45:49 Daniel Chen
So the other thing to keep in mind is you could do this process in your data cleaning process, but there's also data processing and cleaning that you need for modeling.

00:46:00 Daniel Chen
Data cleaning never ends. You're either cleaning it for your exploratory data analysis, but then when you're ready to fit the model, there's another data cleaning process that needs to happen.

00:46:10 Daniel Chen
Tidy models will handle some of these data cleaning processes for you, but that's why data cleaning never ends. When people say 90% of your work is just cleaning data, this is why. The modeling code you'll see is two lines of code, and that's all of the magic.

00:46:28 Daniel Chen
But how do we? What is happening, or why do we? What is happening with this dummy variable encoding?

00:46:36 Daniel Chen
If we treat these new columns as a single yes or no value

00:46:43 Daniel Chen
Then if we have this new column called type multi-family

00:46:47 Daniel Chen
Then a house that has a value of one will be a multi-value house. So if you're a condo, you're going to get a zero. If you're residential, you're going to get a zero. So it's almost like true and false. If you're a residential house, then you would expect every other value in this particular column is going to get a zero. And if you're residential, you're going to get a one.

00:47:05 Daniel Chen
So if you're a condo, which is the reference value, you get a zero in both.

00:47:10 Daniel Chen
So given these two, whatever you respond to, multifamily and residential. If you're a zero, then I can automatically infer that you're the reference condo value, and that condo value doesn't show up as a new column on its own because you can infer the column.

00:47:31 Daniel Chen
So that's why when you work with categorical variables, one of your categories is going to be missing. It's important to know which categorical variable went missing because that's going to be your reference value for how you interpret your models.

00:47:45 Daniel Chen
You can change it. R will just pick the first one that shows up automatically, but you can change your reference value. That's why one of those values is going to disappear. If you have something with fifty categories, figure out what the missing one is because that's really easy to glance over and you might miss it.

00:48:06 Speaker 2
Does it matter what your reference value is?

00:48:11 Daniel Chen
Or is it that's just like the reference zero? The model itself doesn't care what your reference value is. When you interpret the number, that the sentence you create

00:48:23 Daniel Chen
Will that matter? You'll see when I try to make a sentence out of the model.

00:48:28 Daniel Chen
How the reference model comes in. So sometimes

00:48:32 Daniel Chen
If you have four stages or three stages to a disease, your reference value should be stage one. We are comparing it to stage one or stage zero, like not having a disease. You don't want your reference value to be stage two in the middle. That's kind of weird.

00:48:49 Daniel Chen
But the way the math works out, it doesn't matter. The math will still work out, but now it's like, well

00:48:56 Daniel Chen
If I can't, this is kind of weird as a human to understand what's happening

00:49:00 Daniel Chen
That's when it matters. This is all the code that does all of the machine learning and the modeling. Fundamentally, that's it.

00:49:13 Daniel Chen
We're going to fit a linear regression model.

00:49:15 Daniel Chen
We are going to fit the actual model.

00:49:19 Daniel Chen
The model has we're trying to predict on price, and we're going to use square footage and type as our inputs, and then the data set that we have is the Sacramento data set

00:49:31 Daniel Chen
And that gives us the actual model object.

00:49:34 Daniel Chen
Tidy models has this nice handy function.

00:49:39 Daniel Chen
Most of the time, when you're looking at a model, you care about the coefficient table. If you're doing actual statistics, there's a lot of other stuff here like AIC, BIC, degrees of freedom, and all of the metadata around the actual statistical model. If you're trying to do an interpretive model, or if you're in a causal inference class or doing causal inference, you will care very much about those numbers.

00:50:08 Daniel Chen
But at the end of the day, most people, especially when you're looking at research

00:50:15 Daniel Chen
They care about the coefficient table.

00:50:17 Daniel Chen
And so this is there's a function called tidy

00:50:21 Daniel Chen
Tidy in the tidy models ecosystem. When you give it a model, it will give you a data frame of the results of the model, and that's really nice because I showed you a little bit about plotting yesterday. You can plot your coefficients.

00:50:39 Daniel Chen
As long as you have a data frame or a data set, you can save this out to an Excel table. You can save this out to a CSV table. It's a table without all the other bits and pieces.

00:50:49 Daniel Chen
Fundamentally, you work in tables as a data scientist or a data analyst. They've just made it a little bit easier to extract that table for you.

00:51:00 Daniel Chen
So really, all of the magic is this. This is again, we're back in data cleaning mode.

00:51:05 Daniel Chen
Trying to clean data. But all of this is fitting the model, right? And this line for linear regression takes not that much time. For other models, it can take minutes, hours, days. Depending on the model you're using, that's where all of the magic is happening.

00:51:24 Daniel Chen
So now we have this coefficient table. We have these estimates.

00:51:31 Daniel Chen
This where how do you construct a human-readable sentence, and this where the reference value comes into play. You'll notice that in the results of the model, we have three types: residential types. Or three types of housing, but one of them is missing. So condo is missing

00:51:52 Daniel Chen
Okay, and that's going to be the reference value.

00:51:55 Daniel Chen
Everything else

00:51:57 Daniel Chen
This estimate column is the number you're going to use to construct the sentence that makes sense.

00:52:03 Daniel Chen
If you're really in a stats course, you have a column for p value, you have your confidence interval. That's I'm going to punt that over to a stats course.

00:52:11 Daniel Chen
But if we're just thinking about the modeling section, we care about this estimate column.

00:52:18 Daniel Chen
And the way we interpret this estimate column? There are two types of variables that exist. There is a continuous variable and a categorical variable.

00:52:28 Daniel Chen
So here's the essentially the magical sentence you try to create. Don't try to make this sound more like English. This is the technical way of how you report like these model results.

00:52:41 Daniel Chen
If it is a continuous variable, it is for every one unit increase in that variable, we expect the outcome to increase by that number.

00:52:51 Daniel Chen
So that means that it's really important to know what variable you're you're using, what the unit of that variable is. Sometimes it's going to be like deciliter per like whatever the sample. If it's a blood value, sometimes it might be if they depending on how your data is put together, it might be standardized. So it might be like a z score might already be applied to a data set. In which case, one unit increase is going to be one standard deviation. It's not going to be one unit of like that blood value. So pay attention to what the variable is actually storing as a unit

00:53:24 Daniel Chen
Because sometimes it's not just like one unit of whatever unit is being used for that blood draw.

00:53:33 Daniel Chen
So for square footage, it's going to be that number is not standardized. No transformations happening to the number. So it's one square foot increase in size—that's what the square footage is.

00:53:45 Daniel Chen
For every one square foot increase in size, we expect the sale value to increase by 139.

00:53:51 Daniel Chen
That 139 is the number in the coefficients table. So if we come back here, where did 139 come from? It's that number.

00:54:00 Daniel Chen
So this is saying that the price is going to increase by 139 for every one square footage increase in a house in Sacramento. The other important thing is you're assuming everything else is remaining the same. We have multiple variables in here.

00:54:17 Daniel Chen
It is assuming you're in a condo, it's increasing by 139. Assuming you're in whatever, it's all as long as you're not changing two things at once. That's how you interpret that one number.

00:54:28 Daniel Chen
These models are useful because you might want to say for a particular condo at this size

00:54:34 Daniel Chen
Or like a residential type, can you give me a prediction of a price? Yes. You can plug in those values, but if you're just trying to interpret one of these numbers or how does this variable affect the outcome, you only talk about it in isolation without everything else changing.

00:54:52 Daniel Chen
So this is the copy paste: how do you interpret a linear regression model for a continuous variable?

00:55:01 Daniel Chen
That one unit increase still happens when you're talking about a categorical variable. But categorical variables

00:55:11 Daniel Chen
Like what is a one unit increase, right? Like, what does it mean if I'm going from male to female? First, like you probably don't have, unless you're doing like a sex transition data set, you don't have someone going from male to female in your data set.

00:55:24 Daniel Chen
What is a one unit increase in categorical terms? That's where the reference value is coming in. It's your reference value is the base, and then the one unit increases this other value compared to your reference value. So

00:55:41 Daniel Chen
In our outcome, we have a separate coefficient for multifamily and a separate coefficient for residential.

00:55:50 Daniel Chen
The one unit increase is we are looking at the number for multifamily. Multifamily that coefficient said sixty six thousand.

00:56:00 Daniel Chen
I think it's negative sixty six thousand. Negative sixty six thousand. This is saying what is a one unit increase? It is saying.

00:56:07 Daniel Chen
If compared to a condo, a multi-family house is going to be sixty-six thousand because it's a negative number less for a multi-family house than a condo in Sacramento. That's kind of weird, but that's what the data shows. So the data we have now is the most accurate. The key point is that the data from the original source is being used to support the claim. So that's how you interpret that coefficient number for multi-family. You're not really interpreting the type variable like on its own. It's each individual categorical variable gets its own coefficient.

00:56:39 Daniel Chen
Gets its own interpretation, and that's where it might matter which you pick, which variable you pick as the reference value. Because sometimes it's easier to say compared to those who are sick, or compared to those who are not sick.

00:56:53 Daniel Chen
One will be the reference value or not, depending on how. That's the only place where you can maybe fudge around with the sentence, but that also means the estimate will be different. The sign might be different. So it depends on what you're trying to measure.

00:57:06 Daniel Chen
So for residential

00:57:09 Daniel Chen
So I don't know what a multi is. This is like a detached multifamily house. I don't know what exactly that is. Why that would be insane because they're super expensive in Vancouver, but that's like a codebook question. Now for a residential, this is eight thousand two hundred fifty-three. The way we interpret this, it's yes, it's one unit increase, but it's going from condo zero to residential one. That is the one unit increase. We're saying compared to condo units, we would expect eight thousand two hundred fifty-three dollars more for a residential unit compared to a condo unit.

00:57:43 Daniel Chen
Assuming the square footage is the same.

00:57:46 Daniel Chen
Is how you interpret these numbers.

00:57:49 Daniel Chen
But at the end of the day, that comes from fitting this particular model, getting the actual data frame value out, and now it's your job to figure out how this variable is related to the outcome you're working with.

00:58:06 Speaker 2
Does it get more complicated to interpret if you have more covariates?

00:58:13 Daniel Chen
It doesn't. So when you're interpreting individual variables

00:58:19 Daniel Chen
You only interpret one number at a time, assuming everything else is the same. So this interpretation doesn't get any more complicated. The numbers will change.

00:58:29 Daniel Chen
And this when you get into like experimental design and like accounting for confounders and all of that. Like that, what you put into the model is a is going to be like your experimental. Like this what makes sense. Like you should probably account for demographics when you're looking at different patient populations.

00:58:48 Daniel Chen
But the way the math works out, the way you interpret the number itself doesn't change with more variables. The numbers will change. The actual numbers will change.

00:58:58 Daniel Chen
But this copy-paste skeleton of how you interpret that one number doesn't change.

00:59:05 Speaker 2
She added more variables after type, such as the number of people, the number of bedrooms, or the number of bathrooms. You can technically interpret all of those variables on their own as long as you look at everything.

00:59:22 Daniel Chen
So as you add more variables, this table just gets longer and longer.

00:59:27 Daniel Chen
And you'll get a separate number for each estimate. As you add more variables, expect the numbers to change because it's essentially accounting for all the other factors. If you take this into account, the numbers will be different.

00:59:43 Daniel Chen
You'll learn about confounding variables or in epi you'll learn about collider variables. There's sometimes variables that you do not want to put in a model because it will cause other problems. That becomes an experimental design problem.

00:59:57 Daniel Chen
Fundamentally, you're still fitting a linear regression model. The math is going to work out.

01:00:02 Daniel Chen
That's how you interpret it. Now it's your research thinking of why is a particular why are you adding that model in?

01:00:10 Daniel Chen
That is like a separate question, and that can become a machine learning problem when you're just saying I'm going to try everything.

01:00:18 Daniel Chen
Like yes, that slow that bleeds into like are you doing research? Are you just like doing machine learning? Like in my head, I separate those two things, but.

01:00:26 Daniel Chen
Fundamentally, you're still fitting this model.

01:00:28 Speaker 2
I think I'm a little confused about how to interpret that outcome or the price. Let's say you add more variables after type. Then how do you look at price because now you have like.

01:00:41 Daniel Chen
So if you're so the question, it fundamentally you're trying to. There's two things: are you trying to interpret one variable, or are you trying to predict the price?

01:00:51 Speaker 2
Predict the price.

01:00:52 Daniel Chen
So if you're trying to predict the price, you probably have a house already.

01:00:57 Daniel Chen
The information of the house, what is the square footage of the house? Is it residential? How many bathrooms are there?

01:01:02 Daniel Chen
You already have that information.

01:01:05 Daniel Chen
You literally plug it into the formula, and you get the mx plus b part. You're taking mx, which is square footage, as the m.

01:01:15 Daniel Chen
This number 139 is the x.

01:01:20 Daniel Chen
So you'll say if it's a thousand square foot.

01:01:23 Daniel Chen
Variable will account for 139,000 of the price of the house, and then you go to the next variable. Is this residential or multifamily? If it's residential, then you're going to add 8,253 to the prediction of the price, and then you know, like, I don't know, you just add it all together.

01:01:42 Daniel Chen
You also add the intercept, that's the baseline, and that's how you predict the price.

01:01:47 Daniel Chen
There's two things. Are you trying to interpret the variable, or are you trying to predict the outcome?

01:01:54 Daniel Chen
If you're trying to predict the outcome, then you should already have all the information out of it. Otherwise, what are you predicting? You're going to be like, this new person came in. Are they diabetic or not? And I'm like, okay, so what information do you have from them? If I already have a model, I should probably go figure out what are the inputs and go measure and calculate it.

01:02:17 Daniel Chen
But if you're trying to talk about the population or what the model is doing or what the model means, then you're just looking at one number at a time.

01:02:31 Daniel Chen
The intercept. It's like the baseline.

01:02:34 Daniel Chen
You're essentially saying what happens when all of the other values are zero. Sometimes that doesn't make any sense. So in general, you don't really see people trying to interpret the intercept as much. It's just part of the model. The best way I would like to think about it is to just combine short sentences into longer ones, while keeping the original words.

01:02:52 Daniel Chen
In this particular case, what happens? You have a condo of zero square foot. Maybe you're just saying this the cost of the land. Maybe that's what it means. But don't try to interpret the intercept as this the cost of the land. That's probably not true because you might need another model to measure the cost of the footprint of the land.

01:03:10 Daniel Chen
Which is a totally separate thing. So you'll see the intercept. It's important because you still need it to add all the pieces together to calculate the prediction, but don't really try to interpret the percent.

01:03:28 Daniel Chen
And then, if we want to do this in regular R, I showed you the tidy models way with a linear model and fit in R itself without installing any packages. There's a function called lm. I don't know if this is what you'll see in your later courses, so that's why I'm putting it here.

01:03:44 Daniel Chen
It's the same thing. You still see this formula that's going to be used. You still see the data. The function is going to be the base R version instead of the tidyverse version. You can still pipe it into tidy. You still get the same exact model, the same exact table, the same interpretation. None of that really changes.

01:04:06 Daniel Chen
And if we go into and since you brought that up, I.

01:04:12 Daniel Chen
I do have that slide from last class.

01:04:18 Daniel Chen
Okay, so this is the formula for like.

01:04:22 Daniel Chen
Hold on. Let's back up a little bit.

01:04:26 Daniel Chen
So this is the formula I showed for one variable. We have this essentially the stats way of saying y equals mx plus b. Y is the mx. This is the b. The b is the intercept.

01:04:39 Daniel Chen
So if we have more variables, it really

01:04:42 Daniel Chen
The math looks like this. This is y. This is b. This is mx for one variable. This is mx for another variable. Sometimes, if you have a categorical variable, this will be three things instead of one thing. But each one of these becomes a beta x.

01:05:01 Daniel Chen
And then when you use a model as a predictor, you find out all of the x values. What is the square footage? How many bedrooms do you have? Etc. And you do regular algebra, you already know the Bs.

01:05:14 Daniel Chen
The Bs is the numbers from the table, and then it becomes multiply, add, and whatever number shows up at the end is the predicted price.

01:05:25 Daniel Chen
So that's linear regression.

01:05:29 Daniel Chen
That works. You pick this particular model if you know the outcome variable you're working with is a number.

01:05:35 Daniel Chen
And this will work for anything. Could you use this to predict someone's albumin level given other inputs? Because albumin is a blood value that is a continuous variable.

01:05:46 Speaker 2
And you can totally do that.

01:05:53 Daniel Chen
All right

01:05:54 Daniel Chen
So the next type of variable is logistic regression

01:06:01 Daniel Chen
And logistic regression is the type of model or the easiest introduction to a model.

01:06:08 Daniel Chen
That works where your output variable is a categorical variable.

01:06:13 Daniel Chen
So there is the dataset that we're working with is like this little study called licorice gargle, and they're trying to say like, hey, if we make you gargle, I think what does it say

01:06:26 Daniel Chen
Licorice, or sugar water, do you get a sore throat after surgery?

01:06:31 Daniel Chen
And so what's coded in this particular dataset is

01:06:35 Daniel Chen
We have a column. Of your sore throat status after surgery, and you either have a one for yes or zero for no.

01:06:45 Daniel Chen
I would say logistic regression is again if you're doing machine learning if you're doing all these other things

01:06:52 Daniel Chen
You can always turn anything with multiple categories into a binary variable. If cancer has multiple stages, you can turn it into a binary variable of did you get cancer, yes or no.

01:07:06 Daniel Chen
Or it can be: Are you in stage one, two versus three, four? Any categorical variable can become a binary variable, even if it has multiple levels.

01:07:17 Daniel Chen
Like the example I just showed you with the house price, you can say something like,"We can turn that same exact data set and say,'Like, can we predict this to be a condo? Yes or no?'" Right. So even in the same data set, depending on the variable you pick, well, you can look at something else.

01:07:35 Daniel Chen
You don't always have to look at the price of the house. Given the price of the house, can I predict that this is a condo or not? That's a valid question. You have the data for it; it's tidy because you can point to the columns.

01:07:46 Daniel Chen
It's the thing that you're trying to measure or the thing you're trying to predict is a categorical variable, and we can use logistic regression. We can take the three different types of housing and just turn it into condo yes or no, or residential yes or no.

01:08:03 Daniel Chen
Anything can become a binary variable

01:08:06 Daniel Chen
And this is one of the easier ways of dealing with a binary variable. Right, the interpretation is easier. There's less weird caveats you have to say. I would say always try this first, and then just fit the improved model later on. This you'll see again. The code is very easy to fit this type of model. The interpretation is also very easy.

01:08:32 Daniel Chen
Once you have the skeleton for the structure, it's very easy to interpret, and that's why this is a good starting point.

01:08:41 Daniel Chen
So here is the actual data that we have.

01:08:44 Daniel Chen
There's some like we're just. I'm doing a few things where there's a sore throat status. It's given as yes or no, and I'm going to relabel it as yes or no.

01:08:56 Daniel Chen
There's treatment, so we're going to say hey.

01:08:59 Daniel Chen
Give zero the value of sugar, one for the value of licorice, and since treatment is a categorical variable, there's going to be dummy variable encoding. So this is going to say our reference value is going to be sugar.

01:09:11 Daniel Chen
So that's what's happening here.

01:09:13 Daniel Chen
In this particular case, we're going to have smoking status. So you have a model that has multiple categorical variables, and that's okay. You can just keep adding variables as needed.

01:09:28 Daniel Chen
Using continuous variables like BMI

01:09:32 Daniel Chen
That's going to be a continuous variable in this particular data set. The most important thing we care about right now is their sore throat status.

01:09:46 Daniel Chen
There's a column we can point at, and it's a categorical variable with only two categories.

01:09:52 Daniel Chen
It's easy to describe it as yes/no, but it could be anything, as long as there are two.

01:09:58 Daniel Chen
So here

01:10:00 Daniel Chen
We are fitting out logistic regression model. We're looking at the input type or the frequency count, and you can see here this is the same problem that I mentioned with class imbalance and the spam is there's a lot more no's than yes. So if we have a model and we just say no, it doesn't matter. Everyone no one is going to get a sore throat.

01:10:22 Daniel Chen
This model will be

01:10:24 Daniel Chen
What is this like?

01:10:27 Daniel Chen
Seventy-five percent correct, which, if you're just looking at accuracy numbers, that's probably not great.

01:10:32 Daniel Chen
Or maybe seventy-five percent is great, but you don't realize that it's the model itself is just saying yes to everything or saying no to everything. This is things you have to check for because the model will end up just saying no to everything if you have really big imbalances.

01:10:52 Daniel Chen
Our predictors again, it doesn't matter.

01:10:56 Daniel Chen
We have already decided or know this is a binary outcome, so we can use logistic regression. The predictors don't matter. We have treatments; it's got two levels, sugar or licorice. When we dummy encode it

01:11:10 Daniel Chen
We're only going to get one column back. It's always n minus one.

01:11:14 Daniel Chen
We have a continuous BMI, and that's the unit: kilograms per meter squared.

01:11:19 Daniel Chen
And then we have smoking status; it has three levels, but we'll end up with two. This is similar to the type of house that we have. The reference value is never. So we're comparing everyone to never smokers. The first level that we're setting is never. The way the model works is that whatever your first level is, it treats that as the reference value. There will be data cleaning that you need to do to change that if that's not what you want.

01:11:52 Daniel Chen
But in the data itself, there's never a status of three. So when you work, depending on how you're getting data, sometimes you're just given a data set of nothing but numbers and you have to look up in the codebook what these numbers mean.

01:12:08 Daniel Chen
And so this is like why you might end up cleaning and processing data again, and that's why trying to teach a course around like data cleaning is it never ends because there's so many different ways.

01:12:22 Daniel Chen
So again, fitting the model is really simple. Before it said linear regression, now we say logistic regression.

01:12:30 Daniel Chen
The formula and the fit is exact. The way we specify the model is exactly the same. There's a tilde, the thing to the left, versus the thing to the right.

01:12:38 Daniel Chen
Again, same exact setup, and that's why the running joke is machine learning is really not that hard. It's all of the other work around it.

01:12:49 Daniel Chen
We still run tidy, and we get a coefficient table. Even at this point, because linear regression is part of the generalized linear model family.

01:12:59 Daniel Chen
It's really similar. It's essentially like drawing a straight line with a transformation applied to it.

01:13:06 Daniel Chen
So this is when we get into a little bit of statistics, how do we interpret this number?

01:13:15 Daniel Chen
The way of

01:13:22 Daniel Chen
Logistic regression is really nice because it's a transformation of a straight line

01:13:34 Daniel Chen
And the problem we have is we only have values of zero and one in logistic regression mode, so we can't just draw an infinite square line because all of a sudden now we're predicting on values that are below zero and we're predicting on values above one.

01:13:49 Daniel Chen
And what does it mean if we have a prediction of 0.5? We only have two categories.

01:13:55 Daniel Chen
I can't be half male, or half residential. Housing is kind of different, but if you're a category, you just fit in one bin or the other.

01:14:04 Daniel Chen
So essentially, what's happening with logistic regression is we are taking the zero-one straight line and doing special math to make it look like this. Now the only options are zero and one. That's all that's happening here.

01:14:19 Daniel Chen
Where that shows up in the math is this piece right here.

01:14:25 Daniel Chen
That's as far as I'm going to go. You do this log odds transformation, and now everything is just bound between zero and one. That it says that is the transformation around the straight line.

01:14:38 Daniel Chen
If you do other types of modeling in the generalized linear model family, the GLM family

01:14:44 Daniel Chen
It's all some version of this. There's a straight line. We're going to apply a function to it to mangle the straight line to fit the data you have, and then when you interpret it, you have to undo that mangling. You're going to transform it to make the math work.

01:14:58 Daniel Chen
And then you're going to untransform it so you can say a sentence.

01:15:02 Daniel Chen
That's all that's happening. It's like Poisson models. That's all part of the GLM family. It's doing some transformation off of a straight line, and then you transform it back. You can make a sentence out of the actual results.

01:15:22 Daniel Chen
So the problem is, the interpretation is still the same. For every one unit increase in BMI

01:15:29 Daniel Chen
So BMI going from twenty six to twenty seven

01:15:37 Daniel Chen
We expect the sore throat like value to change by negative zero point five one seven. The sentence is still the same. It's just the units and the numbers make absolutely no sense because this number now represents the log odds. So the sentence is still for every one unit increase in BMI, we expect the log odds to decrease by zero point zero five one seven. The sentence is still the same.

01:16:04 Daniel Chen
But that sentence does not make sense as a human.

01:16:08 Daniel Chen
So we have to undo some of the math around it.

01:16:13 Daniel Chen
Luckily, in logistic regression, P over 1 minus P, that term is called the odds.

01:16:20 Daniel Chen
An odds is really similar to a probability. Think of it as the probability in your head, but it's not really the same. To get rid of the log portion, we exponentiate it. So we do more data cleaning. We say that you can say exponentiate equals true, or you can say give me this column, pass it through mutate, exponentiate this column. You can do it in multiple ways.

01:16:45 Daniel Chen
So all this, we get a new set of numbers, but all it's doing is exponentiating the original number.

01:16:52 Daniel Chen
And now we get, for every one unit increase in BMI, we expect the odds of getting a sore throat to increase, or the odds to change by point nine five times.

01:17:06 Daniel Chen
So the sentence is still the same, but now we say odds, or really an odds ratio. So if you ever heard of an odds ratio, it's probably because they're doing some analysis on a categorical variable, and that's probably true. And that's where odds ratios come in versus a continuous variable, and that's really it. Logistic regression models and a lot of epidemiology is based off of this. Everything is a logistic regression model.

01:17:29 Daniel Chen
If you've heard, if you've taken an epi course, everything's like a two by two table or some by two table, and it's because you're looking at a binary outcome, and everything gets reported as odds ratios.

01:17:40 Daniel Chen
The model itself reports the numbers as log odds, so you do another step to turn everything into odds.

01:17:47 Daniel Chen
So the way you interpret it is, the structure is still the same, but it's for every one unit increase in BMI, which is one kilogram per meter squared increase in BMI, we expect the odds of the sore throat to be multiplied by zero point nine five.

01:18:03 Daniel Chen
Assuming everything else is the same.

01:18:07 Daniel Chen
So one thing that's a little bit

01:18:10 Daniel Chen
And then the same thing with a categorical variable. We expect the odds of a sore throat for patients who gargle licorice compared to those who gargle sugar water to be 0.38 times, assuming all else is the same. So again, linear regression because it fits in this GLM family

01:18:28 Daniel Chen
The generic sentence of what you plug in is exactly the same. You just have to deal with this transformation on how to interpret the actual number.

01:18:41 Daniel Chen
So now, what does it actually mean? Oh yeah, and the same with multi levels. We kind of went through the same thing. It's always in relation to the reference value. So you have to know, for smoking, it's the odds compared to those who never smoked. So if you were a sometimes smoker or a current smoker, the odds of you getting a sore throat afterwards is four point three eight times higher.

01:19:10 Daniel Chen
Again, same interpretation. It's always in relationship to a reference value. This is where the reference value comes into play. Are you comparing it to never smokers?

01:19:22 Daniel Chen
Frequent smokers? In this case, it's probably easier to restructure your analysis around people who have never smoked compared to everyone else. You can swap out the reference value. You'll get a slightly different number, but the interpretation is the same. Then it's just like, as a human, can you make sense of that sentence?

01:19:44 Speaker 2
Is it possible to make a sentence about the reference value? Let's say someone is asking, what are the odds for someone who does not smoke?

01:19:54 Daniel Chen
So sometimes you do see scenarios where people don't put in the dummy, like they put in the reference value in the model itself. You don't always have to drop all of the models.

01:20:05 Daniel Chen
You don't necessarily.

01:20:09 Daniel Chen
Interpret the non-smokers on its own

01:20:16 Daniel Chen
In general, you could put it in the model. The math will still give you a number.

01:20:23 Daniel Chen
But in essence, when you're trying to create a model that is used for interpreting what is happening in the population at hand

01:20:36 Daniel Chen
You don't do that.

01:20:38 Daniel Chen
It's always here's your base. You're essentially saying here's your baseline, and everything is in relation to the baseline.

01:20:45 Speaker 2
You wouldn't ever ask about the baseline.

01:20:48 Daniel Chen
And then if you really care about the baseline, what you do is you turn frequent smokers as the baseline, and then you can say compared to frequent smokers, if you are never a smoker, this is how your odds have decreased.

01:21:02 Daniel Chen
Important thing: it's odds, which is P over one minus P. It is not the same thing as probability.

01:21:11 Daniel Chen
You kind of understand how to make sense of the sentence. You can maybe substitute the word probability when you're talking about odds ratios, but don't ever write it down because that's not true.

01:21:22 Daniel Chen
It is slightly different.

01:21:25 Daniel Chen
So in regular R, the way you do it is you call glm and then family binomial because it is two pieces of outcome, but then everything else is the same. Again, here's the code in both syntaxes.

01:21:41 Daniel Chen
What you're going to see.

01:21:42 Daniel Chen
The other thing around, and I don't

01:21:45 Daniel Chen
I had a slide and I got rid of it.

01:21:48 Speaker 2
Did I get rid of it? I think we're doing okay on time.

01:21:54 Daniel Chen
How are we doing on time? We're doing great on time.

01:21:59 Daniel Chen
We'll take a break soon.

01:22:00 Daniel Chen
We can take a break now. Come back at twenty-seven past the hour, and then we'll finish up.

01:22:11 Daniel Chen
And if you have problems with code spaces, we can deal with that. I need to make sure my code spaces is open.

01:22:17 Speaker 2
I don't know what my problem is. Do you have to do the fork in order to do the work?

01:22:27 Daniel Chen
Do you have to do the fork in order for it to work? You don't. But it depends on if you care about saving your homework assignment. Even then, you can copy paste the text, so you don't necessarily need to fork it.

01:22:40 Daniel Chen
You can totally do your assignment in RStudio. You don't have to use it. This is just here because I didn't know if you already had the stuff installed.

01:22:49 Speaker 2
So we like to do it as an R markdown.

01:22:51 Daniel Chen
You can totally do it as an R markdown. I think if you copy paste it, it'll all work the same. Copy paste like the QMD file. It should almost just work out of the box. You might have to delete the format line.

01:23:03 Speaker 2
That's so long.

01:23:07 Daniel Chen
It's long because I'm just telling you exactly what to do.

01:23:12 Daniel Chen
If you literally just follow the instructions, you will get through the homework assignment. You really like it.

01:23:18 Speaker 2
You just copy and paste. If you copy paste the homework assignment. And then I go to here, and then I close one, and then you. If you delete those.

01:23:30 Speaker 2
This Cordero format

01:23:34 Daniel Chen
But if you delete those lines, then it'll work for our markdown.

01:23:37 Speaker 2
Thank you. We don't need to use.

01:23:41 Daniel Chen
Save it as RMD instead of QMD.

01:23:46 Daniel Chen
Because I think our studio, when it sees QMD, is going to try to do Cordero stuff.

01:23:56 Daniel Chen
You don't need to use code spaces. I don't know why it's taking so long. The only reason I'm showing it to you is that you can literally just tell Copilot to do your homework for you, and it will probably be correct because I have so many instructions on how to get the right answer.

01:24:17 Daniel Chen
Install.

01:24:18 Speaker 2
Install.

01:24:20 Speaker 2
So you have to wait. But when I go, I want my AI to help.

01:24:25 Speaker 2
I want this. I want to copy.

01:24:28 Daniel Chen
You can. I might just open it in mine.

01:24:32 Speaker 2
If I press render, is it open though? This is a cool space.

01:24:39 Daniel Chen
I think. Render.

01:24:42 Daniel Chen
Corel render.

01:24:44 Speaker 2
I think you just do the homework. I put my name on it.

01:24:50 Speaker 2
What did we put before that? Start working.

01:24:57 Daniel Chen
You can leave it blank if you're doing it locally, and you can tell our studio to dump it out in HTML and PDF.

01:25:07 Speaker 2
Why is it not working? What happened? We were all getting the same error message. It's going away. What error?

01:25:21 Daniel Chen
Oh yeah, there it is.

01:25:24 Daniel Chen
But yes, when you click render, this will pop up and then you can click on render all formats.

01:25:28 Speaker 2
And it will start rendering. Just that. What? Any file? Just working right over here from the back.

01:25:48 Speaker 2
So that is rendering.

01:25:51 Speaker 2
Yes. Oh.

01:25:53 Speaker 2
So if you can see, you don't have to bear command.

01:25:57 Speaker 2
Oh my god!

01:26:00 Speaker 2
Hard. Can we open that?

01:26:03 Speaker 2
But I thought it had to do something else.

01:26:06 Daniel Chen
I think the render was supposed to give me another file.

01:26:10 Daniel Chen
It should give you other files.

01:26:14 Speaker 2
Wow, this is not usable.

01:26:17 Speaker 2
Oh yeah, it does say error encountered.

01:26:20 Speaker 2
Oh yeah, I had that. Why now it's working. I don't know.

01:26:31 Speaker 2
I'll just say it later. I think I'll finish your name. Definitely. I'll finish it here and then copy paste the R.

01:26:42 Daniel Chen
So here's your P. That's what I.

01:26:43 Speaker 2
That's literally what I did.

01:26:47 Speaker 2
My Instagram is. It's just Bitcoin. We gotta ask you guys.

01:26:51 Speaker 2
We should make a group chat. I think that's a good idea. Six point one four zero. But yes, this will eventually open the door. That's me. Thanks. Did it come up? Is it installed?

01:27:10 Daniel Chen
Looks like it because it says update.

01:27:15 Speaker 2
So you must have it already.

01:27:17 Daniel Chen
So if you end up with this is the first year I'm trying to use Copilot CodeSpaces, if you end up with problems with CodeSpaces again, you can totally do this homework assignment not using CodeSpaces.

01:27:33 Daniel Chen
My guess is you might want to delete the CodeSpace and have it reinstall and run everything again.

01:27:43 Daniel Chen
The problem is that it takes ten minutes, which is the super annoying thing about it.

01:27:47 Daniel Chen
I would say the one thing you could do is have one person do it if you actually really want to try out the AI thing, and if you just care about the answer, then share it with everyone else.

01:28:01 Daniel Chen
The homework assignment is like if you it is.

01:28:06 Daniel Chen
I think I wrote it in such a way where it's really not that difficult. I really hope it's not difficult.

01:28:11 Daniel Chen
You can even if you really want to. I think it is set up with.

01:28:16 Daniel Chen
I have so many instructions on it that if you just copy and paste it into normal ChatGPT, it probably will give you a decent running answer.

01:28:24 Daniel Chen
But, it's I the barrier for getting that homework assignment done is not very high.

01:28:36 Speaker 2
I love how there's a barrier.

01:28:41 Daniel Chen
You don't need code spaces for it.

01:28:46 Speaker 2
Wait, we're not really writing code.

01:28:50 Daniel Chen
Then you're barely writing code. You're like writing. You're like I. I think I even have it as like fill in the blanks. It's like fill in this one. Put the word that belongs in there.

01:29:03 Daniel Chen
Um.

01:29:05 Daniel Chen
So what I will do is pretend that I have code spaces open.

01:29:12 Daniel Chen
And we'll go through.

01:29:38 Daniel Chen
Lecture two: Interpreting religious. Cool. So let me.

01:29:43 Daniel Chen
At least demo what this should look like.

01:29:47 Daniel Chen
I have a Claude subscription, so I will do this through Claude. But minus that, this thing runs faster. The experience will look the same. The experience will be the same if you do it in Copilot or through Code Spaces.

01:30:06 Daniel Chen
And the reason why I'm doing it this way is just like

01:30:13 Daniel Chen
This is what actual agent coding looks like.

01:30:16 Daniel Chen
So yes, there's a lot of instructions here. It really is just instructions. Part of it was I just assumed you're going to feed this to the LLM. This is what I'm asking you to do.

01:30:27 Daniel Chen
But eventually you get to the part around running packages and things.

01:30:33 Daniel Chen
What is one thing I can do?

01:30:37 Daniel Chen
This is Positron. It has the same code block cells as our studio, so it feels pretty much the same.

01:30:46 Daniel Chen
Here's the data sets.

01:30:48 Daniel Chen
The first thing is here's the Ebola data set, and all I am asking you to do is this: using pivot longer, using pivot wider. Here's mutate. Go and tidy up the actual Ebola data set.

01:31:06 Daniel Chen
So if we look at the Ebola data set right here, there's If we go through the same process that I talked about, there are patterns in the dataset here

01:31:16 Daniel Chen
And each cell contains two bits of information: cases and the country.

01:31:23 Speaker 2
I was just wondering, if we end up doing it on R, how do we get the CSV?

01:31:28 Speaker 2
Or is it part of a package?

01:31:30 Daniel Chen
It's in the folder. So if you scroll up a little bit, I have everything in the folder.

01:31:39 Daniel Chen
So if you just download the entire assignment, then all the data and everything is in there.

01:31:46 Daniel Chen
Or if you download the entire website, all the website stuff is included.

01:31:50 Speaker 2
But then it would download everything.

01:31:51 Daniel Chen
It'll download everything, including the data sets, which is why I put the homework file at the very top so you don't have to go look for it.

01:31:59 Daniel Chen
But everything else is literally the slides and the website.

01:32:04 Speaker 2
Like in the GitHub.

01:32:07 Daniel Chen
So if you click the green button, you can either clone it or you can click download zip.

01:32:12 Daniel Chen
And that will just download everything that you need.

01:32:16 Daniel Chen
And the only file you'll care about is the homework. Qmd file. So if you were to do agentic coding, this is what it will look like.

01:32:28 Daniel Chen
I'm essentially doing the homework for you. If you care about the actual answer,

01:32:36 Daniel Chen
You'll notice, you'll see the code is really not that complicated. It's you can just copy paste from the actual slide deck.

01:32:43 Daniel Chen
Just download the zip and unzip it.

01:32:45 Speaker 2
The tiny models code. There's no code interpreter.

01:32:50 Daniel Chen
That's because you have to install it yourself on your computer.

01:32:54 Speaker 2
Not the software, but the interpreter.

01:32:55 Daniel Chen
But, if you

01:32:57 Daniel Chen
Assuming you have an agent or assuming you're in Copilot

01:33:02 Daniel Chen
This is what it will look like minus some of the other stuff. You can literally say, "I am working on the first question of the homework."

01:33:11 Daniel Chen
Homework.

01:33:13 Daniel Chen
Can you tidy up the Ebola assignment

01:33:19 Daniel Chen
Ebola data set?

01:33:21 Daniel Chen
Only answer one question at a time. So yes, it will pretty much just try to do the whole assignment in one go.

01:33:31 Daniel Chen
If when you are learning, I highly recommend that you use an agent to do data analysis with you.

01:33:39 Daniel Chen
I would highly recommend that you only have it write smaller chunks at a time.

01:33:45 Daniel Chen
Because yes, it can do. You can say, "Go clean this data set," and it's just going to give you a hundred lines of you almost have no idea what it did.

01:33:54 Daniel Chen
So you really do want to know the next step.

01:33:57 Daniel Chen
And then just have it write the next step for you; that's essentially the best way to work with it. You're only looking at five or so lines of code at a time.

01:34:07 Daniel Chen
Especially when you're new to coding

01:34:09 Daniel Chen
It's already tedious enough if you know how to code and have to review other people's code.

01:34:14 Daniel Chen
If you're very new to coding, then yes, it's hard. There's a lot of things happening if you are trying to review a lot of code that you haven't written yourself.

01:34:26 Daniel Chen
Even this part right here, when I'm saying go and tidy up the Ebola dataset, there's four steps involved, and even then, it could be more complicated than what you expect. So again, totally fine to use these tools to write the code, but make sure that you do if you end up getting a bunch of stuff that you don't understand, break it up into smaller pieces.

01:34:51 Daniel Chen
So if I try to do this, I don't know. Hopefully, it only does this piece right here.

01:34:57 Daniel Chen
What it's going to do, and what is happening, you'll see the same thing happening in Copilot, is that it is literally saving or dumping out to itself the contents of the homework assignment. The reason why I'm also bringing this up is if you ever are in.

01:35:20 Daniel Chen
If you're working on a project and you have a coding agent with you

01:35:26 Daniel Chen
This is where all of those data breaches are happening. It's because it doesn't actually

01:35:31 Daniel Chen
It doesn't actually read

01:35:35 Daniel Chen
The variables of your code. When you are running R Studio and it's like, look, there is a data frame here.

01:35:41 Daniel Chen
It has to write its own code to see the output.

01:35:45 Daniel Chen
In which case. If you have a dataset that has patient names and medical record numbers

01:35:51 Daniel Chen
It's the way it is writing the code for how do I clean this. It has to print out the dataset to see it, which means that all of that information just went to Anthropic, or whoever's hosting that model.

01:36:04 Daniel Chen
So usually, if you're working with hospital data, don't use your own subscription. You probably shouldn't or can't. But if you are given an agent to work with, from a hospital, typically there's already an agreement with the company that you're working in that they have their own model deployed somewhere, and that's how you interact with it. And hopefully, that's already set up for you before you even started working.

01:36:29 Daniel Chen
I'm using it off of my own account.

01:36:33 Daniel Chen
But one of the things you'll see here is like.

01:36:42 Daniel Chen
It's printing out the files on my computer. If you have passwords, it's going to see them.

01:36:50 Daniel Chen
The next thing it was doing is trying to find the homework assignment file. So here are all the files in this folder. Which one is the homework assignment? It's eventually going to figure out, okay, I see the homework assignment file. It's called homework.qmd.

01:37:04 Daniel Chen
And then what it's going to do is it literally reads or dumps out all the contents of this particular file.

01:37:13 Daniel Chen
And then it is writing its own code.

01:37:17 Daniel Chen
And this is also a place that you can get into a lot of trouble with, because it can write code to read a passwords file. I'm going to go and read it. Why did you read it? There's nothing to do. This is where people get into a lot of trouble.

01:37:29 Daniel Chen
So that's why I like I tried to set up code spaces just to see, for you to actually see it, because this is a very different type of problem from when you are copying pasting a homework assignment to ChatGPT. The web interface doesn't have this ability to write its own code and read the files on your computer, right? Unless you put it in there yourself, it's not going to just start running stuff on your computer.

01:37:54 Daniel Chen
But now it can, and in theory, it could start deleting stuff as well. This is how people are, oh yeah, I had my agent, and then we deleted all the company's data. This is what's happening because it really is.

01:38:07 Daniel Chen
Running the code on your computer happens because I need to access a database. I don't have access to the database. I see you have a passwords file. I'm going to read that passwords file. Now I have your password. I'm going to delete the database.

01:38:21 Daniel Chen
And all of a sudden it's doing all of that. So that's what's happening. These models are not that smart in the sense that it doesn't actually.

01:38:30 Daniel Chen
It's not that it's running our code, and it's not like the same experience that you have with our studio, where it has all of its data in its environment and running it all together. It's not doing that. It has to literally write its own code to dump out the files and contents, and then it figures that out, and then it tries to suggest a new edit. So it's not really doing anything more than that. And right here, you can even see, it ran a whole bunch of code on its own, and this is what's happening.

01:39:01 Daniel Chen
And then this is the final data set that it came up with. It didn't actually do that. So then I can also say, can you provide the solution?

01:39:18 Daniel Chen
Solution in line two seventy nine

01:39:22 Daniel Chen
And then it knows that it is in the. You can see here it's saying, it's homework. That Q M D. Great. So I'm literally saying, hey, can you edit this file? And put your solution in line two seventy nine, and then here it is. It is like you can see it is very different as an experience from copying, pasting from the web interface.

01:39:42 Daniel Chen
Because again, it has actual access to the files on your computer.

01:39:47 Daniel Chen
I'm trying to do it in Code Spaces. It looks like it's working for you. So yes, in Code Spaces, you'll get a green button like, hey, I'm gonna make this suggestion. Do you allow it?

01:39:55 Daniel Chen
That is the human review process. In some sense, that is.

01:40:02 Daniel Chen
In some sense, that is the only thing stopping you from this thing doing something you didn't expect.

01:40:13 Daniel Chen
So it did that, but you can see even right now, it kind of did the wrong thing for me. For me, because I already cleaned the dataset, but then I told it to put the solution in line 279. It put the solution for the next problem in line 279. So can you put the data cleaning code in 279?

01:40:41 Daniel Chen
And the group by code in the next problem cell. So this is essentially what agentic coding feels like. You're essentially just writing more in English instructions for it to write the code.

01:40:59 Daniel Chen
It just dumped out all of this code, which I would say is probably correct. It looks like it's correct.

01:41:05 Daniel Chen
We have our tidy data set. I don't know where.

01:41:09 Daniel Chen
Here it is. So it tidied this Ebola data set. So for looking at the Ebola data set

01:41:16 Daniel Chen
This is where your review process should come in.

01:41:20 Daniel Chen
This data is not clean.

01:41:21 Daniel Chen
The first thing we notice is that it has columns that follow a pattern. So I should expect a pivot longer step, which is what it does.

01:41:31 Daniel Chen
I'm selecting all the columns except for date and day.

01:41:34 Daniel Chen
And we can run this code on its own to just peek at that state. So this is the state, and then we can say there's another problem in here because if we get this count, if we try to do any statistics on it, it doesn't make any sense because its case counts and death counts are all mangled together. So that's the third tidy data problem that we're talking about. So then there's like a pivot wider step that needs to happen.

01:42:01 Daniel Chen
So you can again have the agent write the code for you, which essentially is the same thing. If you copy paste this homework assignment to ChatGPT, I guarantee you it'll give you the same answer. But this is your review process. It wrote the file for you. You should probably go and run it yourself, not just take it for granted.

01:42:22 Daniel Chen
You just get a higher chance that this code won't error. If you're new to coding, you're probably going to be spending more time. I type something wrong, it's not. It's like it's just giving me red text.

01:42:33 Daniel Chen
So with an agent

01:42:35 Daniel Chen
The chances of it giving you red text is a lot lower. But now the problem is, did it do the right thing?

01:42:41 Daniel Chen
Luckily, with a lot of these data cleaning steps

01:42:45 Daniel Chen
Doing the right thing is to run the code and see if the output looks right.

01:42:49 Daniel Chen
And then if there are pieces in here that you don't understand. The really nice thing is

01:42:57 Daniel Chen
This is nope.

01:43:01 Daniel Chen
Nope. The nice thing is I don't know what's happening with pivot longer.

01:43:12 Daniel Chen
Can you explain? The nice thing is, you have this agent literally next to your codebase. If you see something you don't understand, you can literally go and ask it. What it's going to do is it is literally just like rerunning all of the code. You can see here it's like it has to generate its own code to reread the dataset to see it, to then tell you the answer to your question. This is the part where it's really important that when you're working on a dataset with an agent that's not sanctioned by the hospital.

01:43:44 Daniel Chen
Open it or open everything in a Cynthia dataset because it doesn't actually.

01:43:54 Daniel Chen
It has to read your code and then dump out the results to see what's happening, which is the communication layer where all of this private information is getting leaked.

01:44:06 Daniel Chen
So here, think of it as here's a Google statement, a Google thing right off to the side. If you don't understand something, you can ask it. The thing with models is it is very verbose and it will probably give you a lot of text. In terms of what's happening, but you can ask it something you don't understand.

01:44:28 Daniel Chen
And so here, it's pivot wider, and then one of the functions, one of the instructions I tell you, and this is why it wrote code this way, is because I also said make sure the date column is actually a date. We didn't really talk about the MDY function, but it's going to write it. You might have a question around why you used MDY.

01:44:50 Daniel Chen
And you can again ask it the question in Code Spaces and in Copilot. You have enough free credits to get through everything.

01:45:01 Daniel Chen
And again, it's going to run its code and then look up the definition. Here's all of the instructions. Because CSV reads it as a string, you wanted an actual date, and this. All of the explanation of why it's using MDY, and here's the actual output that comes out of it.

01:45:26 Daniel Chen
This type of result is where the quality of the model differs. If you're in code spaces, it's probably using a smaller, less thinking model just because it's free and they're trying to save on cost.

01:45:41 Daniel Chen
I'm using the.

01:45:45 Daniel Chen
The highest thinking model coming out of Anthropic, so that's why it's taking a little longer. That's also why it's giving you a lot of extra text.

01:45:52 Daniel Chen
So the quality of the model is going to be different.

01:45:55 Daniel Chen
Which is also why, if you're not paying for these things, or if you're not setting everything to the highest setting, you do want to review the code that it's generating because it could make mistakes or do something that.

01:46:10 Daniel Chen
You already know there's a better way, or the way you learned it in class. You can guide it in terms of we learned this function in class. Can you use this function? Or we learned this function in class. Why did you not use this function? Those are all valid ways of getting the code to do what you expect.

01:46:28 Daniel Chen
So it's not always as simple as go do my homework, which it probably will do all of this homework assignment completely correctly because I wrote it that way, where it could do all the assignments correctly.

01:46:41 Daniel Chen
If you're in, especially in a hospital setting

01:46:45 Daniel Chen
If you also think about it in terms of the code that you're writing, it's putting someone else's life in line.

01:46:50 Daniel Chen
On the line. How well do you trust the code that you didn't really review or it just got vibe edited? I would say yes, these are tools that are available for you.

01:47:02 Daniel Chen
In the tech industry, this is almost a required thing. Everyone just works this way now, but that doesn't take the responsibility away.

01:47:11 Daniel Chen
Checking and reading through and understanding what's happening. If anything, the code is no longer the hard part. Typing the code and thinking about it. The actual implementation of the code is no longer the hard part. Now it's go and check it, and you're spending a lot more time. I would say I am spending a lot more time writing and reading and thinking about ways things can go wrong.

01:47:37 Daniel Chen
And having it check itself is sort of like where all your time is now being spent. So instead of

01:47:42 Daniel Chen
I don't know how Pivot Longer works, and you're spending hours trying.

01:47:48 Daniel Chen
I put a dash here instead of an underscore. Those used to be problems that everyone who started off coding used to have. You just typed something wrong, or you forgot a comma somewhere, and that took thirty minutes out of your life.

01:48:01 Daniel Chen
That is no longer the time you're spending it on. Your time is now spent on like.

01:48:05 Daniel Chen
Did it process my data correctly? Prove it to yourself.

01:48:09 Daniel Chen
So the homework assignment is that's pretty much the homework assignment. You're going to clean the Ebola dataset. I have you generate one type of frequency table. This is for each country, the first and last report, the cases and deaths for each of those reports. That's sort of just what I had you do.

01:48:34 Daniel Chen
The other thing that I have you do here is pick a column and then make a figure out of it.

01:48:41 Daniel Chen
A lot of the text here

01:48:43 Daniel Chen
Paste it into ChatGPT if you need to. It's written in such a way where it's very much guided. There are parts in here that say, hey, now that you have a figure, please go and tell me what you see.

01:48:57 Daniel Chen
Again, these models, if you paste in a figure, it can quote unquote see the figure and write a statement about it.

01:49:03 Daniel Chen
In this particular case, I would say you can probably get away with it.

01:49:07 Daniel Chen
But I would say in July I attended a talk where they were trying to figure out where models fail, and what they've done is they took a very popular data science data set, which is the if you I'm assuming you've heard of the MT cars data set or the cars data set from R

01:49:27 Daniel Chen
And there's a very popular visualization that is done with that data set.

01:49:32 Daniel Chen
We plot horsepower of a car based off of miles per gallon, and essentially you should see a negative trend. The more horsepower a car has

01:49:42 Daniel Chen
It's probably less fuel efficient, so the car's MPG is probably going down.

01:49:46 Daniel Chen
What they did was in the actual data set they flipped the variable, so if you were to plot it, the trend is actually positive. I know it's not true, but what they did was they flipped the data set, one of the values of the data set, so it's positive instead of negative.

01:50:02 Daniel Chen
They created a figure, and then they said, "Here's the empty cars data set with MPG and miles per gallon and horsepower. What do you see?" The model still said it's a negative trend.

01:50:16 Daniel Chen
You gave it an image, but because this is and it expects the trend to work in a certain way, it still interpreted the figure wrong.

01:50:25 Daniel Chen
These models can still quote unquote see, but that doesn't mean it's giving you the correct interpretation. So I would say, anytime you're working with tables and figures, paste the image in there, but you should already have a general sense of what's happening.

01:50:40 Daniel Chen
And I would like in one of the other courses I teach

01:50:44 Daniel Chen
I essentially say, well, just write down the caption in as bad or good English as you want, and essentially say, can you make this better or give me three other ways you would state this.

01:50:56 Daniel Chen
And this way, you're essentially guiding the model a lot because you've already given.

01:51:01 Daniel Chen
It has a lot of instruction on what to do and what to look for, and that's really the whole thing about prompting. It's not about go and do my homework. It's like I here are all of the technical and specific words I know about the problem at hand, and I am putting it into you as giving you the instruction.

01:51:21 Daniel Chen
We spend a lot of time talking about all of these things, but it's because those words and those terms

01:51:28 Daniel Chen
When you're trying to find the best way to work with these models, use those terms back, because essentially it's just searching for a space on how to answer a problem. The more of these terms and technical direction you can give it, the better the answer it's probably going to give you. The homework assignment in this particular case

01:51:47 Daniel Chen
I've given it, or the homework assignment itself is really long because it has all of almost all of the context you need. But you're not always going to be given a hand-holded process when you're just given a data set. So that's why the homework is very long, because it's almost like these are almost all the words that I would have normally typed. I would even go one further, which is I started typing so much to give it so much context that I have a shortcut on my computer that just turns the microphone on.

01:52:19 Daniel Chen
And I just start dictating paragraphs at it.

01:52:22 Daniel Chen
In terms of guiding it, what I wanted to do.

01:52:26 Daniel Chen
At the bottom of the homework assignment, you are given I think it's

01:52:36 Daniel Chen
I give you three data sets to pick from, and just fit either a linear regression model or a logistic regression model.

01:52:43 Daniel Chen
Get the coefficients table. Write the sentence for how you interpret a value. So everything that we talked about in class today is just written in a bunch of words. It's in a lot more words than you need. But if you render the HTML or the PDF of it.

01:53:03 Daniel Chen
You see that, like it actually isn't.

01:53:06 Daniel Chen
Like again, it's like all text on like what you need.

01:53:12 Daniel Chen
Why are you not found?

01:53:15 Daniel Chen
That's weird.

01:53:21 Daniel Chen
I think I know why you're not found. I don't know why that's not found.

01:53:31 Daniel Chen
I'm not going to debug it because I am. I can barely see the screen, and we're approaching time. The instructions are really around looking at the coefficients table.

01:53:44 Daniel Chen
What does the actual model say? Again, I have a lot of hints that are in here. That's like use the tidy function to get the actual tables. You're not just working with the actual log odds value or the model object view, like get the actual coefficients table out. There's a whole bunch of instructions in here, like hey, here's the skeleton for how to fill in the interpretation. So again, the homework assignment does look really long. It's I guarantee you it's not that long.

01:54:15 Daniel Chen
And then at the very bottom there's a little checklist. I think because if you're having problems with rendering

01:54:23 Daniel Chen
We can probably just submit one of the QMD files if that's the case. But I would say try to get the HTML and PDF to work, and we can change the grading for that. That's not an easy thing to fix.

01:54:37 Speaker 2
Just have a quick question. So are dates always printed out as year, month, and day, even though I wrote MDY?

01:54:47 Daniel Chen
It might be because the date in this data set might be in MDY.

01:54:56 Daniel Chen
So there is a function called YM YMD.

01:55:00 Speaker 2
I did mutate and then MDY, but it still shows me it's printed out as year month date.

01:55:09 Daniel Chen
But then the important thing is

01:55:15 Daniel Chen
I know what's happening. So this is because if we look at the data set here

01:55:23 Daniel Chen
The original form of the data set is MDY.

01:55:26 Daniel Chen
So we're telling we're using MDY because we're saying I want you to convert this into a date.

01:55:32 Daniel Chen
The input I'm giving you is in MDY format. So again, totally fine because I'm here. But if you run into this problem, that if you have the agent next to you, that's a very valid question that you can ask. Because now if you look at it, the other thing, the reason why I'm running both bits of code.

01:55:55 Daniel Chen
Date right here is a character

01:55:58 Daniel Chen
It's in month day year format, so you're using the month day year function. There is a YMD and all the permutations of this probably exist.

01:56:06 Daniel Chen
But after mutate

01:56:08 Daniel Chen
It's an actual date time stamp. So this is a date object, so you can actually say this date minus that date, and that will give you a new date.

01:56:19 Daniel Chen
Again, this is one of those things where

01:56:23 Daniel Chen
The code is right now. You're in this real world of what is happening, but visually this is what's happening.

01:56:30 Daniel Chen
This is now a proper date timestamp.

01:56:32 Daniel Chen
And the official standard, like ISO 8601 format, is year month day

01:56:40 Daniel Chen
And so that's why you'll see it as year month day. Could you get data where it's a string year month day? Date arithmetic won't work, so you would end up using the.

01:56:52 Daniel Chen
YMD function to turn it into a date time stamp, so you can do the date math.

01:56:59 Daniel Chen
Yeah.

01:57:03 Speaker 2
Is there an environment section in CodeSpaces where you can see the?

01:57:09 Daniel Chen
CodeSpaces is built off of VS Code, which doesn't have the variable viewer that our studio has.

01:57:18 Speaker 2
So if we want to print it, we have to go to that code chunk.

01:57:21 Daniel Chen
And print it. So that's one of the benefits of Positron locally, which is why it's this, but there are a lot of extra features to make data science work nicer.

01:57:32 Daniel Chen
I think there is a way to make CodeSpaces run our studio. I just don't want to do that.

01:57:39 Speaker 2
So this saves then if we didn't do the fork and we work in this.

01:57:43 Daniel Chen
So one really important thing. If you don't fork it, even if you fork or don't fork it, when you save it

01:57:57 Daniel Chen
It's saved in that code space instance, but it's not saved back on Git. So in theory, if you really want to save this, copy paste it and save it on your computer.

01:58:06 Daniel Chen
It's probably the easiest way to fix that problem.

01:58:08 Speaker 2
If I close my CodeSpaces tab and open another CodeSpaces

01:58:12 Daniel Chen
If you delete the CodeSpaces, it's gone.

01:58:15 Daniel Chen
You can still close it, but don't delete it.

01:58:19 Speaker 2
Does closing the tab delete it?

01:58:20 Daniel Chen
Closing the tab does not delete it. It will eventually shut down.

01:58:24 Speaker 2
Is it non-editable? Like you know

01:58:26 Daniel Chen
This is kind of important. It's less about code and more about how CodeSpaces work.

01:58:35 Daniel Chen
Yes. If you're here and you have the actual CodeSpaces.

01:58:43 Daniel Chen
As long as you're working with the same name like Fuzzy Fiesta

01:58:47 Daniel Chen
It'll still be there. But if you click and delete it, all the work is lost. Like then this is where you have to know Git and get things back into the Git repository.

01:58:58 Daniel Chen
As you're working through the homework QMD

01:59:04 Daniel Chen
If you want to save that work, the easiest way is to copy and save it on your computer.

01:59:11 Daniel Chen
If you know your way around Git, VS Code has a Git interface, and you would have to add, commit, and push back to your fork.

01:59:19 Daniel Chen
I think that's out of scope from what you know. So yes, save the contents like literally Control A, Control C.

01:59:28 Daniel Chen
Paste it somewhere on your computer, the homework. Qmd file, and then you'll save it.

01:59:34 Speaker 2
Do you know how long it takes to time?

01:59:37 Daniel Chen
I think it's like 20 minutes of inactivity. It'll shut down, turn the computer off, but you can always turn the computer back on. So as long as, for me, when it shuts, there's a button here.

01:59:53 Daniel Chen
It's not here.

01:59:56 Daniel Chen
Don't auto delete. As long as you're working with the same name, you will not lose the work. It's almost like I turned off my laptop and I could turn it back on. If you delete it, it's like I just threw my laptop away and I bought a new one.

02:00:11 Daniel Chen
So don't delete it

02:00:14 Daniel Chen
But you can let it time out, and your work will still be there.

02:00:19 Daniel Chen
Or anytime you step away, copy paste, then just save it.

02:00:23 Speaker 2
Or I just get it done in one go.

02:00:24 Daniel Chen
Or just get it done in one go, which is totally valid. Get it done in one go, and it's fine. And again, the agent will get it done in one go.

02:00:32 Daniel Chen
That is not a very hard lift. But if you do it through steps or if you do it through the agent, you're learning two different things.

02:00:39 Speaker 2
Which is totally fine.

02:00:46 Daniel Chen
That's class. I don't know if you have other stuff to do.
