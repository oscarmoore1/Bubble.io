# Bubble.io Project
## Description
Bubble.io is an interactive SwiftUI-based iOS application that creates a dynamic, engaging, and fun space for users to communicate. Users can join various "bubbles" to chat and interact. The project employs modern iOS development techniques, using SwiftUI and JSON data to render user interfaces and manage data.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites
To run this project, you will need:

A Mac computer running macOS Catalina or later.
Xcode 12 or later, which can be downloaded for free from the Mac App Store.
## Cloning the Project
First, you need to clone the project repository to your local machine. You can do this using the terminal with the following command:

bash
Copy code
git clone <repository_url>
Replace <repository_url> with the URL of this repository.

## Opening the Project
To open the project, navigate to the project directory in Finder and double-click on the .xcodeproj file. This will open the project in Xcode.

Alternatively, you can open the project from the terminal with the following command:

lua
Copy code
open Bubble.io.xcodeproj
## Running the Project
To run the project:

Select an iOS simulator from the list of devices in Xcode's toolbar. If the simulator you want isn't shown, you can see all available simulators by clicking on the device list and choosing "Add Additional Simulators". Here you can download and/or select other simulators to test on.
Press the "Run" button or use the ⌘ + R shortcut to build and run the project. The app should now launch in your chosen simulator.
## Project Structure
The project primarily consists of two SwiftUI views LandingPage and BubblesPageView.

LandingPage: This is the initial view displayed to the user. It provides a welcome message and prompts the user to enter a nickname. It also provides a navigation link to register a new account.

BubblesPageView: This view displays all available chat bubbles. It loads the bubble data from a local JSON file and displays each bubble with a BubbleCircle view.

Additionally, the project includes utility functions such as loadJson for loading and decoding the JSON file into BubbleObject instances.

# Code Documentation
Detailed documentation and explanation for the project code is available within the code itself. All major components of the code are explained using in-line comments.

# Known Issues
As of the last update, this project has the following known issues:

The FirebaseAuth and FirebaseDatabase imports, as well as the Firebase login sequence, are commented out. To use these functionalities, you need to install the necessary Firebase SDKs and uncomment the related code.

The bubbles' sizes aren't dynamically rendered based on the Range property of each bubble. This feature is still under development.

Please check the project's issues on GitHub for more information and progress on these and other issues.

# Acknowledgements
Oscar Moore, for initial creation of the project.
