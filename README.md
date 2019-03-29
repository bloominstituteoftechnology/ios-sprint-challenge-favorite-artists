# Favorite Artists

## Instructions

**Please read this entire README to make sure you understand what is expected of you before you begin.**

This sprint challenge is designed to ensure that you are competent with the concepts taught throughout Sprint 11, Objective-C Part 1.

Begin by forking this repository. Clone your forked repository to your machine. There is no starter project. Create a project for this challenge in this repository and commit as appropriate while you work. Push your final project to GitHub, then create a pull request back to this original repository.

**You will have 3 hours to complete this sprint challenge**

If you have any questions about the project requirements or expectations, ask your PM or instructor. Good luck!

## Screen Recording

Please view the screen recordings so you will know what your finished project should look like:

![](https://user-images.githubusercontent.com/16965587/55266696-ef255b00-5243-11e9-9281-7da69c562ca8.gif)

(The gif is fairly large in size. It may take a few seconds for it to appear)

## Before you begin

You will be using is [The Audio DB Website](theaudiodb.com) to get information about an artist that the user searches for. The API's documentation is [here](https://www.theaudiodb.com/api_guide.php).

**NOTE:** In the place of an actual API key, use the number `1` instead. This is the API's demo key.

## Requirements

The requirements for this project are as follows:

1. A model object that represents an artist. It should have the following properties:
    - Their name.
    - Their biography.
    - The year that they formed. **This must be a primitive.**
2. A category called `NSJSONSerialization`. In this category add:
    - An initializer to intialize your model object from a dictionary.
    - A function that returns your model object in dictionary form.
3. Add the ability to save a searched artist. Implement persistence using `NSFileManager` to save your model objects to a file in the application's document directory. **Note:** As you do not have access to `Codable` use `NSJSONSerialization` to help turn your model objects into `NSData`.
4. A table view controller that displays a list of saved artists.
5. A detail view controller that allows the user to search for new artists, and also view saved artist information.

## Go Further

* Persist your model objects using Core Data instead of saving them to a file.
