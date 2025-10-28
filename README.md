# pet_tracker_app
300994-a251-STTGK3013-lab1-PET-APP-TRACKER

i. App name: PET FOOD PLANNER
 App Description: The Pet Food Planner is an app that helps pet owners estimate how much food their pet needs for daily intake. The users need to enter their pet’s weight, select the pet typer whether cat or dog, and choose their pet's activity level (low, mid, or high). From the data entered by users, the app will calculate and display the estimated food amount in grams per day.

ii. Input: 
Pet weight (TextField)
Pet type (Dropdown: Cat/Dog)
Activity level (Dropdown: Low/Mid/High)

Process: 
The app multiplies the pet weight by base food value:
Cat = 30g per kg
Dog = 40g per kg
And an activity multiplier:
Low = 1.0
Mid = 1.2
High = 1.4
General calculation:
Daily pet food intake (result) = Pet weight * base food value * activity multiplier

Output:
Displays the total grams of food the pet needs per day

iii. Widget List Used:
Text - for labels and results messages
TextField - for numeric input of pet weight
DropdownButton - for selecting pet type and activity level
ElevatedButton - to perform the calculation
Row / Column - for screen layout organization
Container - for visual grouping and border decoration
SizedBox - for spacing between widgets
ScaffoldMessenger / SnackBar - for input validation messages

iv. Basic Validation
Used double.tryParse() to safely handle numeric input from the TextField.
If a user enters an empty or invalid weight input, the app shows a SnackBar message: “Please enter a valid pet weight!”
Default calculation only runs if input is valid, preventing app crashes.
