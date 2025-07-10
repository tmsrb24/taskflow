# TaskFlow: Advanced Task Management System

TaskFlow is a robust task management application built with Ruby on Rails. It's designed to be a feature-rich, scalable, and maintainable system, serving as an excellent demonstration of modern web development practices.

## Key Features

- **User Authentication:** Secure user registration and login system powered by Devise.
- **Task Management (CRUD):** A full suite of Create, Read, Update, and Delete operations for tasks.
- **AJAX-powered Interactions:** Mark tasks as complete instantly without a page reload for a seamless user experience.
- **Deadline Validation:** Ensures that task deadlines are always set in the future.
- **Tagging System:** Organize tasks with a flexible tagging system using `acts-as-taggable-on`.
- **Priority Levels:** Assign priorities (Low, Medium, High) to tasks to better manage workflows.
- **User Roles & Permissions:** A simple role management system (e.g., User, Admin) to control access to features.
- **API-first Design:** A versioned JSON API for managing tasks, allowing for integration with third-party services or a separate frontend framework.
- **Background Processing:** Utilizes SolidQueue for handling asynchronous tasks like sending email notifications.
- **Styling:** A clean, responsive UI built with the Bootstrap framework.
- **Localization:** Fully localized for multiple languages (English and Czech).

## Tech Stack

- **Backend:** Ruby on Rails 8
- **Database:** SQLite3 (development), PostgreSQL (production-ready)
- **Authentication:** Devise
- **Background Jobs:** SolidQueue
- **Frontend:** Hotwire (Turbo, Stimulus), Bootstrap
- **Testing:** RSpec, FactoryBot, Capybara
- **Containerization:** Docker, Docker Compose

## Getting Started

### Prerequisites

- Ruby 3.2.3+
- Node.js 20.0+
- Yarn
- Docker and Docker Compose (for containerized development)

### Local Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/tmsrb24/taskflow.git
    cd taskflow
    ```

2.  **Install dependencies:**
    *Due to potential network issues with RubyGems, the `Gemfile.lock` is included in the repository to ensure consistent builds.*
    ```bash
    bundle install
    yarn install
    ```

3.  **Set up the database:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed # (If seed data is available)
    ```

4.  **Run the server:**
    ```bash
    rails server
    ```
    The application will be available at `http://localhost:3000`.

### Docker Setup

For a consistent development environment, you can use Docker:

1.  **Build the services:**
    ```bash
    docker-compose build
    ```

2.  **Run the database migrations:**
    ```bash
    docker-compose run --rm web rails db:create db:migrate
    ```

3.  **Start the application:**
    ```bash
    docker-compose up
    ```
    The application will be available at `http://localhost:3000`.

## Licence

This project is licensed under the MIT License.
