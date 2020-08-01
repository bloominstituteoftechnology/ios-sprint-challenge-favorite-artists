# Favorite Artists 

## Instructions

**Please read this entire README to make sure you understand what is expected of you before you begin.**

This sprint challenge is designed to ensure that you are competent with the concepts taught throughout Objective-C Part 1.

1. Begin by forking this repository. Clone your forked repository to your machine. 
2. There is no starter project. Create a project for this challenge in this repository and commit as appropriate while you work. 
3. Push your final project to GitHub, then create a pull request back to this original repository, and tag your TL.

**You will have 3 hours to complete this sprint challenge**

If you have any questions about the project requirements or expectations, ask your PM or instructor. Good luck!

## Screen Recording

Please view the screen recordings so you will know what your finished project should look like:

![](https://user-images.githubusercontent.com/16965587/55266696-ef255b00-5243-11e9-9281-7da69c562ca8.gif)

(The gif is fairly large in size. It may take a few seconds for it to appear)

## Before you begin

You will be using is [The Audio DB Website](https://theaudiodb.com) to get information about an artist that the user searches for. The API's documentation is [here](https://www.theaudiodb.com/api_guide.php).

**NOTE:** In the place of an actual API key, use the number `1` instead. This is the API's demo key.

A sample request for *Macklemore* looks like this URL and JSON response (a request may take a few seconds to complete):

[https://www.theaudiodb.com/api/v1/json/1/search.php?s=macklemore](https://www.theaudiodb.com/api/v1/json/1/search.php?s=macklemore)


## Customer Requirements
1. User can search for an artist to learn more about their biography and year formed.
2. User can save their favorite artists from the search results to a main "Favorited Artists" screen.
3. Saved artists must be persisted between app runs (Force Quit should not lose customer data)
4. Saved artist data must be saved to the Documents directory so that it can be backed up to the users iCloud account.
5. The "Favorited Artists" screen must show rows of artists (1-1,000+ rows).
6. The "Search Results" screen must have a search bar, display the artist name, biography, and year formed.
7. Users should be able to tap on saved artists from the "Favorite Artists" screen and see the details of the artist on a detail screen.
8. The app should not crash when searching for artists who are missing data. Present a resonable message if a field is missing from the database instead of crashing.

## Technical Requirements

1. A model object that represents an artist. It should have the following properties:
    - Artist name
    - Artist biography
    - The year the Artist formed (**This must be a primitive number**)
2. Create a Category for your model object called: `NSJSONSerialization`. 
    - The filename should be: `YourArtistModel+NSJSONSerialization.h` (via "Objective-C File" template)
    - Add an initializer to create your model object from a `NSDictionary`.
        
        `- (instancetype)initWithDictionary:(NSDictionary *)dictionary`
        
    - Add a method that returns your model object as a `NSDictionary` (to save artists).
        
        `- (NSDictionary *)toDictionary`
       
3. Implement persistence using `NSDictionary` to save your model objects to a file in the application's Document directory. 
    - Tip: Search the `NSDictionary` documentation for `writeToURL` and `initWithContentsOfURL` methods.
    - Tip: Print out the URL and go to that folder in `Finder > Go > Go to Folder` to verify save works as you expect
4. The detail view controller can allow the user to search for new artists, and also view saved artist information.
6. Verify that searching for Macklemore, John Williams, and Pink Floyd all work without crashing your app.
    - Tip: Make sure you print out the JSON before you parse it to spot enomalies in data.

## Go Further
* Add unit tests to verify you can parse a sample JSON file, error response, and handle missing fields.
* Persist your model objects using Core Data instead of saving them to a file.
* Download album or artist artwork and present these images in the table view cell and/or the detail view.
* Persist album/artist artwork in a [temporary directory](https://nshipster.com/temporary-files/).
* Allow the user to remove saved artists from the table view.
