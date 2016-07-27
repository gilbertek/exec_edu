# README

Background Info
· User is enrolled in one or more courses
· Each course is divided into modules
· Each module is divided into segments
· Segments can be of different types identifying type of coursework (lecture, assignment, overview, etc).
· Lecture segment is a course lecture that requires student to listen/watch a lecture, while following along with a visual presentation
· Each lecture includes a link to a slide show - PowerPoint presentation that summarizes the lecture
· There are other types of segments but they are not important for this exercise


Your task is to create a simple web interface for a course that consists entirely of lecture segments.

[] Ask user for their email and password and use the API to get user courses (if multiple are returned, use the first one)

[] Once authenticated, present the user with a list of all lecture segments that are available for them to review

[] Each lecture segment allows the user to download corresponding slide show (“slide_show” attribute in the lecture_segments endpoint).

[] Keep in mind, that the link to the slide show can expire. For example, this link used to be valid at some point but no longer. You will need to accommodate for the fact that students may keep their pages open longer than the time expiry of the links.

[] Each lecture should have an option to go back to the main menu or to the next lecture


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

