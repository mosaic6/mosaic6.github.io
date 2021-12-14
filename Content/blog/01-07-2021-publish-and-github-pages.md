---
date: 2021-01-04 21:04 
description: Creating a website with Publish and Github Pages
tags: development
excerpt: A Swift developer's friend when it comes to creating their own website.
topic: development
---

# Creating a website with Publish and Github Pages

If you've heard about Publish, you know it's a Swift developer's friend when it comes to creating their own website. There are a lot of really cool things about this tool, and some frustrating bits as well. I'll walk you through some of the "gotchya's" I faced so hopefully, you get a smoother experience. 

## Getting started with Publish

Let's start with some of the simple parts. Head over to [Publish](https://github.com/johnsundell/publish#quick-start) for the official getting started part. I'll summarize here.

### Install the command-line tool

This will install all necessary dependencies and the command-line tool for generating websites with Publish.

```
$ git clone https://github.com/JohnSundell/Publish.git
$ cd Publish
$ make
```

## Important note

I'll be using `<username>` to indicate places where you should use *your* Github username.

---

### Create your project folder

*Don't create your project folder inside the `Publish` folder*. Make sure you create your project folder somewhere in an empty folder, or directly onto your desktop. I like to put all my development work inside a folder in my root directory called `Projects`. But you do you.

```bash
$ mkdir <username>.github.io
$ cd <username>.github.io
$ publish new
```

After running `publish new` you'll have a new project inside your folder with everything you need to get started. 

### Open your project

```bash
$ open Package.swift
```

This will open XCode and resolve all package dependencies for you. It's magic.

## Setting up your Github Page

In your Github account, create a new repository. Give it a name with the following format. `<username>.github.io`.

This is all you need to do (right now) for your repository. Press `Create Repository` and jump back over to Xcode.

Before we start styling or writing any content, let's get our site live so we can see what the end result will be on Github. You can also test this out locally by running the following command in Terminal.

```bash
$ publish run
```

This will spin up a local web server for you to see your changes. Open your web browser and go to `localhost:8000` 

## Creating a new working branch

In your project folder in Terminal run the following commands

```bash
$ git init
$ git checkout -b posts
```

You can call your branch whatever you want as long as it's not `master`. Publish and Github pages reserve the `master` branch for your site's generated output. When we run the `publish deploy` command it will push your `output` folder changes to the `master` branch and not your working branch. 

## Back to Xcode

### Open the `main.swift` file.

In this file you're going to see the last line that looks like this:

```swift
try Mosaic6GithubIo().publish(with theme: .foundation)
```

Let's change it so we can push our page up to Github. Here is what it should look like: 

```swift
try Mosaic6GithubIo().publish(
  withTheme: .foundation,
  deployedUsing: .gitHub("<username>/<username>.github.io", useSSH: false)
)
```


## Back to Terminal

### Get ready to push to Github

Now we are ready to push our changes to our `posts` branch and deploy our site. Run the following commands:

```bash
$ git add .
$ git commit -m "Initial commit"
$ git remote add origin https://github.com/<username>/<username>.github.io.git
$ git push -u origin posts
```

This will add your branch to Github without any generated output. Now let's generate some HTML for our site.

```bash
$ publish generate
```
This generates the website in your current folder. Your `Output` folder should now have some additional files in it. You shouldn't need to touch these files since all our work will be done writing `Swift` and `Markdown`.

## Time to deploy

```bash
$ publish deploy
```

# 👏 You did it!

You pushed your generated site up to Github, on to a newly created `master` branch. Go check it out.

You can see your new branch by clicking the dropdown branch picker. Go ahead, click it.

![Branch names](/images/change-branch.png width=300)
*As you can see I called my working branch `main`*

When you switch branches on Github you'll see the difference in what files and folders are on each branch. 

There is one more thing to change before we can see our site go live. Head to the settings page on your repo and scroll down to the `Github Pages` section.

Here we'll want to make sure our `Source` is set to the `master` branch, and our path is set to the `/(root)` folder. This will ensure we load our site from the `index.html` file found in the `master` branch.

![Master source](/images/source-pages.png width=500)

This should save automatically for you, and after a few minutes you can open a new browser window and go to `<username>.github.io`

## Conclusion

While we didn't add any content to our site, we did manage to get it up and running to Github Pages for a live studio audience. I plan to follow up with a `Customize your Publish site` post, that will go over how to add new pages, change your styling, and add a custom URL. 
