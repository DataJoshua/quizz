# Quizz

A Ruby on Rails quiz application where teachers can create quizzes and students can take them.

## Requirements

- Ruby 3.1.0
- Rails 7.0.x
- SQLite3 (development) / PostgreSQL (optional)
- Redis (for Sidekiq background jobs)
- Node.js (for asset compilation)

## Local Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd quizz
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Set up environment variables

Create a `.env` file in the root directory if you need to override any defaults:

```bash
cp .env.example .env  # if an example file exists, otherwise create it manually
```

### 4. Set up the database

You can use the provided setup script, which installs dependencies, prepares the database, and clears logs/tmp in one step:

```bash
bin/setup
```

Or manually:

```bash
rails db:create
rails db:migrate
```

### 5. Seed the database

The app uses [Seedbank](https://github.com/james2m/seedbank) to manage seeds across multiple files. Seeds run in this order:

1. **roles** — creates `teacher` and `student` roles
2. **users** — creates default accounts
3. **quizzes** — creates sample quizzes assigned to the teacher

Run all seeds with:

```bash
rails db:seed
```

Or run individual seed files:

```bash
rails db:seed:roles
rails db:seed:users
rails db:seed:quizzes
```

### 6. Start Redis (required for Sidekiq)

```bash
redis-server
```

### 7. Start Sidekiq (in a separate terminal)

```bash
bundle exec sidekiq
```

### 8. Start the Rails server

```bash
rails server
```

The app will be available at [http://localhost:3000](http://localhost:3000).

## Default Seed Accounts

| Role    | Username  | Password |
|---------|-----------|----------|
| Teacher | `teacher` | `123`    |
| Student | `student` | `123`    |

The teacher account comes preloaded with 3 sample quizzes: **Biology Test**, **History Quiz**, and **Mathematics Challenge**.

## Running Tests

```bash
bundle exec rails test
```

## Tech Stack

- **Rails 7** with Hotwire (Turbo + Stimulus)
- **Tailwind CSS** for styling
- **Slim** templates
- **Rolify** for role management
- **Action Policy** for authorization
- **Pagy** for pagination
- **Sidekiq + Redis** for background jobs
- **SQLite3** for development database
