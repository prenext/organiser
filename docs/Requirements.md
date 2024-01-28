# Organizer App - Software Requirements Document

## 1. USERS

### Properties
- `uid`: User ID
- `username`: User's username
- `email`: User's email
- `password`: User's password
- `lname`: User's last name
- `fname`: User's first name
- `age`: User's age
- `gender`: User's gender
- `joindate`: Date of user registration
- `profilepic`: User's profile picture

### Authentication
- **Login:**
  > Google Sign-In API
  > Email and Password
  
- **Signup:**
  > Google Sign-Up API
  > Email, Username, and Password
  
### Details (After Successful Login/Registration)
- Update username (if logged in via Google)
- Enter/Update first and last name
- Update password (if logged in via Google, old/new/confirm)
- Update profile picture or add if none exists

### Logout
- Enable users to log out
- Implement later: Logout from other devices using the mobile app

## 2. GOALS

### Properties
- `goalID`: Goal ID
- `userID`: User ID (foreign key)
- `Title`: Goal title
- `priority`: Priority (color/icon coded)
- `span`: Time span (days, weeks, months, years)
- `category`: Goal category (color/icon coded)
- `description`: Goal description
- `status`: Goal status
- `is_achieved`: Boolean indicating goal achievement
- `is_active`: Boolean indicating goal activity
- `is_archived`: Boolean indicating goal archiving
- `End/Due date`: Goal end/due date
- `related_tasks_ids`: IDs of tasks related to the goal

### Functionalities
- Set goals (title, description, priority, span, category)
- Update/Edit goals
  > Delete uncompleted goals
  > Shift goal if it expires before completion
  > Renew completed goals as new goals with new IDs
  > Add tasks related to goals (link to existing or create new)
  > Archive goals
  > Update priorities and categories of goals

## 3. TASKS

### Properties
- `taskID`: Task ID
- `userID`: User ID (foreign key)
- `title`: Task title
- `description`: Task description
- `notes`: Task notes (optional feature)
- `priority`: Task priority (select from a list)
- `date`: Date for doing the task (next day the task will be done for repetitive tasks)
- `time`: Time for doing the task (in hours and minutes)
- `duration`: Duration of the task (in hours, minutes, or both)
- `isComplete`: Boolean Task status (e.g., incomplete, complete)
- `is_archived`: Boolean indicating task archiving
- `is_repetitive`: Boolean indicating whether the task is repetitive
- `StartDate`: Start date for repetitive tasks
- `EndDate`: End date for repetitive tasks (null means forever)

### Functionalities
- **Create tasks:**
  > Provide title, description, priority, due date, time, duration, and specify if the task is repetitive (with start date, end date, and repeat frequency).

- **Update/Edit tasks:**
  > Mark tasks as complete or incomplete.
  > Update task details (title, description, priority, due date, is_repetitive, duration, time).
  > Archive tasks.
  > Delete tasks.
  > Set tasks as repetitive or non-repetitive.

- **Update Start and End date for repetitive tasks:**
  > Adjust the start and end date for tasks marked as repetitive.

## 4. SCHEDULES

### Events Properties
- `eventID`: Event ID
- `userID`: User ID (foreign key)
- `title`: Event title
- `description`: Event description
- `start_date`: Start date of the event
- `end_date`: End date of the event
- `tasks`: List of tasks associated with the event

### Events Functionalities
- **Create events:**
  - Provide title, description, start date, end date, and an optional list of tasks associated with the event.

- **Update/Edit events:**
  > Add tasks to the event.
  > Update event details (title, description, start date, end date, tasks).
  > Delete events.

---

### Schedule Properties
- `scheduleID`: Schedule ID
- `userID`: User ID (foreign key)
- `day_of_week`: Day of the week for the timetable
- `events`: List of events or tasks associated with the day

### Schedule Functionalities
- **Create Schedule:**
  - Specify the day of the week and add a list of meals or tasks associated with that day.

- **Update/Edit Schedule:**
  > Add events or tasks to the day.
  > Update day details (day of the week, events or tasks).
  > Delete Schedule entries.


## 5. MEALS

### Properties
- `mealID`: Meal ID
- `userID`: User ID (foreign key)
- `meal_name`: Name of the meal
- `meal_type`: Type of the meal (e.g., breakfast, lunch, dinner, FastFood/Snack)
- `ingredients`: List of ingredients
- `calories`: Caloric content of the meal
- `meal_time`: Time of the day the meal is consumed

### Functionalities
- Log meals (meal name, type, ingredients, calories, meal time)
- View meal history
- Update/Edit meals
  > Edit meal details (name, type, ingredients, calories, meal time)
  > Delete meals from the log

## 6. INSIGHTS

### Functionalities
- Query data from the database
- Draw graphs, charts, and progress bars for goals

## 7. MODELS

### Functionalities
- Create models for suggestions
- Implement image recognition models for reading timetables and creating schedules automatically
- Implement models for alerting and advising users on tasks (e.g., using ChatGPT)

## 8. DATABASE

### Data Storage
- Store data about events, tasks, users, goals, meals, and schedules

### Functionalities
- Enable data extraction for authentication
- Show data in the UI
- Provide data for insights


