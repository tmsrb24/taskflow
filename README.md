# TaskFlow

**TaskFlow** is a modern, feature-rich task management application built with Ruby on Rails 8 and Hotwire. It demonstrates a wide range of modern web development techniques, including real-time updates, modal forms, drag-and-drop functionality, and background job processing.

## Features

- **User Authentication:** Secure user registration and login provided by Devise.
- **Project Management:** Users can create, edit, and delete projects to organize their tasks.
- **Task Management:** Within each project, users can manage tasks, set due dates, and mark them as complete.
- **Interactive UI (Hotwire):** A smooth, single-page-like experience for creating and editing projects/tasks in modal windows without page reloads.
- **Drag & Drop:** Easily reorder tasks within a project.
- **Tagging:** Assign tags to tasks for better organization and filtering.
- **Dashboard:** A central hub showing an overview of tasks due today, overdue tasks, and a chart of task distribution across projects.
- **Email Reminders:** Automatic email notifications for tasks that are due soon, powered by SolidQueue and Action Mailer.

## Technical Stack

- **Backend:** Ruby on Rails 8
- **Frontend:** Hotwire (Turbo, Stimulus), Bootstrap 5, Animate.css, Chart.js
- **Database:** SQLite3 (for development)
- **Authentication:** Devise
- **Background Jobs:** SolidQueue
- **Testing:** RSpec, FactoryBot, Faker, Shoulda-Matchers

## Prerequisites

- Ruby 3.2.2+
- Node.js 18+
- Yarn
- SQLite3

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd taskflow
    ```

2.  **Install dependencies:**
    ```bash
    bundle install
    yarn install
    ```

3.  **Set up the database:**
    ```bash
    rails db:create
    rails db:migrate
    ```

4.  **Run the application:**
    The application uses the `foreman` gem to run multiple processes defined in the `Procfile.dev`.
    ```bash
    ./bin/dev
    ```
    The application will be available at `http://localhost:3000`.

## Running Tests

To run the full test suite:
```bash
bundle exec rspec
```

## How to Use

- **Register a new account** or sign in with the default user created in the seed data.
- **Create a project** from the "My Projects" page.
- **Add tasks** to your project, assign due dates, and add tags.
- **Drag and drop** tasks to reorder them.
- **Visit the Dashboard** to see an overview of your workload.
- **To test email notifications:**
    1. Create a task with a due date of tomorrow.
    2. Run the reminder task: `bundle exec rake tasks:send_reminders`
    3. Visit `http://localhost:3000/letter_opener` to see the sent email.